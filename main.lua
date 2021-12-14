local CircularProgressBar = require "circularProgressBar"

local progressBar = CircularProgressBar.new({scale = 2})
progressBar:count(5000, function()
    print("CircularProgressBar Done.")
end)
--[[
    working as progressbar
    local value = 1
    local dir = 1
    progressBar.isProgressBar = true
    timer.performWithDelay(25, function()
        if value > 100 then
            dir = -1
        end
        value = value + 1 * dir

        progressBar:setValue(value)
    
    end, 202)
]]

