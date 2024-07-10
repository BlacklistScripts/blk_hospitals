return {
    Interaction = {
        type = "target", -- "marker" : "target"
        
        Marker = { -- Ignore if using target
            type = 27, -- https://docs.fivem.net/docs/game-references/markers/
            color = { r = 26, g = 153, b = 26}, -- https://g.co/kgs/npUqed1
            size = { x = 1.0, y = 1.0, z = 1.0}
        },

        Target = { -- Ignore if using marker
            radius = 3.0,
            icon = "fas fa-suitcase-medical", -- https://fontawesome.com/icons
            distance = 2.0
        }
    },

    Notify = {
        msg = "You are perfectly fine, why are you here?" -- Displays if player is max health (doesnt need healing)
    },

    Progbar = {
        msg = "Patching you up..", -- Shows on the progress bar whilst healing the player

        Animation = { -- Plays whilst healing player
            enabled = false, -- true: false
            dict = '', --https://forge.plebmasters.de/animations/
            clip = ''
        }
    },

    Hospitals = {
        Eclipse_Med_Tower = {   -- Name doesnt matter
            loc = vec3(-676.7454, 313.2078, 82.0841),
            Ped = { -- Ignore if using marker
                enabled = true, -- If a ped should be spawned for targeting.
                heading = 175.5198,
                model = "s_m_m_doctor_01", -- https://docs.fivem.net/docs/game-references/ped-models
                scenario = "WORLD_HUMAN_CLIPBOARD", -- Set to "false" for no scenario. https://pastebin.com/6mrYTdQv (Sometimes doesnt work with female peds)
            },
            Blip = {
                enabled = true,
                label = "Medical Center",
                type = 51, -- https://docs.fivem.net/docs/game-references/blips/#blips
                color = 2, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.8
            }
        }
    }
}