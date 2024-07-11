local Config = lib.require('config')

if Config.Framework ~= "ESX" then return end

local ESX = exports['es_extended']:getSharedObject()

function  Medics()
    local medics = ESX.GetExtendedPlayers('job', Config.AmbulanceJob)
    return #medics
end