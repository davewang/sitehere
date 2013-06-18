
local Levels = {}

local levelsData = {}

levelsData[1] = {
    currentStarCount = 30,
    cols = 4,
    grid = {
        {1, 1, 1, 1},
        {1, 1, 0, 1},
        {1, 0, 0, 0},
        {1, 1, 0, 1}
    },
    isLock = false
}

levelsData[2] = {
    currentStarCount = 0,
    unLockStarCount=30,
    cols = 4,
    grid = {
        {1, 0, 1, 1},
        {0, 0, 1, 1},
        {1, 1, 0, 0},
        {1, 1, 0, 1}
    },
    isLock = true
}

levelsData[3] = {
    currentStarCount = 0,
    unLockStarCount=30,
    cols = 4,
    grid = {
        {0, 0, 0, 0},
        {0, 1, 1, 0},
        {0, 1, 1, 0},
        {0, 0, 0, 0}
    } ,
    isLock = true
}

levelsData[4] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {0, 1, 1, 1},
        {1, 0, 0, 1},
        {1, 0, 1, 1},
        {1, 1, 1, 1}
    },
    isLock = true
}

levelsData[5] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {1, 0, 0, 1},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {1, 0, 0, 1}
    },
    isLock = true
}

levelsData[6] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {1, 0, 0, 1},
        {0, 1, 1, 0},
        {0, 1, 1, 0},
        {1, 0, 0, 1}
    } ,
    isLock = true
}

levelsData[7] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {0, 1, 1, 1},
        {1, 0, 1, 1},
        {1, 1, 0, 1},
        {1, 1, 1, 0}
    } ,
    isLock = true
}

levelsData[8] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {1, 0, 0, 1},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {1, 0, 0, 1}
    } ,
    isLock = true
}

levelsData[9] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {1, 0, 0, 1},
        {0, 1, 1, 0},
        {0, 1, 1, 0},
        {1, 0, 0, 1}
    },
    isLock = true
}

levelsData[10] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {0, 1, 1, 1},
        {1, 0, 1, 1},
        {1, 1, 0, 1},
        {1, 1, 1, 0}
    } ,
    isLock = true
}
levelsData[11] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {0, 1, 1, 1},
        {1, 0, 1, 1},
        {1, 1, 0, 1},
        {1, 1, 1, 0}
    },
    isLock = true
}
levelsData[12] = {
    currentStarCount = 0,
    unLockStarCount=30,
    grid = {
        {0, 1, 1, 1},
        {1, 0, 1, 1},
        {1, 1, 0, 1},
        {1, 1, 1, 0}
    }  ,
    isLock = true,
    isNew = true
}

function Levels.numLevels()
    return #levelsData
end

function Levels.get(levelIndex)
    assert(levelIndex >= 1 and levelIndex <= #levelsData, string.format("levelsData.get() - invalid levelIndex %s", tostring(levelIndex)))
    return clone(levelsData[levelIndex])
end

return Levels
