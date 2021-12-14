local CircularProgressBar = require "circularProgressBar"

local progressBar = CircularProgressBar.new({scale = 2})
progressBar:count(5000, function ()
    print("CircularProgressBar Completed.")
end)