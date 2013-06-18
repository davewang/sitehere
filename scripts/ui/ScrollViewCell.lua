
local ScrollViewCell = class("ScrollViewCell", function(contentSize)
    local node = display.newLayer() -- display.newNode()
    if contentSize then node:setContentSize(contentSize) end
    node:registerNodeEvent()
    require("framework.client.api.EventProtocol").extend(node)
    return node
end)

function ScrollViewCell:onTouch(event, x, y)
    CCLuaLog("ScrollViewCell------began event "..tostring(event))
end

function ScrollViewCell:onTap(x, y)
end

function ScrollViewCell:onExit()
    self:removeAllEventListeners()
end
function ScrollViewCell:onEnter()
    CCLuaLog("ScrollViewCell------onEnter ")
    self:addTouchEventListener(function(event, x, y)
        return self:onTouch(event, x, y)
    end)
    self:setTouchEnabled(true)
end

return ScrollViewCell
