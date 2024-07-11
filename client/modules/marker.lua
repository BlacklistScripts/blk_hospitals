local Config = lib.require('config')

if Config.Interaction.type ~= "marker" then return end

function loadInteractions()
    createBlips()

    for k, v in pairs(Config.Hospitals) do
        local point = lib.points.new({
            coords = v.loc,
            distance = 5,
        })


        function point:nearby()
            DrawMarker(Config.Interaction.Marker.type, v.loc, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Interaction.Marker.size.x, Config.Interaction.Marker.size.y, Config.Interaction.Marker.size.z,  Config.Interaction.Marker.color.r, Config.Interaction.Marker.color.g, Config.Interaction.Marker.color.b, 200, false, true, 2.0, false, false, false, false)

            local onScreen, _x, _y = World3dToScreen2d(v.loc.x, v.loc.y, v.loc.z + 1)
            if onScreen then
                SetTextScale(0.0, 0.4)
                SetTextFont(4)
                SetTextProportional(1)
                SetTextColour(255, 255, 255, 255)
                SetTextOutline()
                SetTextCentre(1)
                SetTextEntry("STRING")
                AddTextComponentString("PRESS [~g~E~w~] TO CHECK IN")
                DrawText(_x, _y)
            end

            if self.currentDistance < 3 and IsControlJustReleased(0, 38) then
                checkIn(v.MaxMedic)
            end
        end
    end
end