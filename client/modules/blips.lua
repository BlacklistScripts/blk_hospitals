local Config = lib.require('config')

function createBlips()
    for k, v in pairs(Config.Hospitals) do
        local blip = v.Blip
        
        if not blip.enabled then return end

        blip.blip = AddBlipForCoord(v.loc)
        SetBlipSprite(blip.blip, blip.type)
        SetBlipDisplay(blip.blip, 2)
        SetBlipScale(blip.blip, blip.scale)
        SetBlipColour(blip.blip, blip.color)
        SetBlipAsShortRange(blip.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.label)
        EndTextCommandSetBlipName(blip.blip)
    end
end