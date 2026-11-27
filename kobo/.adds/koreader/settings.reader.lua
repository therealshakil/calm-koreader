-- calm starting settings for KOReader.
-- Only a few keys; KOReader fills in the rest with its own defaults on first launch.
-- Every one of these can be changed later from the menus.
return {
    -- Book text in calm's body face.
    ["cre_font"] = "Atkinson Hyperlegible",
    -- A little more air between lines than the default 100.
    ["copt_line_spacing"] = 115,
    -- Wider side margins for a calmer line length; a touch more top and bottom.
    ["copt_h_page_margins"] = { [1] = 30, [2] = 30 },
    ["copt_t_page_margin"] = 20,
    ["copt_b_page_margin"] = 20,
    -- Slightly heavier text: colour e-ink reads grey at the default weight.
    ["copt_font_base_weight"] = 0.5,
    -- Use the chosen face, not the book's own embedded fonts.
    ["copt_embedded_fonts"] = 0,

    -- The library starts at the top of the Kobo's storage.
    ["home_dir"] = "/mnt/onboard",
    -- Project: Title replaces Cover Browser; it won't load while Cover Browser is on.
    ["plugins_disabled"] = { ["coverbrowser"] = true },

    -- Sleep screen: the book's cover, with one quiet line along the bottom.
    ["screensaver_type"] = "cover",
    ["screensaver_show_message"] = true,
    ["screensaver_message"] = "this'll keep.",
    ["screensaver_message_container"] = "banner",
    ["screensaver_message_vertical_position"] = 8,
    ["screensaver_msg_background"] = "white",
    ["screensaver_img_background"] = "white",
}
