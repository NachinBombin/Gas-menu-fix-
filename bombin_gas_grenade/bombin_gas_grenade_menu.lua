--[[-------------------------------------------------------------------------
    Bombin Gas Grenade - Client Options Panel

    Found in: Options -> Bombin Addons -> Gas Grenade

    Uses the native ControlPanel helpers (panel:NumSlider, panel:CheckBox,
    panel:Help) bound directly to FCVAR_REPLICATED ConVars — the same
    proven pattern as the NPC Incendiary Bullets addon.  No net messages needed.
---------------------------------------------------------------------------]]

local ADDON_TITLE    = "Gas Grenade"
local ADDON_CATEGORY = "Bombin Addons"

local function BuildGasGrenadeOptions()
    spawnmenu.AddToolMenuOption("Options", ADDON_CATEGORY, "BombinGasGrenadePanel", ADDON_TITLE, "", "", function(panel)
        panel:ClearControls()

        -- ----------------------------------------------------------------
        -- Header
        -- ----------------------------------------------------------------
        panel:Help("BOMBIN GAS GRENADE")
        panel:Help(
            "Spawns a black HL2 grenade that releases dark grey gas.\\n" ..
            "Each spawn rolls a random gas size and duration between your min/max values.\\n" ..
            "The gas sound lasts for the full emission and fades in the last 5 seconds."
        )

        -- ----------------------------------------------------------------
        -- Random settings
        -- ----------------------------------------------------------------
        panel:Help("\\n-----  Random Roll Settings  -----")
        panel:NumSlider("Min Gas Size", "bombingasgminsize", 0.10, 10, 2)
        panel:ControlHelp("Lowest random size multiplier allowed on spawn.")

        panel:NumSlider("Max Gas Size", "bombingasgmaxsize", 0.10, 10, 2)
        panel:ControlHelp("Highest random size multiplier allowed on spawn.")

        panel:NumSlider("Min Gas Duration (seconds)", "bombingasgminduration", 1, 300, 1)
        panel:ControlHelp("Shortest random gas duration.")

        panel:NumSlider("Max Gas Duration (seconds)", "bombingasgmaxduration", 1, 300, 1)
        panel:ControlHelp("Longest random gas duration.")

        -- ----------------------------------------------------------------
        -- Smoke settings
        -- ----------------------------------------------------------------
        panel:Help("\\n-----  Smoke Settings  -----")
        panel:NumSlider("Base Spread", "bombingasgbasespread", 0, 256, 0)
        panel:ControlHelp("Starting width of the gas.")

        panel:NumSlider("Spread Speed", "bombingasgspreadspeed", 0, 256, 0)
        panel:ControlHelp("How quickly the gas widens.")

        panel:NumSlider("Speed", "bombingasgspeed", 1, 256, 0)
        panel:ControlHelp("How fast the gas travels.")

        panel:NumSlider("Start Size", "bombingasgstartsize", 1, 256, 0)
        panel:ControlHelp("Particle size at the source.")

        panel:NumSlider("End Size", "bombingasgendsize", 1, 512, 0)
        panel:ControlHelp("Particle size later in the plume.")

        panel:NumSlider("Rate", "bombingasgrate", 1, 256, 0)
        panel:ControlHelp("How dense the emission is.")

        panel:NumSlider("Jet Length", "bombingasgjetlength", 1, 1024, 0)
        panel:ControlHelp("How far the gas can project.")

        panel:NumSlider("Wind Angle", "bombingasgwindangle", -180, 180, 0)
        panel:ControlHelp("Direction of wind influence.")

        panel:NumSlider("Wind Speed", "bombingasgwindspeed", 0, 256, 0)
        panel:ControlHelp("Strength of wind influence.")

        panel:NumSlider("Twist", "bombingasgtwist", -360, 360, 0)
        panel:ControlHelp("Spiral motion in the smoke.")

        panel:NumSlider("Roll", "bombingasgroll", -360, 360, 0)
        panel:ControlHelp("Roll variation in the smoke.")

        -- ----------------------------------------------------------------
        -- Appearance
        -- ----------------------------------------------------------------
        panel:Help("\\n-----  Gas Appearance  -----")
        panel:NumSlider("Gas Red", "bombingasgcolorr", 0, 255, 0)
        panel:ControlHelp("Red color channel.")

        panel:NumSlider("Gas Green", "bombingasgcolorg", 0, 255, 0)
        panel:ControlHelp("Green color channel.")

        panel:NumSlider("Gas Blue", "bombingasgcolorb", 0, 255, 0)
        panel:ControlHelp("Blue color channel.")

        panel:NumSlider("Gas Alpha", "bombingasgrenderamt", 1, 255, 0)
        panel:ControlHelp("Opacity. Higher values are less transparent.")

        -- ----------------------------------------------------------------
        -- Sound
        -- ----------------------------------------------------------------
        panel:Help("\\n-----  Sound  -----")
        panel:NumSlider("Sound Volume", "bombingasgsoundvolume", 0, 1, 2)
        panel:ControlHelp("Base loop volume before the last 5-second fade.")

        panel:NumSlider("Sound Pitch", "bombingasgsoundpitch", 60, 180, 0)
        panel:ControlHelp("Pitch of the gas loop.")

    end)
end

hook.Add("PopulateToolMenu", "BombinGasGrenadeAddOptionsMenu", BuildGasGrenadeOptions)
