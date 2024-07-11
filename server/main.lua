lib.callback.register("blk_hospital:getMedics", function(source)
    local medics = Medics()
    return medics or 0
end)