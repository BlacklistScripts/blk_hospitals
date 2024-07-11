local Config = lib.require('config')

if Config.Framework ~= "QB" then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Medics()
    local players = QBCore.Functions.GetQBPlayers()
    local medics = 0
    for _, xPlayer in pairs(players) do
      if xPlayer.PlayerData.job.name == Config.AmbulanceJob then
        medics = medics + 1
      end
    end
    return medics
end