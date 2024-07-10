local Config = lib.require('config')
local stevo_lib = exports['stevo_lib']:import()

function checkIn()
    local hlth = GetEntityHealth(PlayerPedId())
    local maxHlth = GetEntityMaxHealth(PlayerPedId())
    local timer = maxHlth - hlth
    if hlth == maxHlth then 
            stevo_lib.Notify(Config.Notify.msg, 'error')
        return
    end

    local progBar = {
        duration = timer * 500,
        label = Config.Progbar.msg,
        useWhileDead = true,
        canCancel = true,
        disable = {
            move = true,
            combat = true
        },
        anim = {}
    }

    if Config.Progbar.Animation.enabled then
        table.insert(progressBarData.anim, { dict = Config.Progbar.dict })
        table.insert(progressBarData.anim, { clip = Config.Progbar.clip })
    end

    if lib.progressBar(progBar) then
        SetEntityHealth(PlayerPedId(), maxHlth)
    end
end

AddEventHandler('stevo_lib:playerLoaded', function()
    loadInteractions()
end)

AddEventHandler('onResourceStart', function()
    loadInteractions()
end)