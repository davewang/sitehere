
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()

    self.bg = display.newBackgroundSprite("#封面@2x.jpg")
    self:addChild(self.bg)

    local menuleft = 240
    -- create menu
    self.levelButton =  ui.newImageMenuItem({
        image = "#sitehere-a@2x.png",
        imageSelected = "#sitehere-h@2x.png",
        imageDisabled = "#sitehere-a@2x.png",
        x = display.left + menuleft,
        y = display.bottom + 90,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            game.enterChooseLevelScene()
        end,
    })
    self.pvpButton =  ui.newImageMenuItem({
        image = "#网络对战暗@2x.png",
        imageSelected = "#网络对战亮@2x.png",
        imageDisabled = "#网络对战暗@2x.png",
        x = display.left + menuleft*2,
        y = display.bottom + 90,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("levelButton----------------------")
        end,
    })
    self.storeButton =  ui.newImageMenuItem({
        image = "#商店@2x.png",
        imageSelected = "#商店亮@2x.png",
        imageDisabled = "#商店@2x.png",
        x = display.left + menuleft*3,
        y = display.bottom + 90,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            CCLuaLog("levelButton----------------------")
        end,
    })

    self.settingButton =  ui.newImageMenuItem({
        image = "#设置.png",
        imageSelected = "#设置.png",
        imageDisabled = "#设置.png",
        x = display.right - 50,
        y = display.bottom + 85,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        sound = nil,
        listener = function()
            game.enterSettingScene()

        end,
    })



    self.menu = ui.newMenu({self.levelButton,self.pvpButton,self.storeButton,self.settingButton})
    self:addChild(self.menu)



--    -- 定义 User 的构造函数
--    local function ctor(self, properties)
--    end
--
--    -- 创建 User 类
--    local ModelBase = require("framework.shared.ModelBase")
--    local User = class("User", ctor, ModelBase)
--
--    -- schema 指定对象有哪些属性，以及属性的类型和默认值
--    User.schema = {
--        id       = {"string"},      -- id 存储用户 ID
--        username = {"string"},      -- username 存储用户名
--        scores   = {"number", 0},   -- scores 存储用户的得分，默认为 0
--    }
--
--    -- fields 指定对象的哪些属性要存入数据库
--    -- 如果未指定 fields，则对象的数据库操作被禁用
--    User.fields = {"id", "username", "scores" }

    local properties = {
        id       = "user:1",
        username = "dualface",
    }

    local User = require("data.User")
    local user =  User.new(properties)
    CCLuaLog("user.name= "..user.username)
--    local redis = require("framework.server.RedisEasy")
--     redis:save(user)
--    local user1 = redis:load(User, "user:1")
--    CCLuaLog("user"..user1.name)

--    self.layer:registerScriptTouchHandler(
--        function(event, x, y)
--            return self:onTouch(event,x,y)
--        end,true
--    )

end

--function MainScene:onTouch(event, x, y)
--    CCLuaLog("MainScene------began event "..tostring(event))
--end



function MainScene:onEnter()
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

return MainScene
