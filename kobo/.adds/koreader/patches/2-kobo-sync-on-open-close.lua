-- Keep reading progress in step with the Kobo's own reader, with no taps.
-- Needs kobo.koplugin with sideloaded-book sync (merged 2026-11-14, PR #223) and its
-- "Sync reading state with Kobo" on. It uses the plugin's own sync, so its rules apply:
-- newer progress wins, older never overwrites (as set in the plugin's sync behaviour).
--
-- On KOReader start: two-way sync for every calibre book with progress on either side.
-- On closing a book: that book's KOReader progress goes to the Kobo reader.

local DocSettings = require("docsettings")
local UIManager = require("ui/uimanager")
local logger = require("logger")

local ONBOARD = "/mnt/onboard/"

local function plugin()
    for _, mod in ipairs({ "apps/reader/readerui", "apps/filemanager/filemanager" }) do
        local ok, app = pcall(require, mod)
        local p = ok and app.instance and app.instance.kobo_plugin
        if p and p.reading_state_sync and p.reading_state_sync:isEnabled() then
            return p
        end
    end
end

-- On start: both ways, for books read on either side.
UIManager:scheduleIn(2, function()
    local p = plugin()
    if not p then return end
    local ok, err = pcall(function()
        local count = 0
        for _, book in ipairs(p.metadata_parser:getSideloadedBooks()) do
            local kobo_read = book.metadata and (book.metadata.percent_read or 0) > 0
            if book.filepath and (kobo_read or DocSettings:hasSidecarFile(book.filepath)) then
                if p.reading_state_sync:syncBook(book) then count = count + 1 end
            end
        end
        if count > 0 then p.reading_state_sync:invalidateMetadataCaches() end
        logger.info("kobo-sync-on-open-close: synced", count, "books on start")
    end)
    if not ok then logger.warn("kobo-sync-on-open-close: start sync failed:", err) end
end)

-- On close: this book, with the same newer-wins check (in practice, KOReader's progress goes to the Kobo).
local ReaderUI = require("apps/reader/readerui")
local orig_onClose = ReaderUI.onClose
ReaderUI.onClose = function(self, ...)
    local file = self.document and self.document.file
    local doc_settings = self.doc_settings
    local p = plugin()
    local result = orig_onClose(self, ...)
    if p and file and doc_settings and file:sub(1, #ONBOARD) == ONBOARD then
        local ok, err = pcall(function()
            p.reading_state_sync:syncBidirectional("file://" .. file, doc_settings)
        end)
        if not ok then logger.warn("kobo-sync-on-open-close: close sync failed:", err) end
    end
    return result
end
