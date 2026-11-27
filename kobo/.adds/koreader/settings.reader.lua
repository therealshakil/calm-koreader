-- calm starting settings for KOReader, set to read like the Kobo's own reader.
-- Only a few keys; KOReader fills in the rest with its own defaults on first launch.
-- Every one of these can be changed later from the menus.
return {
    -- Books use their own fonts, as the Kobo reader can; Libron is for books with none.
    ["cre_font"] = "Libron",
    ["copt_embedded_fonts"] = 1,
    -- Line height 1.1, as in the Kobo reader.
    ["copt_line_spacing"] = 110,
    -- Slightly heavier text: colour e-ink reads grey at the default weight.
    ["copt_font_base_weight"] = 0.5,

    -- The library starts at the top of the Kobo's storage, on Bookshelf.
    -- Bookshelf needs Cover Browser, so no plugins are disabled.
    ["home_dir"] = "/mnt/onboard",
    ["start_with"] = "bookshelf",

    -- Sleep screen: the book's cover, with one quiet line along the bottom.
    ["screensaver_type"] = "cover",
    ["screensaver_show_message"] = true,
    ["screensaver_message"] = "this'll keep.",
    ["screensaver_message_container"] = "banner",
    ["screensaver_message_vertical_position"] = 8,
    ["screensaver_msg_background"] = "white",
    ["screensaver_img_background"] = "white",
}
