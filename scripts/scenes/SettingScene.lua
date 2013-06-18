
local SettingScene = class("SettingScene", function()
    return display.newScene("SettingScene")
end)

function SettingScene:ctor()
    self.bg = display.newBackgroundSprite("#月份背景@2x.jpg")
    self:addChild(self.bg)
    local fontsize = 55
    -- create menu
    self.weiBoAccountButton =  ui.newTTFLabelMenuItem({
        text="微博账号操作",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            game.enterChooseLevelScene()
        end,
    })
    self.headPicButton =  ui.newTTFLabelMenuItem({
        text="头像设置",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("levelButton----------------------")
        end,
    })
    self.feedbackButton =  ui.newTTFLabelMenuItem({
        text="反馈",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("levelButton----------------------")
        end,
    })

    self.markScoreButton =  ui.newTTFLabelMenuItem({
        text="去給游戏评分",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("setting  ----------------------")
        end,
    })
    self.shareTopic =  ui.newTTFLabelMenuItem({
        text="贡献题目",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("setting  ----------------------")
        end,
    })
    self.aboutUsButton =  ui.newTTFLabelMenuItem({
        text="关于我们",
        size=fontsize,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("setting  ----------------------")
        end,
    })


    self.menu = ui.newMenu({  self.weiBoAccountButton,self.headPicButton,self.feedbackButton,self.markScoreButton,self.shareTopic,self.aboutUsButton})
    self.menu:alignItemsVertically()
    self.menu:setPosition(ccp(display.width/2, display.height/2));
    self:addChild(self.menu)


    local backButton = ui.newImageMenuItem({
        image = "#返回@2x.png",
        imageSelected = "#返回亮@2x.png",
        x = display.left + 70,
        y = display.bottom + 70,
        listener = function()
            self:backToMenuScene()
        end,
    })

    self.backMenu = ui.newMenu({backButton})
    self:addChild(self.backMenu)

end



function SettingScene:backToMenuScene()
    game.enterMainScene()
end

function SettingScene:onEnter()
    if device.platform ~= "android" then return end

    -- avoid unmeant back
    self:performWithDelay(function()
    -- keypad layer, for android
        local layer = display.newLayer()
        layer:addKeypadEventListener(function(event)
            if event == "back" then game.exit() end
        end)
        self:addChild(layer)

        layer:setKeypadEnabled(true)
    end, 0.5)
end

return SettingScene