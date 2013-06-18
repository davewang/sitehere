
local ScrollViewCell = require("ui.ScrollViewCell")
local LevelsListCell = class("LevelsListCell", ScrollViewCell)

function LevelsListCell:ctor(size, beginLevelIndex, endLevelIndex, rows, cols)
    --local rowHeight = math.floor((display.height - 340) / rows)
    local rowHeight = math.floor((display.height - 280) / rows)
    local colWidth = math.floor(display.width * 0.9 / cols)

    local batch = display.newBatchNode(GAME_TEXTURE_IMAGE_All_FILENAME)
    self:addChild(batch)
    self.pageIndex = pageIndex
    self.buttons = {}

    local startX = (display.width - colWidth * (cols - 1)) / 2
    local y = display.top - 220
    local levelIndex = beginLevelIndex

    for row = 1, rows do
        local x = startX
        for column = 1, cols do

            local currentLevelsData = require("data.Levels").get(levelIndex)
            local icon
            if currentLevelsData.isLock then
                icon = display.newSprite("#月份按钮锁定背景@2x.png", x, y)
            else
                icon = display.newSprite("#月份未点中暗@2x.png", x, y)
            end;
            if currentLevelsData.isNew then
                local newMark = display.newSprite("#更新标记@2x.png", x+80, y+60)

                self:addChild(newMark)
            end;


            --local icon = display.newSprite("#月份未点中暗@2x.png", x, y)
            batch:addChild(icon)
            icon.levelIndex = levelIndex
            self.buttons[#self.buttons + 1] = icon

            local label = ui.newBMFontLabel({
                text  = tostring("第"..Number_CN[levelIndex].."季"),
                font  = "quarter.fnt",
                x     = x,
                y     = y - 4,
                align = ui.TEXT_ALIGEN_CENTER,
            })
            label:setScale(0.8)



            self:addChild(label)

            x = x + colWidth
            levelIndex = levelIndex + 1
            if levelIndex > endLevelIndex then break end
        end

        y = y - rowHeight
        if levelIndex > endLevelIndex then break end
    end

    -- add highlight level icon
    self.highlightButton = display.newSprite("#月份点中亮@2x.png")
    self.highlightButton:setVisible(false)
    self:addChild(self.highlightButton)





end

function LevelsListCell:onTouch(event, x, y)

    CCLuaLog("------began event "..tostring(event))
    if event == "began" then
        local button = self:checkButton(x, y)
        if button then

            self.highlightButton:setVisible(true)
            self.highlightButton:setPosition(button:getPosition())
        end
        return true
    elseif event ~= "moved" then
        self.highlightButton:setVisible(false)
        return true
    end
    return true
end

function LevelsListCell:onTap(x, y)
    CCLuaLog("------onTap event ")
    local button = self:checkButton(x, y)
    if button then
        self:dispatchEvent({name = "onTapLevelIcon", levelIndex = button.levelIndex})
    end
end

function LevelsListCell:checkButton(x, y)
    local pos = ccp(x, y)
    for i = 1, #self.buttons do
        local button = self.buttons[i]
        if button:boundingBox():containsPoint(pos) then
            return button
        end
    end
    return nil
end

return LevelsListCell
