local activePiano = nil

local function stopPiano()
    ClearPedTasks(PlayerPedId())
    lib.hideTextUI()

    activePiano = nil
end

local function startPiano(piano)
    if activePiano then
        return
    end

    if not piano or piano == 0 or not DoesEntityExist(piano) then
        return
    end

    local ped = PlayerPedId()
    activePiano = piano

    local seatOffset = Config.DefaultPianoSeatOffset
    local pianoModel = GetEntityModel(piano)

    for modelName, modelOffset in pairs(Config.PianoSeatOffsets) do
        if GetHashKey(modelName) == pianoModel then
            seatOffset = modelOffset
            break
        end
    end

    local pos = GetOffsetFromEntityInWorldCoords(
        piano,
        seatOffset.x,
        seatOffset.y,
        seatOffset.z
    )

    local heading = GetEntityHeading(piano) + seatOffset.heading

    local scenarioName

    if IsPedMale(ped) then
        scenarioName = 'PROP_HUMAN_PIANO'
    else
        scenarioName = 'PROP_HUMAN_ABIGAIL_PIANO'
    end

    ClearPedTasksImmediately(ped)

    TaskStartScenarioAtPosition(
        ped,
        GetHashKey(scenarioName),
        pos.x,
        pos.y,
        pos.z,
        heading,
        -1,
        true,
        false
    )

    lib.showTextUI('[BACKSPACE] Aufstehen', {
        position = 'left-center'
    })

    CreateThread(function()
        local startedAt = GetGameTimer()

        -- Auf Scenario-Start warten und dabei schon den Ausstieg erlauben.
        while activePiano == piano and not IsPedUsingAnyScenario(ped) do
            if IsControlJustPressed(0, 0x156F7119)
                or GetGameTimer() - startedAt > 5000 then
                stopPiano()
                return
            end

            Wait(0)
        end

        -- Scenario überwachen und bei BACKSPACE oder Scenario-Ende aufräumen.
        while activePiano == piano and IsPedUsingAnyScenario(ped) do
            if IsControlJustPressed(0, 0x156F7119) then
                stopPiano()
                return
            end

            Wait(0)
        end

        if activePiano == piano then
            stopPiano()
        end
    end)
end

CreateThread(function()
    exports.ox_target:addModel(Config.Piano, {
        {
            name = 'mo_piano_play',
            icon = 'fa-solid fa-music',
            label = 'Klavier spielen',
            distance = 1.0,

            canInteract = function()
                return activePiano == nil
            end,

            onSelect = function(data)
                startPiano(data.entity)
            end
        }
    })
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        if activePiano then
            ClearPedTasks(PlayerPedId())
            activePiano = nil
        end

        lib.hideTextUI()
        exports.ox_target:removeModel(Config.Piano, 'mo_piano_play')
    end
end)