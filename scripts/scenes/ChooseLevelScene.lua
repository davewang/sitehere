
local ChooseLevelScene = class("ChooseLevelScene", function()
    return display.newScene("ChooseLevelScene")
end)

function ChooseLevelScene:ctor()

    -- make background sprite always align top
    self.bg = display.newBackgroundSprite("#月份背景@2x.jpg")
    self:addChild(self.bg)




    --create levels list
    local rect = CCRect(display.left, display.bottom + 60, display.width, display.height - 150)
    self.levelsList = require("views.LevelsList").new(rect)
    self.levelsList:addEventListener("onTapLevelIcon", function(event)
        return self:onTapLevelIcon(event)
    end)
    self:addChild(self.levelsList)


    -- create menu


    local backButton = ui.newImageMenuItem({
        image = "#返回@2x.png",
        imageSelected = "#返回亮@2x.png",
        x = display.left + 70,
        y = display.bottom + 70,
        listener = function()
            self.layer:setKeypadEnabled(false)
            self:backToMenuScene()
        end,
    })

    local menu = ui.newMenu({unlockAllButton, backButton})
    self:addChild(menu)

    -- keypad layer, for android
    self.layer = display.newLayer()
    self.layer:addKeypadEventListener(function(event)
        if event == "back" then
            audio.playSound(GAME_SFX.backButton)
            self.layer:setKeypadEnabled(false)
            self:backToMenuScene()
        end
    end)
    self:addChild(self.layer)
end

function ChooseLevelScene:onTapLevelIcon(event)
    --audio.playSound(GAME_SFX.tapButton)
    CCLuaLog("levelIndex = "..event.levelIndex)
end

function ChooseLevelScene:backToMenuScene()
    game.enterMainScene()
end

function ChooseLevelScene:onEnter()
    self.levelsList:setTouchEnabled(true)

    -- avoid unmeant back
    self:performWithDelay(function()
        self.layer:setKeypadEnabled(true)
    end, 0.5)
end

return ChooseLevelScene
