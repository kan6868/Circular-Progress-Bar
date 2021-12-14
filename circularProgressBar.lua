local M = {}
local dir = "images/"
local ext = ".png"
function M.new(options)

    local options = options or {}

    local parent        = options.parent or display.newGroup()
    local scale         = options.scale or 1
    local x             = options.x or display.contentCenterX
    local y             = options.y or display.contentCenterY
    local timeCount     = options.time or 5000
    local onComplete    = options.onComplete or function() end
    
    local group = display.newGroup()
    parent:insert(group)
    group.x, group.y = x, y
    group:scale(scale, scale)
    local bg = display.newImageRect(group, dir.. "bg" .. ext, 128, 128)

    local contentRight = display.newImageRect(group, dir .. "content" .. ext, 128, 128)
    contentRight.rotation = -180
    local contentLeft = display.newImageRect(group, dir .. "content" .. ext, 128, 128)
    contentLeft.xScale = -1
    contentLeft.rotation = -180
    contentLeft.alpha = 0

    local cover = display.newImageRect(group, dir .. "cover_content" .. ext, 128, 128)
    
    -- local fg = display.newImageRect(group, dir .. "fg" .. ext, 512, 512)
    
    local center = display.newImageRect(group, dir .. "center" .. ext, 128, 128)
    
    -- local icon = display.newImageRect(group, dir .. "icon" .. ext, 512, 512) -- icon

    function group:count(time, onComplete)
        group:show()
        local time = time or 5000
        local onComplete = onComplete or function() end
        transition.to(contentRight, {"circularProgressBar", time = time/2, rotation = 0, onComplete = function()
            contentLeft.alpha = 1
            cover.alpha = 0
            transition.to(contentLeft, {"circularProgressBar", time = time/2, rotation = 0, onComplete = onComplete})
        end})
    end
  
    function group:hide()
        if not self.isShow then return false end
        self.isShow = false
        self.alpha = 0
        transition.cancel("circularProgressBar")
    end

    function group:show()
        if self.isShow then return false end
        self.isShow = true
        self.alpha = 1
    end

    function group:setPosition(x, y)
        self.x, self.y = x, y
    end

    return group
end

return M