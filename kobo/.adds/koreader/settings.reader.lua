-- calm starting settings for KOReader.
-- Only a few keys; KOReader fills in the rest with its own defaults on first launch.
-- Every one of these can be changed later from the menus.
return {
    -- Book text in calm's body face.
    ["cre_font"] = "Atkinson Hyperlegible",
    -- A little more air between lines than the default 100.
    ["copt_line_spacing"] = 115,

    -- Sleep screen: the book's cover, with one quiet line along the bottom.
    ["screensaver_type"] = "cover",
    ["screensaver_show_message"] = true,
    ["screensaver_message"] = "this'll keep.",
    ["screensaver_message_container"] = "banner",
    ["screensaver_message_vertical_position"] = 8,
    ["screensaver_msg_background"] = "white",
    ["screensaver_img_background"] = "white",
}
