local Config = lib.require('config')
local stevo_lib = exports['stevo_lib']:import()

if Config.Interaction.type ~= "target" then return end

function loadInteractions()
    createBlips()

    local entity
    for k, v in pairs(Config.Hospitals) do

        local options = {
            options = {
                {
                    icon = Config.Interaction.Target.icon,
                    label = "Check In",
                    distance = Config.Interaction.Target.distance,
                    num = 1,
                    action = function()
                        checkIn(v.MaxMedic)
                    end,
                },
            },
            distance = Config.Interaction.Target.radius,
            rotation = vec3(0.0,0.0,0.0)
        }
        
        if v.Ped.enabled then

            local point = lib.points.new({
                coords = v.loc,
                distance = 5,
            })

            function point:onEnter()
                local model = lib.requestModel(v.Ped.model)
                
                entity = CreatePed(3, model, v.loc, v.Ped.heading, false, true)
                
                if v.Ped.scenario then TaskStartScenarioInPlace(entity, v.Ped.scenario, 0, true) end
            
                SetModelAsNoLongerNeeded(model)
                FreezeEntityPosition(entity, true)
                SetEntityInvincible(entity, true)
                SetBlockingOfNonTemporaryEvents(entity, true)
            
                stevo_lib.target.AddTargetEntity(entity, options)
            end

            function point:onExit()
                exports.ox_target:removeLocalEntity(entity)
                DeletePed(entity)
            end


        else
            stevo_lib.target.AddBoxZone({
                coords = v.loc,
                size = vec3(1,1,1),
                options
            })
        end
    end
end