Config = {}

--[[
    Documentation:
        -- Function to display the text UI.
            -- @param text (string) The text to be displayed in the UI.
            -- @param key (string) [Optional] The key the player should press to interact.
            -- @param id (string) [Optional] An unique ID (to create multiple UIs).
            
            Examples: 
                TriggerEvent("rbTextUi:show", text)
                exports["rbTextUi"]:show(text)

                TriggerEvent("rbTextUi:show", text, key)
                exports["rbTextUi"]:show(text, key)

                TriggerEvent("rbTextUi:show", text, nil, id)
                exports["rbTextUi"]:show(text, nil, id)

                TriggerEvent("rbTextUi:show", text, key, id)
                exports["rbTextUi"]:show(text, key, id)

            Note: If 'key' or 'id' is not provided, default behavior is applied.

        -- Function to hide a UI element based on the provided ID.
            -- @param id (string) [Optional] The ID of the UI element to be closed.
            
            Examples:
                TriggerEvent("rbTextUi:hide")
                exports["rbTextUi"]:hide()
                
                TriggerEvent("rbTextUi:hide", id)
                exports["rbTextUi"]:hide(id)
]]

Config.Settings = {
    --[[
        'compatibility' values:
            nil: If you choose 'nil', ensure other textUi resources are removed or deactivated from your server.
            "luke_textui": Integrates Luke's textUi resource events.
            "cd_drawtextui": Integrates CD's DrawTextUI resource events.

        To use 'key' and 'ids' for creating multiple UIs, utilize our exports/events.
    ]]
    compatibility = "luke_textui",

    --[[
        'multipleUis' setting:
            If set to 'true', multiple UIs can be created without explicitly setting their IDs. 
            However, only one UI per resource is supported. If a second UI is created, it replaces the existing one.
    ]]
    multipleUis = true,

    --[[
        'sound' setting:
            When set to 'true', a popup sound is played. The sound file is located at rbTextUi/HTML/audio/open.mp3.
    ]]
    sound = true,

    --[[
        'side' values:
            Specify the positioning of the UI element: "top", "bottom", "right", or "left".
    ]]
    side = "right", 

    -- theme settings:
    theme = {
        background = "#1b1b1bcc", -- Background color of the UI element.
        key_background = "#FF8A00", -- Background color of the interaction key.
        text = "#FFF", -- Text color within the UI.
    },
}
