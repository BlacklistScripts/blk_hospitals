local Config = lib.require('config')

if Config.Framework ~= "ESX" then return end

local ESX = exports['es_extended']:getSharedObject()

function  Medics()
    return ESX.GetExtendedPlayers('job', Config.AmbulanceJob)
end