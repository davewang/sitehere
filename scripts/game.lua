
require("config")
require("framework.init")
require("framework.client.init")

-- define global module
game = {}

function game.startup()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")

    -- preload all sounds
    for k, v in pairs(GAME_SFX) do
        audio.preloadSound(v)
    end
    audio.playMusic(GAME_SFX.startBackGround,true);
    display.addSpriteFramesWithFile(GAME_TEXTURE_DATA_All_FILENAME, GAME_TEXTURE_IMAGE_All_FILENAME)
    display.addSpriteFramesWithFile(GAME_TEXTURE_DATA_BIG_All_FILENAME, GAME_TEXTURE_IMAGE_BIG_All_FILENAME)
    game.enterMainScene()
end

function game.exit()
    CCDirector:sharedDirector():endToLua()
end

function game.enterMainScene()
    display.replaceScene(require("scenes.MainScene").new(), "fade", 0.6, display.COLOR_WHITE)
end

function game.enterChooseLevelScene()
    display.replaceScene(require("scenes.ChooseLevelScene").new(), "FADE", 0.5, ccc3(255, 255, 255))
end

function game.enterSettingScene()
    display.replaceScene(require("scenes.SettingScene").new(), "FADE", 0.5, ccc3(255, 255, 255))
end