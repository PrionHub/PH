--==================================================
--==================== SERVICES ====================
--==================================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
--==================================================
--===================== THEMES =====================
--==================================================
local THEMES = {

    DEFAULT = {

        Primary = Color3.fromRGB(220,50,50),
        Secondary = Color3.fromRGB(120,0,0),

        TitleColor = Color3.fromRGB(255,255,255),
        TitleStroke = Color3.fromRGB(255,255,255),

        SubtitleColor = Color3.fromRGB(200,140,140),
        DividerColor = Color3.fromRGB(90,90,90),

        PulseDark = Color3.fromRGB(80,0,0),
        PulseBright = Color3.fromRGB(255,50,50),
        PulseLight = Color3.fromRGB(255,255,255),

        RadioOnColor = Color3.fromRGB(255,50,50),
        RadioOffColor = Color3.fromRGB(150,150,150),

        Accent = Color3.fromRGB(255,255,255),

        BackgroundImage = "119530457366231"
    },

	ICE = {
        Primary = Color3.fromRGB(120,220,255),
        Secondary = Color3.fromRGB(40,160,255),

        TitleColor = Color3.fromRGB(220,245,255),
        TitleStroke = Color3.fromRGB(120,220,255),
        SubtitleColor = Color3.fromRGB(140,220,255),
        DividerColor = Color3.fromRGB(120,220,255),

        PulseDark = Color3.fromRGB(40,120,180),
        PulseBright = Color3.fromRGB(120,220,255),
        PulseLight = Color3.fromRGB(255,255,255),

        RadioOnColor = Color3.fromRGB(120,220,255),
        RadioOffColor = Color3.fromRGB(150,150,150),

        Accent = Color3.fromRGB(220,245,255),
        BackgroundImage = "101914096234641"
    },

    FIRE = {
        Primary = Color3.fromRGB(255,70,70),
        Secondary = Color3.fromRGB(255,140,40),

        TitleColor = Color3.fromRGB(255,220,120),
        TitleStroke = Color3.fromRGB(255,100,40),
        SubtitleColor = Color3.fromRGB(255,140,80),
        DividerColor = Color3.fromRGB(255,120,60),

        PulseDark = Color3.fromRGB(120,20,20),
        PulseBright = Color3.fromRGB(255,80,40),
        PulseLight = Color3.fromRGB(255,220,120),

        RadioOnColor = Color3.fromRGB(255,120,60),
        RadioOffColor = Color3.fromRGB(150,150,150),

        Accent = Color3.fromRGB(255,220,120),
        BackgroundImage = "15072377512"
    },

    DRAGON = {
        Primary = Color3.fromRGB(180,80,255),
        Secondary = Color3.fromRGB(255,210,70),

        TitleColor = Color3.fromRGB(255,230,120),
        TitleStroke = Color3.fromRGB(180,80,255),
        SubtitleColor = Color3.fromRGB(210,170,255),
        DividerColor = Color3.fromRGB(180,80,255),

        PulseDark = Color3.fromRGB(80,30,140),
        PulseBright = Color3.fromRGB(180,80,255),
        PulseLight = Color3.fromRGB(255,210,70),

        RadioOnColor = Color3.fromRGB(180,80,255),
        RadioOffColor = Color3.fromRGB(150,150,150),

        Accent = Color3.fromRGB(255,255,255),
        BackgroundImage = "95777360902875"
    }

}
local currentThemeData = THEMES.DEFAULT
local solidThemes = {
    "DEFAULT",
	"ICE",
	"FIRE",
	"DRAGON"
}
--==================================================
--===================== ICONS ======================
--==================================================
-- ICONOS
local ICONS = {
	["Infinite Jump"] = "78465182536211",
	["Fullbright"] = "8509432937",
	["Noclip"] = "105011543514204",
	["Teleport"] = "10516012746",
	["Speed"] = "18446448769",
	["Coin Farm"] = "118604097741927",
	["Buy All"] = "2161586955",
	["Speed Battle X4"] = "91654254459533",
	["Infinite Roll"] = "232203094",
	["Re-Join"] = "108893626629860",
	["Server Hop"] = "92416323895079",
	["Ignored Items"] = "11284736452"
}
-- TAMAÃ‘O Y POSICION
local ICON_CONFIG = {
	["Infinite Jump"] = {size = 19, y = -9, x = -22},
	["Fullbright"] = {size = 24, y = -11, x = -22},
	["Noclip"] = {size = 29, y = -13, x = -24},
	["Teleport"] = {size = 24, y = -10, x = -22},
	["Speed"] = {size = 18, y = -9, x = -22},
	["Coin Farm"] = {size = 25, y = -12, x = -23},
	["Buy All"] = {size = 20, y = -10, x = -22},
	["Ignored Items"] = {size = 19, y = -10, x = -18},
	["Speed Battle X4"] = {size = 25, y = -10, x = -22},
	["Infinite Roll"] = {size = 26, y = -13, x = -22},
	["Re-Join"] = {size = 22, y = -10, x = -19},
	["Server Hop"] = {size = 24, y = -12, x = -19}
}
--==================================================
--==================== LICENSE =====================
--==================================================
local ALLOWED_GAME_ID = 10013403971

task.wait(2)

if game.GameId ~= ALLOWED_GAME_ID then

	local warningGui = Instance.new("ScreenGui")
	warningGui.Name = "LicenseWarning"
	warningGui.ResetOnSpawn = false
	warningGui.IgnoreGuiInset = true
    warningGui.DisplayOrder = 1000
	warningGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui


	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0,450,0,180)
	frame.Position = UDim2.new(0.5,-225,0.5,-80)
	frame.BackgroundColor3 = Color3.fromRGB(5,5,5)
	frame.Parent = warningGui

    local lockGradient = Instance.new("UIGradient")
    lockGradient.Color = ColorSequence.new{
	    ColorSequenceKeypoint.new(0, Color3.fromRGB(25,0,0)),
	    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10,10,10)),
	    ColorSequenceKeypoint.new(1, Color3.fromRGB(25,0,0))
    }

    lockGradient.Rotation = 90
    lockGradient.Parent = frame

    -- BORDE NEÃ“N ESTILO HUD

    local lockStroke = Instance.new("UIStroke")
    lockStroke.Thickness = 4
    lockStroke.Transparency = 0
    lockStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    lockStroke.Parent = frame
    -- brillo exterior
    local glow = Instance.new("UIStroke")
    glow.Thickness = 10
    glow.Transparency = 0.65
    glow.Color = Color3.fromRGB(255,0,0)
    glow.Parent = frame


    local lockCorner = Instance.new("UICorner")
    lockCorner.CornerRadius = UDim.new(0,8)
    lockCorner.Parent = frame

    local topLine = Instance.new("Frame")
    topLine.Size = UDim2.new(0.7,0,0,2)
    topLine.Position = UDim2.new(0.15,0,0,20)
    topLine.BackgroundColor3 = Color3.fromRGB(255,0,0)
    topLine.BorderSizePixel = 0
    topLine.Parent = frame


    local bottomLine = Instance.new("Frame")
    bottomLine.Size = UDim2.new(0.7,0,0,2)
    bottomLine.Position = UDim2.new(0.15,0,1,-20)
    bottomLine.BackgroundColor3 = Color3.fromRGB(255,0,0)
    bottomLine.BorderSizePixel = 0
    bottomLine.Parent = frame

    -- ESQUINAS HUD

    local function hudCorner(pos, size, rotation)

	    local corner = Instance.new("Frame")
	    corner.Size = size
	    corner.Position = pos
	    corner.BackgroundColor3 = Color3.fromRGB(255,0,0)
	    corner.BorderSizePixel = 0
	    corner.Rotation = rotation
	    corner.Parent = frame

	    return corner
    end


    -- arriba izquierda
    hudCorner(
 	    UDim2.new(0,20,0,18),
	    UDim2.new(0,35,0,3),
	    -45
    )

    -- arriba derecha
    hudCorner(
	    UDim2.new(1,-55,0,18),
	    UDim2.new(0,35,0,3),
	    45
    )


    -- abajo izquierda
    hudCorner(
	    UDim2.new(0,20,1,-22),
	    UDim2.new(0,35,0,3),
	    45
    )


    -- abajo derecha
    hudCorner(
	    UDim2.new(1,-55,1,-22),
	    UDim2.new(0,35,0,3),
	    -45
    )

    -- animaciÃ³n rojo brillante
    task.spawn(function()
	    while true do
	
		    for i = 0,1,0.03 do
			    lockStroke.Color = Color3.fromRGB(
				    255,
				    math.floor(i*80),
				    math.floor(i*80)
			    )
			    task.wait(0.04)
		    end

		    for i = 1,0,-0.03 do
			    lockStroke.Color = Color3.fromRGB(
				    255,
				    math.floor(i*80),
				    math.floor(i*80)
			    )
			    task.wait(0.04)
		    end
	
	    end
    end)


	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,15)
	corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,-20,0,50)
    title.Position = UDim2.new(0,10,0,15)
    title.BackgroundTransparency = 1
    title.TextScaled = false
    title.TextSize = 30
    title.FontFace = Font.fromName("Michroma")
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Text = "🔒 PANEL LOCKED 🔒"
    title.Parent = frame
 
    --inicio
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,25,0,25)
    closeBtn.Position = UDim2.new(1,-28,0,2)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "✖"
    closeBtn.TextSize = 20
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = frame

    closeBtn.Activated:Connect(function()
	    warningGui:Destroy()
    end)
    --fin


    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,-30,0,70)
    text.Position = UDim2.new(0,15,0,75)
    text.BackgroundTransparency = 1
    text.TextWrapped = true
    text.TextScaled = false
    text.TextSize = 17
    text.FontFace = Font.fromName("Michroma")
    text.TextColor3 = Color3.fromRGB(220,220,220)

    text.Text =
	    "This version is not supported in this game.\n\n"..
	    "If you have a suggestion,\njoin our Discord and let us know."

    text.Parent = frame

    local ytBtn = Instance.new("ImageButton")
    ytBtn.AutoButtonColor = false
    ytBtn.Size = UDim2.new(0,38,0,38)
    ytBtn.Position = UDim2.new(0,8,0.5,-19)
    ytBtn.Image = "rbxassetid://125307718842922"
    ytBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
    ytBtn.BorderSizePixel = 0
    ytBtn.Parent = frame

    local dcBtn = Instance.new("ImageButton")
    dcBtn.AutoButtonColor = false
    dcBtn.Size = UDim2.new(0,38,0,38)
    dcBtn.Position = UDim2.new(1,-46,0.5,-19)
    dcBtn.Image = "rbxassetid://112923634253188"
    dcBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
    dcBtn.BorderSizePixel = 0
    dcBtn.Parent = frame

    ytBtn.Activated:Connect(function()

	    pcall(function()
		    setclipboard("https://youtube.com/@eclipse-hub-1")
	    end)

	    pcall(function()
		    game:GetService("StarterGui"):SetCore("SendNotification",{
			    Title = "Eclipse Hub",
			    Text = "YouTube link copied!",
			    Duration = 3
		    })
	    end)

    end)

    dcBtn.Activated:Connect(function()

	    pcall(function()
		    setclipboard("https://discord.gg/7wp3NY5N")
	    end)

	    pcall(function()
		    game:GetService("StarterGui"):SetCore("SendNotification",{
			    Title = "Eclipse Hub",
			    Text = "Discord link copied!",
			    Duration = 3
		    })
	    end)

    end)

    return

end
--==================================================
--===================== REMOTES ====================
--==================================================
local PickupCoinRE = ReplicatedStorage:WaitForChild("PickupCoinRE")
local SetSpeedRE = ReplicatedStorage:WaitForChild("SetSpeedRE")
local PerformRollRF = ReplicatedStorage:WaitForChild("PerformRollRF")
local BuyItemRF = ReplicatedStorage:WaitForChild("BuyItemRF")
--==================================================
--====================== STATES ====================
--==================================================
local state = {
    ["Infinite Jump"] = false,
    ["Speed"] = false,
    ["Fullbright"] = false,
    ["Noclip"] = false,
    ["Teleport"] = false,
    ["Coin Farm"] = false,
    ["Buy All"] = false,
    ["Infinite Roll"] = false,
    ["Speed Battle X4"] = false
}

savedSpeedValue = 16

pulseSpeed = 1

local jumpConn = nil
-- Teleport
local savedPositions = {} -- Guardar posiciones para cada rectÃ¡ngulo
local teleportRects = {} -- Guardar los 3 rectÃ¡ngulos
-- Ignore system
local ignoredItems = {}
ignoreButtons = {}
-- Theme system
local selectedThemeCategory = "Default"
local selectedSolidTheme = "DEFAULT"
-- Navigation system
local currentPage = "Main"
--Mini hub
local customTheme = {
    Title = Color3.fromRGB(255,50,50),
    TitleStroke = Color3.fromRGB(255,255,255),
    Subtitle = Color3.fromRGB(255,255,255),
    Border = Color3.fromRGB(255,255,255),
    Divider = Color3.fromRGB(255,50,50),
    Icons = Color3.fromRGB(255,255,255),
    Options = Color3.fromRGB(255,255,255),
    Toggles = Color3.fromRGB(255,50,50),
    Buttons = Color3.fromRGB(255,255,255),
	Speed = Color3.fromRGB(255,255,255),
    PulseMain = Color3.fromRGB(255,60,60),
	PulseMid = Color3.fromRGB(255,170,60),
	PulseEnd = Color3.fromRGB(255,255,255),
}

local customPulseTheme = {
	Title = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	TitleStroke = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Subtitle = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Border = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Divider = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Icons = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Buttons = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Toggles = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},

	Speed = {
		Main = Color3.fromRGB(255,60,60),
		Mid = Color3.fromRGB(255,170,60),
		End = Color3.fromRGB(255,255,255),
	},
}

local function cloneThemeTable(source)
	local result = {}

	for key, value in pairs(source) do
		if type(value) == "table" then
			result[key] = cloneThemeTable(value)
		else
			result[key] = value
		end
	end

	return result
end

appliedCustomTheme = cloneThemeTable(customTheme)
appliedCustomPulseTheme = cloneThemeTable(customPulseTheme)

Config = Config or {}

Config.Folder = "EclipseHub"
Config.File = Config.Folder .. "/config.json"

function Config.colorToTable(color)
	return {
		R = math.floor(color.R * 255),
		G = math.floor(color.G * 255),
		B = math.floor(color.B * 255),
	}
end

function Config.tableToColor(data)
	return Color3.fromRGB(data.R, data.G, data.B)
end

function Config.applySerializable(saved, target)

	if type(saved) ~= "table" or type(target) ~= "table" then
		return
	end

	for key, value in pairs(saved) do

		if type(value) == "table" and value.R and value.G and value.B then

			target[key] = Config.tableToColor(value)

		elseif type(value) == "table" and type(target[key]) == "table" then

			Config.applySerializable(value, target[key])

		else

			target[key] = value

		end

	end

end

function Config.makeSerializable(value)

	if typeof(value) == "Color3" then
		return Config.colorToTable(value)
	end

	if type(value) == "table" then

		local result = {}

		for key, childValue in pairs(value) do
			result[key] = Config.makeSerializable(childValue)
		end

		return result

	end

	return value

end

function Config.buildData()

	return {
		Version = 1,

		States = Config.makeSerializable(state),

		Speed = {
			Value = savedSpeedValue,
		},

		Theme = {
			SelectedCategory = selectedThemeCategory,
			SelectedSolid = selectedSolidTheme,
			CustomTheme = Config.makeSerializable(customTheme),
			CustomPulseTheme = Config.makeSerializable(customPulseTheme),
		},

		UI = {
            Scale = currentUIScale,
        },

        PulseSpeed = pulseSpeed,

        Effects = Config.makeSerializable(effectsState),
		IgnoredItems = Config.makeSerializable(ignoredItems),
	}

end

function Config.save()

	if syncConfigurationInputs then
		syncConfigurationInputs()
	end

	if not writefile or not makefolder or not isfolder then
		warn("Save configuration is not supported in this environment.")
		return
	end

	if not isfolder(Config.Folder) then
		makefolder(Config.Folder)
	end

	local data = Config.buildData()
	local encoded = game:GetService("HttpService"):JSONEncode(data)

	writefile(Config.File, encoded)

	print("Configuration saved.")

end

function Config.load()

	if not readfile or not isfile then
		warn("Load configuration is not supported in this environment.")
		return
	end

	if not isfile(Config.File) then
		warn("No saved configuration found.")
		return
	end

	local success, decoded = pcall(function()
		return game:GetService("HttpService"):JSONDecode(readfile(Config.File))
	end)

	if not success or type(decoded) ~= "table" then
		warn("Failed to load configuration.")
		return
	end

    if decoded.States then
        Config.applySerializable(decoded.States, state)
    end

	if decoded.Theme then

		selectedThemeCategory = decoded.Theme.SelectedCategory or selectedThemeCategory
		selectedSolidTheme = decoded.Theme.SelectedSolid or selectedSolidTheme

		if decoded.Theme.CustomTheme then
			Config.applySerializable(decoded.Theme.CustomTheme, customTheme)
		end

		if decoded.Theme.CustomPulseTheme then
			Config.applySerializable(decoded.Theme.CustomPulseTheme, customPulseTheme)
		end

	end

	if decoded.UI and decoded.UI.Scale then
		currentUIScale = decoded.UI.Scale
	end

    if decoded.PulseSpeed then
        pulseSpeed = decoded.PulseSpeed
    end

	if decoded.Speed and decoded.Speed.Value then
		savedSpeedValue = decoded.Speed.Value
	end

	if decoded.Effects then
		Config.applySerializable(decoded.Effects, effectsState)
	end

	if decoded.IgnoredItems then
		for key in pairs(ignoredItems) do
			ignoredItems[key] = nil
		end

		Config.applySerializable(decoded.IgnoredItems, ignoredItems)
	end

	Config.applyVisuals()

	print("Configuration loaded.")

end

local colorPickerWindow = nil

local currentEditingProperty = nil
local currentPickerMode = "Solid"

local selectedColor = Color3.fromRGB(255,255,255)

local pickerPulseTitle = nil
local pickerPulseDescription = nil
local pickerPulsePanel = nil
local pickerPulsePreview = nil
local pickerWheel = nil
local pickerDarkness = nil
local pickerApplyButton = nil
--==================================================
--================== EFFECT STATES =================
--==================================================
effectsState = {
    Border = "Pulse",
	Divider = "Pulse",
    TitleStroke = "Fixed",
    Subtitle = "Pulse",
    Icons = "Fixed",
    Buttons = "Fixed",
    Glow = "Pulse",

	Background = "On"
}

-- ðŸ“Š COLUMNAS
local col = {
	Label = 0,
	None = 90,
	Fixed = 150,
	Pulse = 220
}
--==================================================
--=================== UI REFERENCES ================
--==================================================
local mainStroke
local previewObjects = {
    
	Icons = {},
	Options = {},
	Toggles = {},
	Buttons = {},
	Speed = {}
}
local crearTeleportRect
local ignoreFrame
local ignoreTitle
local ignoreLayout
local scroll
local titleStroke
local backgroundFrame
local subtitleLabel
local ignoreCorner
local bgArt
local divider
local titleLabel
local subtitulo
local ignoreStroke
local frame
local uiScale
local uiStroke
local gradient
currentUIScale = nil
local titulo
local screenGui
local corner
local themeDivider
local headerFrame
local settingsTitle
local backBtn
local dropdownCorner
local settingsBtn
local optionsContainer
local settingsContainer
local themedOptions = {}
local layout
local settingsLayout
local themeRow
local themeLabel
local themeDropdown
local themeOptions
local optionsCorner
local themeOptionsLayout
local categoryContent
local categoryLayout
local uiScaleCorner
local uiScaleRow
local uiScaleLabel
local uiScaleBox
local speedValueBox
local applySavedSpeedValue
local effectsRow
local effectsContent
local effectsLayout
local effectsLabel
local effectsCorner
local effectsDropdown
local othersDivider
local othersRow
local othersLabel
local othersDropdown
local othersCorner
local othersContent
local othersLayout
local fuenteElegante = Enum.Font.GothamSemibold
local settingsDivider
local effectsDivider
local backgroundArt
local pulseRadioButtons = {}
local themedSpeedBoxes = {}
local themedButtons = {}
local themedToggles = {}
local themedIcons = {}
local themedExecuteButtons = {}
local toggleObjects = {}
local themeRadioButtons = {}
local togglesUI = {}
local defaultOption
local solidOption
local customOption

local pulseGradient
local pulseColors

local TITLE_NORMAL_POS = UDim2.new(0.5,0,0,8)
local TITLE_CENTER_POS = UDim2.new(0.5,0,0,18)
local PREVIEW_TITLE_NORMAL_POS = UDim2.new(0, 0, 0, 8)
local PREVIEW_TITLE_CENTER_POS = UDim2.new(0, 0, 0, 12)
--==================================================
--=============== GAMEPLAY FUNCTIONS ===============
--==================================================
-- Helper: obtener humanoid
local function getHumanoid()
    local char = player.Character
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end
-- Infinite Jump
if jumpConn then jumpConn:Disconnect() jumpConn = nil end
jumpConn = UserInputService.JumpRequest:Connect(function()
    if state["Infinite Jump"] then
        local humanoid = getHumanoid()
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

--fullbright
local originalLighting = {
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	FogEnd = Lighting.FogEnd,
	FogColor = Lighting.FogColor,
	GlobalShadows = Lighting.GlobalShadows,
	OutdoorAmbient = Lighting.OutdoorAmbient,
	ColorShift_Bottom = Lighting.ColorShift_Bottom,
	ColorShift_Top = Lighting.ColorShift_Top
}
-- Aplicar brillo mÃ¡ximo (mantiene sombras)
local function applyFullbright()
	Lighting.Brightness = 3
	Lighting.ClockTime = 12
	Lighting.FogEnd = 1e6
	Lighting.FogColor = Color3.new(1, 1, 1)
	Lighting.GlobalShadows = true -- mantiene sombras
	Lighting.OutdoorAmbient = Color3.new(0.9, 0.9, 0.9)
	Lighting.ColorShift_Bottom = Color3.new(0.8, 0.8, 0.8)
	Lighting.ColorShift_Top = Color3.new(1, 1, 1)
end
-- Restaurar valores originales
local function restoreLighting()
	for prop, val in pairs(originalLighting) do
		Lighting[prop] = val
	end
end
-- Mantener activo mientras estÃ© encendido el toggle
RunService.RenderStepped:Connect(function()
	if state["Fullbright"] then
		applyFullbright()
	end
end)
-- Conectar al toggle del menÃº
local function onToggleFullbright()
	state["Fullbright"] = not state["Fullbright"]
	if state["Fullbright"] then
		applyFullbright()
	else
		restoreLighting()
	end
end
--Noclip
local noclipEnabled = false
-- FunciÃ³n para activar/desactivar
local function setNoclip(state)
	noclipEnabled = state
end
-- Mantiene las colisiones desactivadas mientras estÃ© activo
RunService.Stepped:Connect(function()
	if noclipEnabled then
		local char = player.Character
		if char then
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide then
					part.CanCollide = false
				end
			end
		end
	end
end)
-- Reaplica si el jugador respawnea
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart", 5)
	if noclipEnabled then
		task.wait(0.1)
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)
-- TELEPORT
local function toggleTeleport(on)
    if on then
        for i=1,3 do
            task.delay((i-1)*0.12, function()
                crearTeleportRect(15 + (i-1)*50)
            end)
        end
    else
        for i=1,#teleportRects do
            local rect = teleportRects[i]
            task.delay((i-1)*0.12, function()
                local tween = TweenService:Create(rect, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = UDim2.new(1,150,0,rect.Position.Y.Offset)})
                tween:Play()
                tween.Completed:Connect(function()
                    rect:Destroy()
                end)
            end)
        end
        teleportRects = {}
        savedPositions = {}
    end
end
--==================================================
--================== GUI CREATION ==================
--==================================================
screenGui = Instance.new("ScreenGui")
screenGui.Name = "VerticalMenu"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

ignoreFrame = Instance.new("Frame")
ignoreFrame.Size = UDim2.new(0,250,0,300)
ignoreFrame.Position = UDim2.new(0.5,-125,0.5,-150)
ignoreFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
ignoreFrame.BorderSizePixel = 0
ignoreFrame.Visible = false
ignoreFrame.Parent = screenGui
ignoreFrame.Active = true
ignoreFrame.Draggable = true

ignoreStroke = Instance.new("UIStroke")
ignoreStroke.Thickness = 2.5
ignoreStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ignoreStroke.Parent = ignoreFrame

ignoreTitle = Instance.new("TextLabel")
ignoreTitle.Size = UDim2.new(1,0,0,30)
ignoreTitle.Position = UDim2.new(0,0,0,0)
ignoreTitle.BackgroundTransparency = 1
ignoreTitle.Text = "Select items to ignore"
ignoreTitle.FontFace = Font.fromName("Michroma")
ignoreTitle.TextSize = 18
ignoreTitle.TextColor3 = Color3.fromRGB(255,255,255)
ignoreTitle.Parent = ignoreFrame

ignoreCorner = Instance.new("UICorner")
ignoreCorner.CornerRadius = UDim.new(0,10)
ignoreCorner.Parent = ignoreFrame

scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-10,1,-40)
scroll.Position = UDim2.new(0,5,0,35)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.Parent = ignoreFrame

ignoreLayout = Instance.new("UIListLayout")
ignoreLayout.Parent = scroll

ignoreLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, ignoreLayout.AbsoluteContentSize.Y + 5)
end)

function refreshIgnoredItemButton(itemId, button, itemName)

	if ignoredItems[itemId] then
		button.Text = "[IGNORED] "..itemName
	else
		button.Text = "[BUY] "..itemName
	end

end

function refreshIgnoredItemsUI()

	for itemId, data in pairs(ignoreButtons) do
		refreshIgnoredItemButton(itemId, data.Button, data.Name)
	end

end

for itemId = 1,21 do
	local slotName = string.format("%02d_Slot", itemId)
	local slot = player.PlayerGui.BasicGui.ShopGui.ShopFrame.ItemList:FindFirstChild(slotName)

	local nombre = "Item "..itemId

	if slot and slot:FindFirstChild("ItemName") then
	    nombre = slot.ItemName.Text
	end

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,-10,0,30)
	btn.Text = "[BUY] "..nombre
	btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BorderSizePixel = 0
	btn.Parent = scroll

	ignoreButtons[itemId] = {
		Button = btn,
		Name = nombre,
	}

	refreshIgnoredItemButton(itemId, btn, nombre)

	btn.Activated:Connect(function()

		if ignoredItems[itemId] then
			ignoredItems[itemId] = nil
		else
			ignoredItems[itemId] = true
		end

		refreshIgnoredItemButton(itemId, btn, nombre)

	end)

end

frame = Instance.new("Frame")
frame.Size = UDim2.new(0,350,0,430)
frame.Position = UDim2.new(0.5,-110,0.5,-185)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = true
frame.Parent = screenGui

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0,45,0,45)
toggleButton.Position = UDim2.new(0,15,0,15)
toggleButton.BackgroundColor3 = Color3.fromRGB(10,10,10)
toggleButton.BorderSizePixel = 0
toggleButton.Image = ""
toggleButton.Parent = screenGui

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0.8,0,0.8,0)
icon.AnchorPoint = Vector2.new(0.5,0.5)
icon.Position = UDim2.new(0.5,0,0.45,0)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://137257467335635"
icon.ImageColor3 = Color3.fromRGB(255,50,50)
icon.Parent = toggleButton

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0,10)
toggleCorner.Parent = toggleButton

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Thickness = 1.8
buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
buttonStroke.Parent = toggleButton
table.insert(themedExecuteButtons, buttonStroke)

local visible = true
local animating = false

local originalPos = frame.Position

local offscreenPos = UDim2.new(
    originalPos.X.Scale,
    originalPos.X.Offset,
    originalPos.Y.Scale,
    originalPos.Y.Offset + 400
)

backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(1,0,1,0)
backgroundFrame.BackgroundTransparency = 1
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = frame

uiScale = Instance.new("UIScale")
uiScale.Parent = frame

currentUIScale = 1
if UserInputService.TouchEnabled then
	currentUIScale = 0.8
end
uiScale.Scale = currentUIScale

corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,16)
corner.Parent = frame

gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(22,22,22)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14,14,14)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8,8,8))
}
gradient.Rotation = 90
gradient.Parent = frame

bgArt = Instance.new("ImageLabel")
bgArt.Size = UDim2.new(0,220,0,220)
bgArt.AnchorPoint = Vector2.new(0.5,0.5)
bgArt.Position = UDim2.new(0.5,0,0.55,0)
bgArt.BackgroundTransparency = 1
bgArt.Image = "rbxassetid://119530457366231"
bgArt.ImageTransparency = 0.75
bgArt.Parent = backgroundFrame
backgroundArt = bgArt

uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2.5
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = frame
mainStroke = uiStroke
mainStroke.Enabled = true

divider = Instance.new("Frame")
divider.Size = UDim2.new(0.8,0,0,1)
divider.Position = UDim2.new(0.1,0,0,58)
divider.BackgroundColor3 = Color3.fromRGB(90,90,90)
divider.BorderSizePixel = 0
divider.Parent = frame

themeDivider = divider

headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1,0,0,65)
headerFrame.Position = UDim2.new(0,0,0,10)
headerFrame.BackgroundTransparency = 1
headerFrame.Parent = frame

titulo = Instance.new("TextLabel")
titulo.Text = "THE BEST"
titulo.FontFace = Font.fromName("Michroma")
titulo.TextSize = 35
titulo.TextColor3 = Color3.fromRGB(255,255,255)
titulo.BackgroundTransparency = 1
titulo.AnchorPoint = Vector2.new(0.5,0)
titulo.Position = UDim2.new(0.5,0,0,8)
titulo.Parent = headerFrame

titleLabel = titulo

titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 1
titleStroke.Color = Color3.fromRGB(255,255,255)
titleStroke.Parent = titulo

subtitulo = Instance.new("TextLabel")
subtitulo.Text = "by What"
subtitulo.Font = Enum.Font.Gotham
subtitulo.TextSize = 16
subtitulo.TextColor3 = Color3.fromRGB(200,140,140)
subtitulo.BackgroundTransparency = 1
subtitulo.AnchorPoint = Vector2.new(0.5,0)
subtitulo.Position = UDim2.new(0.5,0,0,34)
subtitulo.Parent = headerFrame
subtitleLabel = subtitulo

settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1,0,0,60)
settingsTitle.Position = UDim2.new(0,0,0,-12)
settingsTitle.BackgroundTransparency = 1

settingsTitle.Text = "SETTINGS"
settingsTitle.FontFace = Font.fromName("Michroma")
settingsTitle.TextSize = 28
settingsTitle.TextColor3 = Color3.new(1,1,1)
settingsTitle.Visible = false
settingsTitle.Parent = headerFrame

backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0,28,0,28)
backBtn.Position = UDim2.new(1,-40,0,10)
backBtn.BackgroundTransparency = 1
backBtn.Text = "←"
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 24
backBtn.TextColor3 = Color3.fromRGB(255,255,255)
backBtn.Visible = false
backBtn.Parent = headerFrame

settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0,28,0,28)
settingsBtn.Position = UDim2.new(1,-40,0,10)
settingsBtn.BackgroundTransparency = 1
settingsBtn.Text = "⚙️"
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 22
settingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
settingsBtn.Parent = headerFrame

optionsContainer = Instance.new("ScrollingFrame")
optionsContainer.Size = UDim2.new(1,0,1,-75)
optionsContainer.Position = UDim2.new(0,0,0,75)
optionsContainer.BackgroundTransparency = 1
optionsContainer.ScrollBarThickness = 6
optionsContainer.BorderSizePixel = 0
optionsContainer.CanvasSize = UDim2.new(0,0,0,0)
optionsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
optionsContainer.Parent = frame

layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Padding = UDim.new(0,12)
layout.Parent = optionsContainer

settingsContainer = Instance.new("ScrollingFrame")
settingsContainer.Size = optionsContainer.Size
settingsContainer.Position = optionsContainer.Position
settingsContainer.BackgroundTransparency = 1
settingsContainer.ScrollBarThickness = 6
settingsContainer.BorderSizePixel = 0
settingsContainer.CanvasSize = UDim2.new(0,0,0,0)
settingsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
settingsContainer.Visible = false
settingsContainer.ClipsDescendants = true
settingsContainer.Parent = frame

settingsLayout = Instance.new("UIListLayout")
settingsLayout.FillDirection = Enum.FillDirection.Vertical
settingsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
settingsLayout.VerticalAlignment = Enum.VerticalAlignment.Top
settingsLayout.Padding = UDim.new(0,12)
settingsLayout.Parent = settingsContainer
--==================================================
--================ SETTINGS UI =====================
--==================================================
-- THEMES
themeRow = Instance.new("Frame")
themeRow.Size = UDim2.new(0,260,0,35)
themeRow.BackgroundTransparency = 1
themeRow.Parent = settingsContainer
themeRow.ClipsDescendants = false

themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0,100,1,0)
themeLabel.Position = UDim2.new(0,0,0,0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "THEMES :"
themeLabel.FontFace = Font.fromName("Michroma")
themeLabel.TextSize = 16
themeLabel.TextColor3 = Color3.new(1,1,1)
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = themeRow

themeDropdown = Instance.new("TextButton")
themeDropdown.Size = UDim2.new(0,140,1,0)
themeDropdown.Position = UDim2.new(0,110,0,2)
themeDropdown.BackgroundColor3 = Color3.fromRGB(1,1,1)
themeDropdown.BackgroundTransparency = 1
themeDropdown.BorderSizePixel = 0
themeDropdown.Text = "Default ▼"
themeDropdown.Font = Enum.Font.GothamSemibold
themeDropdown.TextSize = 15
themeDropdown.TextColor3 = Color3.new(1,1,1)
themeDropdown.Parent = themeRow

dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0,8)
dropdownCorner.Parent = themeDropdown

themeOptions = Instance.new("Frame")
themeOptions.Size = UDim2.new(0,140,0,0)
themeOptions.Position = UDim2.new(0,110,0,40)

themeOptions.BackgroundTransparency = 0
themeOptions.BackgroundColor3 = Color3.fromRGB(1,1,1)

themeOptions.BorderSizePixel = 0

themeOptions.Visible = false
themeOptions.ZIndex = 10
themeOptions.Parent = themeRow

optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0,8)
optionsCorner.Parent = themeOptions

themeOptionsLayout = Instance.new("UIListLayout")
themeOptionsLayout.Padding = UDim.new(0,4)
themeOptionsLayout.Parent = themeOptions

categoryContent = Instance.new("Frame")
categoryContent.Size = UDim2.new(0,260,0,0)
categoryContent.BackgroundTransparency = 1
categoryContent.Parent = settingsContainer

categoryLayout = Instance.new("UIListLayout")
categoryLayout.Padding = UDim.new(0,6)
categoryLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
categoryLayout.Parent = categoryContent

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 45)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.Parent = categoryContent

settingsDivider = Instance.new("Frame")
settingsDivider.Size = UDim2.new(0,220,0,1)
settingsDivider.BackgroundColor3 = Color3.fromRGB(70,70,70)
settingsDivider.BorderSizePixel = 0
settingsDivider.Parent = settingsContainer

-- UI SCALE
uiScaleRow = Instance.new("Frame")
uiScaleRow.Size = UDim2.new(0,260,0,35)
uiScaleRow.BackgroundTransparency = 1
uiScaleRow.Parent = settingsContainer

uiScaleLabel = Instance.new("TextLabel")
uiScaleLabel.Size = UDim2.new(0,120,1,0)
uiScaleLabel.Position = UDim2.new(0,0,0,0)
uiScaleLabel.BackgroundTransparency = 1
uiScaleLabel.Text = "UI SCALE :"
uiScaleLabel.FontFace = Font.fromName("Michroma")
uiScaleLabel.TextSize = 16
uiScaleLabel.TextColor3 = Color3.new(1,1,1)
uiScaleLabel.TextXAlignment = Enum.TextXAlignment.Left
uiScaleLabel.Parent = uiScaleRow

effectsDivider = Instance.new("Frame")
effectsDivider.Size = UDim2.new(0,220,0,1)
effectsDivider.BackgroundColor3 = Color3.fromRGB(70,70,70)
effectsDivider.BorderSizePixel = 0
effectsDivider.Parent = settingsContainer

uiScaleBox = Instance.new("TextBox")
uiScaleBox.Size = UDim2.new(0,100,0,28)
uiScaleBox.Position = UDim2.new(0,140,0,3)
uiScaleBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
uiScaleBox.BackgroundTransparency = 1
uiScaleBox.BorderSizePixel = 0
uiScaleBox.Text = tostring(currentUIScale)
uiScaleBox.PlaceholderText = "1.0"
uiScaleBox.Font = Enum.Font.GothamSemibold
uiScaleBox.TextSize = 14
uiScaleBox.TextColor3 = Color3.new(1,1,1)
uiScaleBox.Parent = uiScaleRow

uiScaleCorner = Instance.new("UICorner")
uiScaleCorner.CornerRadius = UDim.new(0,8)
uiScaleCorner.Parent = uiScaleBox
-- EFFECTS
effectsRow = Instance.new("Frame")
effectsRow.Size = UDim2.new(0,260,0,35)
effectsRow.BackgroundTransparency = 1
effectsRow.LayoutOrder = 5
effectsRow.Parent = settingsContainer

effectsContent = Instance.new("Frame")
effectsContent.Size = UDim2.new(0,260,0,0)
effectsContent.BackgroundTransparency = 1
effectsContent.Parent = settingsContainer
effectsContent.ClipsDescendants = true
effectsContent.LayoutOrder = 999

effectsLayout = Instance.new("UIListLayout")
effectsLayout.Padding = UDim.new(0,6)
effectsLayout.Parent = effectsContent

effectsLabel = Instance.new("TextLabel")
effectsLabel.Size = UDim2.new(0,100,1,0)
effectsLabel.BackgroundTransparency = 1
effectsLabel.Text = "EFFECTS :"
effectsLabel.FontFace = Font.fromName("Michroma")
effectsLabel.TextSize = 16
effectsLabel.TextColor3 = Color3.new(1,1,1)
effectsLabel.TextXAlignment = Enum.TextXAlignment.Left
effectsLabel.Parent = effectsRow

effectsDropdown = Instance.new("TextButton")
effectsDropdown.Size = UDim2.new(0,140,1,0)
effectsDropdown.Position = UDim2.new(0,110,0,2)
effectsDropdown.BackgroundColor3 = Color3.fromRGB(1,1,1)
effectsDropdown.BackgroundTransparency = 1
effectsDropdown.BorderSizePixel = 0
effectsDropdown.Text = "Custom ▶"
effectsDropdown.Font = Enum.Font.GothamSemibold
effectsDropdown.TextSize = 15
effectsDropdown.TextColor3 = Color3.new(1,1,1)
effectsDropdown.Parent = effectsRow

effectsCorner = Instance.new("UICorner")
effectsCorner.CornerRadius = UDim.new(0,8)
effectsCorner.Parent = effectsDropdown

-- OTHERS DIVIDER
othersDivider = Instance.new("Frame")
othersDivider.Size = UDim2.new(0,220,0,1)
othersDivider.BackgroundColor3 = Color3.fromRGB(70,70,70)
othersDivider.BorderSizePixel = 0
othersDivider.Parent = settingsContainer

-- OTHERS
othersRow = Instance.new("Frame")
othersRow.Size = UDim2.new(0,260,0,35)
othersRow.BackgroundTransparency = 1
othersRow.Parent = settingsContainer

othersContent = Instance.new("Frame")
othersContent.Size = UDim2.new(0,260,0,0)
othersContent.BackgroundTransparency = 1
othersContent.Parent = settingsContainer
othersContent.ClipsDescendants = true

othersLayout = Instance.new("UIListLayout")
othersLayout.Padding = UDim.new(0,6)
othersLayout.Parent = othersContent

othersLabel = Instance.new("TextLabel")
othersLabel.Size = UDim2.new(0,100,1,0)
othersLabel.BackgroundTransparency = 1
othersLabel.Text = "OTHERS :"
othersLabel.FontFace = Font.fromName("Michroma")
othersLabel.TextSize = 16
othersLabel.TextColor3 = Color3.new(1,1,1)
othersLabel.TextXAlignment = Enum.TextXAlignment.Left
othersLabel.Parent = othersRow

othersDropdown = Instance.new("TextButton")
othersDropdown.Size = UDim2.new(0,140,1,0)
othersDropdown.Position = UDim2.new(0,110,0,2)
othersDropdown.BackgroundColor3 = Color3.fromRGB(1,1,1)
othersDropdown.BackgroundTransparency = 1
othersDropdown.BorderSizePixel = 0
othersDropdown.Text = "Custom ▶"
othersDropdown.Font = Enum.Font.GothamSemibold
othersDropdown.TextSize = 15
othersDropdown.TextColor3 = Color3.new(1,1,1)
othersDropdown.Parent = othersRow

othersCorner = Instance.new("UICorner")
othersCorner.CornerRadius = UDim.new(0,8)
othersCorner.Parent = othersDropdown
--==================================================
--================== MENU HANDLERS =================
--==================================================
local function handleToggle(nombre, estado)

    if nombre == "Infinite Jump" then
        -- Ya controlado globalmente

    elseif nombre == "Fullbright" then
        if estado then
            applyFullbright()
        else
            restoreLighting()
        end

    elseif nombre == "Noclip" then
        setNoclip(estado)

    elseif nombre == "Teleport" then
        toggleTeleport(estado)

    elseif nombre == "Coin Farm" then

        if estado then
            task.spawn(function()
    			while task.wait(0.1) do
        			if not state["Coin Farm"] then break end
        			PickupCoinRE:FireServer(5000000, false)
    			end
			end)
        end


    elseif nombre == "Speed Battle X4" then

        if estado then
            SetSpeedRE:FireServer(3)
        else
            SetSpeedRE:FireServer(1)
        end

    elseif nombre == "Buy All" then

        if estado then
            task.spawn(function()

                while state["Buy All"] do

                    local itemList = player.PlayerGui.BasicGui.ShopGui.ShopFrame.ItemList

                    for itemId = 1, 21 do

                        if not ignoredItems[itemId] then

                            local slotName = string.format("%02d_Slot", itemId)
                            local slot = itemList:FindFirstChild(slotName)

                            if slot and slot:FindFirstChild("StockText") then

                                local cantidad = tonumber(slot.StockText.Text:match("%d+"))

                                if cantidad and cantidad > 0 then
                                    BuyItemRF:InvokeServer(itemId, cantidad)
                                    task.wait(0.05)
                                end

                            end

                        end

                    end

                    task.wait(5)

                end

            end)
        end

    elseif nombre == "Infinite Roll" then

        if estado then
            task.spawn(function()
                while state["Infinite Roll"] do
                    PerformRollRF:InvokeServer(1)
                    task.wait(0.1)
                end
            end)
        end
    end

end

local function handleExecuteButton(nombre)

    if nombre == "Ignored Items" then

        ignoreFrame.Visible = not ignoreFrame.Visible

    elseif nombre == "Re-Join" then

        TeleportService:TeleportToPlaceInstance(
            game.PlaceId,
            game.JobId,
            player
        )

    elseif nombre == "Server Hop" then

        TeleportService:Teleport(
            game.PlaceId,
            player
        )

    end

end

local function handleSpeedChange(valor, humanoid)

    if humanoid then
        humanoid.WalkSpeed = valor
    end

end
--==================================================
--================= UI BUILDERS ===================
--==================================================
-- THEME BUILDER
local function createThemeOption(text)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,0,0,28)
	btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
	btn.BorderSizePixel = 0
	btn.Text = text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1,1,1)
	btn.ZIndex = 11
	btn.Parent = themeOptions

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = btn

	return btn

end
-- TELEPORT UI
crearTeleportRect = function(yPos)
    local rect = Instance.new("Frame")
    rect.Size = UDim2.new(0,120,0,40)
    rect.Position = UDim2.new(1,150,0,yPos) -- fuera de pantalla
    rect.BackgroundColor3 = Color3.fromRGB(0,0,0)
    rect.BackgroundTransparency = 0.6
    rect.BorderSizePixel = 0
    rect.Active = true
    rect.Draggable = true
    rect.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,10)
    corner.Parent = rect

    local dividerLine = Instance.new("Frame")
    dividerLine.Size = UDim2.new(0,2,1,0)
    dividerLine.Position = UDim2.new(0.5,-1,0,0)
    dividerLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
    dividerLine.BackgroundTransparency = 0.7
    dividerLine.BorderSizePixel = 0
    dividerLine.Parent = rect

    local leftText = Instance.new("TextButton")
    leftText.Size = UDim2.new(0.5,0,1,0)
    leftText.Position = UDim2.new(0,0,0,0)
    leftText.Text = "S"
    leftText.Font = Enum.Font.GothamBold
    leftText.TextSize = 8
    leftText.TextColor3 = Color3.fromRGB(255,255,255)
    leftText.BackgroundTransparency = 1
    leftText.TextScaled = true
    leftText.Parent = rect
    leftText.Activated:Connect(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            savedPositions[rect] = char.HumanoidRootPart.Position
        end
    end)

    local rightText = Instance.new("TextButton")
    rightText.Size = UDim2.new(0.5,0,1,0)
    rightText.Position = UDim2.new(0.5,0,0,0)
    rightText.Text = "T"
    rightText.Font = Enum.Font.GothamBold
    rightText.TextSize = 8
    rightText.TextColor3 = Color3.fromRGB(255,255,255)
    rightText.BackgroundTransparency = 1
    rightText.TextScaled = true
    rightText.Parent = rect
    rightText.Activated:Connect(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") and savedPositions[rect] then
            char.HumanoidRootPart.CFrame = CFrame.new(savedPositions[rect])
        end
    end)

    table.insert(teleportRects, rect)

    -- Tween de entrada
    local tween = TweenService:Create(
		rect, 
		TweenInfo.new(
			0.35, 
			Enum.EasingStyle.Sine, 
			Enum.EasingDirection.Out
		), 
		{
			Position = UDim2.new(1,-140,0,yPos)
		}
	)
    tween:Play()
end
-- EXECUTE BUTTONS 
local function crearBotonExecute(nombre)

    local cont = Instance.new("Frame")
    cont.Size = UDim2.new(0,260,0,35)
    cont.BackgroundTransparency = 1
    cont.Parent = optionsContainer

    local config = ICON_CONFIG[nombre] or {size = 18, y = -9}

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0,config.size,0,config.size)
    icon.Position = UDim2.new(0,config.x,0.5,config.y)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://" .. (ICONS[nombre] or "")
    icon.ImageColor3 = Color3.fromRGB(220,50,50)
    icon.Parent = cont
    table.insert(themedIcons, icon)

    local label = Instance.new("TextLabel")
    label.Text = nombre
    label.Font = fuenteElegante
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0,22,0,0)
    label.Size = UDim2.new(1,-130,1,0)
    label.Parent = cont
	table.insert(themedOptions, label)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,35,0,26)
    btn.Position = UDim2.new(1,-24,0.5,-13)

    btn.Text = "◉"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    btn.TextColor3 = Color3.fromRGB(255,50,50)

    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Parent = cont

    table.insert(themedExecuteButtons, btn)
    table.insert(themedButtons, btn)

    btn.Activated:Connect(function()

        handleExecuteButton(nombre)

    end)

end
-- TOGGLE OPTIONS
local function crearOpcion(nombre)
    local cont = Instance.new("Frame")
    cont.Size = UDim2.new(0,260,0,30)
    cont.BackgroundTransparency = 1
    cont.Parent = optionsContainer
 
    local config = ICON_CONFIG[nombre] or {size = 18, y = -9}

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0,config.size,0,config.size)
    icon.Position = UDim2.new(0,config.x,0.5,config.y)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://" .. (ICONS[nombre] or "")
    icon.ImageColor3 = Color3.fromRGB(220,50,50)
    icon.Parent = cont
    table.insert(themedIcons, icon)

    local label = Instance.new("TextLabel")
    label.Text = nombre
    label.Font = fuenteElegante
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0,22,0,0)
    label.Size = UDim2.new(1,-90,1,0)
    label.Parent = cont

	table.insert(themedOptions, label)

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0,45,0,22)
    toggleBtn.Position = UDim2.new(1,-26,0.5,-11)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.AutoButtonColor = false
    toggleBtn.Text = ""
    toggleBtn.Parent = cont
    table.insert(themedToggles, toggleBtn)

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1,0)
    toggleCorner.Parent = toggleBtn

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0,16,0,16)
    knob.Position = UDim2.new(0,3,0.5,-8)
    knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
    knob.BorderSizePixel = 0
    knob.Parent = toggleBtn

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1,0)
    knobCorner.Parent = knob

    local active = false
		toggleObjects[nombre] = {
    	button = toggleBtn,
    	knob = knob,
    	active = false
	}
    local function setVisual(on)

    	active = on

    	if toggleObjects[nombre] then
       		toggleObjects[nombre].active = on
    	end

    	if on then

    		if selectedSolidTheme == "CUSTOM" then

        		toggleBtn.BackgroundColor3 = customTheme.Toggles

    		elseif effectsState.Buttons == "None" then

        		toggleBtn.BackgroundColor3 = Color3.fromRGB(90,90,90)

    		elseif effectsState.Buttons == "Fixed" then

        		toggleBtn.BackgroundColor3 = currentThemeData.PulseBright

    		else

        		toggleBtn.BackgroundColor3 = currentThemeData.RadioOnColor

    		end

    		knob:TweenPosition(
        		UDim2.new(1,-19,0.5,-8),
        		"Out",
        		"Sine",
        		0.18,
        		true
    		)

		else

    		if selectedSolidTheme == "CUSTOM" then
        		toggleBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
    		else
        		toggleBtn.BackgroundColor3 = currentThemeData.RadioOffColor
    		end

    		knob:TweenPosition(
        		UDim2.new(0,3,0.5,-8),
        		"Out",
        		"Sine",
        		0.18,
        		true
    		)

		end

	end

    toggleBtn.Activated:Connect(function()

    	state[nombre] = not state[nombre]
    	setVisual(state[nombre])

    	handleToggle(nombre, state[nombre])

	end)

    togglesUI[nombre] = {
        set = function(v) state[nombre] = v; setVisual(v) end,
        get = function() return state[nombre] end
    }

    return togglesUI[nombre]
end
-- SPEED BOX
local function crearSpeedBox()
	local cont = Instance.new("Frame")
	cont.Size = UDim2.new(0,260,0,30)
	cont.BackgroundTransparency = 1
	cont.Parent = optionsContainer

        local config = ICON_CONFIG["Speed"] or {size = 18, y = -9}

        local icon = Instance.new("ImageLabel")
	    icon.Size = UDim2.new(0,config.size,0,config.size)
        icon.Position = UDim2.new(0,config.x,0.5,config.y)
	    icon.BackgroundTransparency = 1
	    icon.Image = "rbxassetid://" .. ICONS["Speed"]
        icon.ImageColor3 = Color3.fromRGB(220,50,50)
	    icon.Parent = cont
        table.insert(themedIcons, icon)

	local label = Instance.new("TextLabel")
	label.Text = "Speed"
	label.Font = fuenteElegante
	label.TextSize = 18
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Position = UDim2.new(0,22,0,0)
	label.Size = UDim2.new(1,-90,1,0)
	label.Parent = cont
	table.insert(themedOptions, label)

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0,100,0,25)
	box.Position = UDim2.new(1,-70,0.5,-11)
	box.BackgroundColor3 = Color3.fromRGB(0,0,0)
	box.TextColor3 = Color3.fromRGB(255,255,255)
	box.Font = fuenteElegante
	box.TextSize = 16
	box.PlaceholderText = "Speed"
	box.ClearTextOnFocus = false
	box.BorderSizePixel = 0
	box.Parent = cont
    speedValueBox = box

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,3)
	corner.Parent = box

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1.8
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = box
	table.insert(themedSpeedBoxes, stroke)

	-- sistema de velocidad estable
	local minSpeed, maxSpeed = 10, 999
	local currentSpeed = 16
    savedSpeedValue = currentSpeed
	local humanoid

	local function getSpeedHumanoid()
		local char = player.Character or player.CharacterAdded:Wait()
		humanoid = char:WaitForChild("Humanoid")
		currentSpeed = humanoid.WalkSpeed
        savedSpeedValue = currentSpeed
        box.Text = tostring(currentSpeed)
	end
	getSpeedHumanoid()

    applySavedSpeedValue = function()

        currentSpeed = math.clamp(
            tonumber(savedSpeedValue) or currentSpeed,
            minSpeed,
            maxSpeed
        )

        savedSpeedValue = currentSpeed
        box.Text = tostring(currentSpeed)
        handleSpeedChange(currentSpeed, humanoid)

    end

	player.CharacterAdded:Connect(function(char)

    	humanoid = char:WaitForChild("Humanoid")
    	handleSpeedChange(currentSpeed, humanoid)

	end)

	box.FocusLost:Connect(function()

	    local num = tonumber(box.Text)

	    if num then

		    currentSpeed = math.clamp(
                num,
                minSpeed,
                maxSpeed
            )

            savedSpeedValue = currentSpeed
            handleSpeedChange(currentSpeed, humanoid)

		    box.Text = tostring(currentSpeed)

	    else

		    box.Text = tostring(currentSpeed)

	    end

    end)

end
-- RADIOS
local function createThemeRadio(text, parent)

	local container = Instance.new("Frame")
	container.Size = UDim2.new(0,240,0,32)
	container.BackgroundTransparency = 1
	container.Parent = parent

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,-40,1,0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 14
	label.TextColor3 = Color3.new(1,1,1)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0,20,0,20)
	table.insert(themedButtons, button)
	button.Position = UDim2.new(1,-25,0.5,-10)
	button.BackgroundTransparency = 1
	button.Text = "○"
	button.Font = Enum.Font.GothamBold
	button.TextSize = 18
	button.TextColor3 = Color3.fromRGB(180,180,180)
	button.Parent = container

	return {
	    button = button,
	    container = container,
	    text = text
    }

end
-- CLEAN RADIO
local function clearCategoryContent()
	for _, child in ipairs(categoryContent:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end
--==================================================
--================ EFFECT FUNCTIONS ================
--==================================================
local function getPulseColor(mainColor, midColor, endColor, t)

    if t < 1 then

        return mainColor:Lerp(midColor, t)

    elseif t < 2 then

        return midColor:Lerp(endColor, t - 1)

    elseif t < 3 then

        return endColor:Lerp(midColor, t - 2)

    else

        return midColor:Lerp(mainColor, t - 3)

    end

end

local function updatePulsePreview()

    if not pulseGradient then
        return
    end

    pulseGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, pulseColors.Main),
        ColorSequenceKeypoint.new(0.5, pulseColors.Mid),
        ColorSequenceKeypoint.new(1, pulseColors.End)
    }

end

local function updatePreviewTitle()

    if not previewObjects then
        return
    end

    previewObjects.Title.TextColor3 =
        customTheme.Title

end
local function updatePreviewSubtitle()

    if not previewObjects then
        return
    end

    previewObjects.Subtitle.TextColor3 =
        customTheme.Subtitle

end
local function updatePreviewBorder()

    if not previewObjects then
        return
    end

    if effectsState.Border == "None" then

        previewObjects.Border.Enabled = false

    elseif effectsState.Border == "Fixed" then

        previewObjects.Border.Enabled = true
        previewObjects.Border.Color = customTheme.Border

    elseif effectsState.Border == "Pulse" then

        previewObjects.Border.Enabled = true

    end

end
local function updatePreviewDivider()

    if not previewObjects then
        return
    end

    previewObjects.Divider.BackgroundColor3 =
        customTheme.Divider

end
local function updatePreviewTitleStroke()

	if not previewObjects then
		return
	end

	previewObjects.TitleStroke.Color =
		customTheme.TitleStroke

end
local function updatePreviewIcons()

	if not previewObjects then
		return
	end

	for _, icon in ipairs(previewObjects.Icons) do
		icon.ImageColor3 = customTheme.Icons
	end

end
local function updatePreviewOptions()

	if not previewObjects then
		return
	end

	for _, option in ipairs(previewObjects.Options) do
		option.TextColor3 = customTheme.Options
	end

end
local function updatePreviewToggles()

	if not previewObjects then
		return
	end

	for _, toggle in ipairs(previewObjects.Toggles) do
		toggle.BackgroundColor3 = customTheme.Toggles
	end

end
local function updatePreviewButtons()

	if not previewObjects then
		return
	end

	for _, button in ipairs(previewObjects.Buttons) do
		button.TextColor3 = customTheme.Buttons
	end

end
--=======================================================
-- border
local function updateBorderObject(stroke, fixedColor)

	if not stroke then
		return
	end

	if effectsState.Border == "None" then

		stroke.Enabled = false

	elseif effectsState.Border == "Fixed" then

		stroke.Enabled = true
		stroke.Color = fixedColor

	elseif effectsState.Border == "Pulse" then

		stroke.Enabled = true

	end

end
local function updateBorder()

	updateBorderObject(
		mainStroke,
		currentThemeData.PulseBright
	)

	if previewObjects.Border then

		updateBorderObject(
			previewObjects.Border,
			customTheme.Border
		)

	end

end
-- title stroke
local function updateTitleObject(stroke, fixedColor)

	if not stroke then
		return
	end

	if effectsState.Title == "None" then

		stroke.Enabled = false

	elseif effectsState.Title == "Fixed" then

		stroke.Enabled = true
		stroke.Color = fixedColor

	elseif effectsState.Title == "Pulse" then

		stroke.Enabled = true

	end

end
local function updateTitle()

	updateTitleObject(
		titleStroke,
		currentThemeData.PulseBright
	)

	if previewObjects.TitleStroke then

		updateTitleObject(
			previewObjects.TitleStroke,
			customTheme.Title
		)

	end

end
-- subtitle
local function updateSubtitleObject(subtitle, title, normalPos, centerPos, fixedColor)

	if not subtitle then
		return
	end

	local subtitleEnabled = effectsState.Subtitle ~= "None"

	subtitle.Text = subtitleEnabled and "by What" or ""

	if effectsState.Subtitle == "Fixed" and fixedColor then
		subtitle.TextColor3 = fixedColor
	end

	if title then
		title.Position = subtitleEnabled and normalPos or centerPos
	end

end
local function updateSubtitle()

	updateSubtitleObject(
		subtitleLabel,
		titulo,
		TITLE_NORMAL_POS,
		TITLE_CENTER_POS,
		currentThemeData.PulseBright
	)

	if previewObjects.Subtitle then

		updateSubtitleObject(
			previewObjects.Subtitle,
			previewObjects.Title,
			PREVIEW_TITLE_NORMAL_POS,
			PREVIEW_TITLE_CENTER_POS,
			customTheme.Subtitle
		)

	end

end
--icons
local function updateIconObject(icon, fixedColor)

	if not icon then
		return
	end

	if effectsState.Icons == "None" then

		icon.ImageColor3 = Color3.fromRGB(255,255,255)

	elseif effectsState.Icons == "Fixed" then

		icon.ImageColor3 = fixedColor

	elseif effectsState.Icons == "Pulse" then

	end

end
local function updateIcons()

	for _, icon in ipairs(themedIcons) do
		updateIconObject(icon, currentThemeData.PulseBright)
	end

	for _, icon in ipairs(previewObjects.Icons) do
		updateIconObject(icon, customTheme.Icons)
	end

end
--buttons / toggles / box
local function updateButtonObject(btn, fixedColor)

	if not btn then
		return
	end

	if btn.Text ~= "◉" then
		return
	end

	if effectsState.Buttons == "None" then

		btn.TextColor3 = Color3.fromRGB(255,255,255)

	elseif effectsState.Buttons == "Fixed" then

		btn.TextColor3 = fixedColor

	elseif effectsState.Buttons == "Pulse" then

	end

end

local function updateToggleObject(data, fixedColor, noneColor)

	if not data or not data.active or not data.button then
		return
	end

	if effectsState.Buttons == "None" then

		data.button.BackgroundColor3 = noneColor

	elseif effectsState.Buttons == "Fixed" then

		data.button.BackgroundColor3 = fixedColor

	elseif effectsState.Buttons == "Pulse" then

	end

end

local function updatePreviewToggleObject(toggle, fixedColor, noneColor)

	if not toggle then
		return
	end

	if effectsState.Buttons == "None" then

		toggle.BackgroundColor3 = noneColor

	elseif effectsState.Buttons == "Fixed" then

		toggle.BackgroundColor3 = fixedColor

	elseif effectsState.Buttons == "Pulse" then

	end

end

local function updateSpeedObject(stroke, fixedColor)

	if not stroke then
		return
	end

	if effectsState.Buttons == "None" then

		stroke.Color = Color3.fromRGB(255,255,255)

	elseif effectsState.Buttons == "Fixed" then

		stroke.Color = fixedColor

	elseif effectsState.Buttons == "Pulse" then

	end

end

local function updateButtons()

	-- BUTTONS REAL
	for _, btn in ipairs(themedButtons) do

		local fixedColor = currentThemeData.PulseBright

		if selectedSolidTheme == "CUSTOM" then
			fixedColor = customTheme.Buttons
		end

		updateButtonObject(btn, fixedColor)

	end

	-- BUTTONS PREVIEW
	for _, btn in ipairs(previewObjects.Buttons) do
		updateButtonObject(btn, customTheme.Buttons)
	end

	-- TOGGLES REAL
	for _, data in pairs(toggleObjects) do

		local fixedColor = currentThemeData.PulseBright
		local noneColor = Color3.fromRGB(90,90,90)

		if selectedSolidTheme == "CUSTOM" then
			fixedColor = customTheme.Toggles
			noneColor = customTheme.Toggles
		end

		updateToggleObject(data, fixedColor, noneColor)

	end

	-- TOGGLES PREVIEW
	for _, toggle in ipairs(previewObjects.Toggles) do
        updatePreviewToggleObject(
            toggle,
            customTheme.Toggles,
            customTheme.Toggles
        )
    end

	-- SPEED BOXES REAL
	for _, stroke in ipairs(themedSpeedBoxes) do

		local fixedColor = currentThemeData.PulseBright

		if selectedSolidTheme == "CUSTOM" then
			fixedColor = customTheme.Speed
		end

		updateSpeedObject(stroke, fixedColor)

	end

end
--background
local function updateBackground()

    if effectsState.Background == "On" then
        bgArt.Visible = true

    elseif effectsState.Background == "Off" then
        bgArt.Visible = false
    end

end
-- divider
local function updateDividerObject(divider, fixedColor)

	if not divider then
		return
	end

	if effectsState.Divider == "None" then

		divider.Visible = false

	elseif effectsState.Divider == "Fixed" then

		divider.Visible = true
		divider.BackgroundColor3 = fixedColor

	elseif effectsState.Divider == "Pulse" then

		divider.Visible = true

	end

end
local function updateDivider()

	updateDividerObject(themeDivider, currentThemeData.PulseBright)
	updateDividerObject(settingsDivider, currentThemeData.PulseBright)
	updateDividerObject(effectsDivider, currentThemeData.PulseBright)

	if previewObjects.Divider then
		updateDividerObject(previewObjects.Divider, customTheme.Divider)
	end

end
-- applytheme
local function applyTheme(themeName)

	local theme = THEMES[themeName]

	if not theme then
		return
	end

    currentThemeData = theme
	if theme.Border then
		mainStroke.Color = theme.Border
	end

	-- Fondo
	if backgroundArt then
		backgroundArt.Image = "rbxassetid://" .. theme.BackgroundImage
	end

	-- TÃ­tulo
	if titleLabel then
		titleLabel.TextColor3 = theme.TitleColor
	end

	-- Borde del tÃ­tulo
	if titleStroke then
		titleStroke.Color = theme.TitleStroke
	end

    -- subtitulo
    if subtitleLabel then
	    subtitleLabel.TextColor3 = theme.SubtitleColor
    end

    -- divider
    if themeDivider then
	    themeDivider.BackgroundColor3 = theme.DividerColor
    end

	if settingsDivider then
   		settingsDivider.BackgroundColor3 = theme.DividerColor
	end

    --icons
    if themedIcons then

	    for _, icon in ipairs(themedIcons) do

			icon.ImageColor3 =
				theme.Icons or theme.Primary

		end
    end

	for _, button in ipairs(themedButtons) do

		if button:IsA("TextButton") then

			button.TextColor3 =
				theme.Buttons or theme.Primary

		end

	end

    --botones
    if themedExecuteButtons then
	    for _, obj in ipairs(themedExecuteButtons) do

            if obj:IsA("TextButton") then
                obj.TextColor3 = theme.Primary

            elseif obj:IsA("UIStroke") then
                obj.Color = theme.Primary
            end

        end
    end

	-- actualizar toggles activos/inactivos

	for _, data in pairs(toggleObjects) do

		if data.active then

       		data.button.BackgroundColor3 =
            	theme.RadioOnColor

    	else

        	data.button.BackgroundColor3 =
            	theme.RadioOffColor

    	end

	end

	updateBorder()
	updateTitle()
	updateSubtitle()
	updateIcons()
	updateButtons()

end

local function selectSolidTheme(themeName)

	selectedSolidTheme = themeName

	applyTheme(themeName)

	local currentTheme = THEMES[themeName]

	for name, data in pairs(themeRadioButtons) do

		if name == themeName then

			data.button.Text = "◉"

			if currentTheme then
				data.button.TextColor3 = currentTheme.RadioOnColor
			end

		else

			data.button.Text = "○"

			if currentTheme then
				data.button.TextColor3 = currentTheme.RadioOffColor
			end

		end

	end

end
--custom theme
local function setColorPickerPulseVisible(visible)

	if pickerPulseTitle then
		pickerPulseTitle.Visible = visible
	end

	if pickerPulseDescription then
		pickerPulseDescription.Visible = visible
	end

	if pickerPulsePanel then
		pickerPulsePanel.Visible = visible
	end

	if pickerPulsePreview then
		pickerPulsePreview.Visible = visible
	end

	if not colorPickerWindow then
		return
	end

	if visible then

		colorPickerWindow.Size = UDim2.new(0,330,0,265)
		colorPickerWindow.Position = UDim2.new(0.5,-165,0.5,-132)

		if pickerWheel then
			pickerWheel.Position = UDim2.new(0,125,0,45)
		end

		if pickerDarkness then
			pickerDarkness.Position = UDim2.new(0,295,0,45)
		end

		if pickerApplyButton then
			pickerApplyButton.Position = UDim2.new(0.5,-50,1,-35)
		end

	else

		colorPickerWindow.Size = UDim2.new(0,250,0,250)
		colorPickerWindow.Position = UDim2.new(0.5,-125,0.5,-125)

		if pickerWheel then
			pickerWheel.Position = UDim2.new(0,25,0,40)
		end

		if pickerDarkness then
			pickerDarkness.Position = UDim2.new(0,205,0,40)
		end

		if pickerApplyButton then
			pickerApplyButton.Position = UDim2.new(0.5,0,1,-25)
		end

	end

end

local function openColorPicker(propertyName)

	currentEditingProperty = propertyName
	print("Abriendo picker para:", propertyName)

	currentPickerMode = effectsState[propertyName] == "Pulse" and "Pulse" or "Solid"

	setColorPickerPulseVisible(currentPickerMode == "Pulse")

	if colorPickerWindow then
		colorPickerWindow.Visible = true
	end

    if customPulseTheme[propertyName] then

        pulseColors = {
            Main = customPulseTheme[propertyName].Main,
            Mid = customPulseTheme[propertyName].Mid,
            End = customPulseTheme[propertyName].End,
        }

        if pulseRadioButtons.Main then
            pulseRadioButtons.Main.preview.BackgroundColor3 = pulseColors.Main
            pulseRadioButtons.Mid.preview.BackgroundColor3 = pulseColors.Mid
            pulseRadioButtons.End.preview.BackgroundColor3 = pulseColors.End
        end

    end

end
--aquiii
local function selectCategory(name)

	selectedThemeCategory = name
	themeDropdown.Text = name .. " ▼"

	themeOptions.Visible = false
	themeOptions.Size = UDim2.new(0,140,0,0)

    clearCategoryContent()

	categoryContent.Size = UDim2.new(0,260,0,0)

    if name == "Solid" then

   		categoryContent.Size = UDim2.new(0,260,0,150)

    	for _, themeName in ipairs(solidThemes) do

        	local radio = createThemeRadio(themeName, categoryContent)

        	themeRadioButtons[themeName] = radio

        	radio.button.Activated:Connect(function()
            	selectSolidTheme(themeName)
        	end)

    	end

    	selectSolidTheme(selectedSolidTheme)

	elseif name == "Custom" then

		local function styleColorBox(box)

			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0,5)
			corner.Parent = box

			local stroke = Instance.new("UIStroke")
			stroke.Thickness = 2
			stroke.Color = Color3.fromRGB(70,70,70)
			stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			stroke.Parent = box

		end


    	categoryContent.Size = UDim2.new(0,260,0,390)
		--custom colour
        local function applyCustomTheme()
		
            appliedCustomTheme = cloneThemeTable(customTheme)
            appliedCustomPulseTheme = cloneThemeTable(customPulseTheme)

			if titulo then
				titulo.TextColor3 = appliedCustomTheme.Title
			end

			if subtitulo then
				subtitulo.TextColor3 = appliedCustomTheme.Subtitle
			end

			if effectsDivider then
				effectsDivider.BackgroundColor3 = appliedCustomTheme.Divider
			end

			if settingsDivider then
				settingsDivider.BackgroundColor3 = appliedCustomTheme.Divider
			end

			if themeDivider then
				themeDivider.BackgroundColor3 = appliedCustomTheme.Divider
			end

			if mainStroke then
				mainStroke.Color = appliedCustomTheme.Border
			end

			if titleStroke then
				titleStroke.Color = appliedCustomTheme.TitleStroke
			end

			for _, icon in ipairs(themedIcons) do
				icon.ImageColor3 = appliedCustomTheme.Icons
			end

			for _, button in ipairs(themedButtons) do

				if button.Text == "◉" then
					button.TextColor3 = appliedCustomTheme.Buttons
				end

			end

			for _, label in ipairs(themedOptions) do
				label.TextColor3 = appliedCustomTheme.Options
			end

			for _,data in pairs(toggleObjects) do

    			if data.active then
					print("Repintando toggle")
        			data.button.BackgroundColor3 = appliedCustomTheme.Toggles
    			end

			end
			print(customTheme.Speed)
			for _, stroke in ipairs(themedSpeedBoxes) do
    			stroke.Color = appliedCustomTheme.Speed
			end

		end

		local previewButton
    	local previewFrame = Instance.new("Frame")
		previewFrame.Size = UDim2.new(0,150,0,180)
    	previewFrame.Position = UDim2.new(0.5,-75,0,0)
    	previewFrame.BackgroundColor3 = Color3.fromRGB(5,5,5)
    	previewFrame.BorderSizePixel = 0
    	previewFrame.Parent = categoryContent
		local previewCorner = Instance.new("UICorner")
		previewCorner.CornerRadius = UDim.new(0,10)
		previewCorner.Parent = previewFrame
		local previewStroke = Instance.new("UIStroke")
		previewStroke.Thickness = 1
		previewStroke.Color = Color3.fromRGB(255,255,255)
		previewStroke.Parent = previewFrame
		local previewTitle = Instance.new("TextLabel")
		previewTitle.Size = UDim2.new(1,0,0,2)
		previewTitle.Position = UDim2.new(0,0,0,8)
		previewTitle.BackgroundTransparency = 1
		previewTitle.Text = "THE BEST"
		previewTitle.FontFace = Font.fromName("Michroma")
		previewTitle.TextSize = 16
		previewTitle.TextColor3 = Color3.fromRGB(255,50,50)
		previewTitle.Parent = previewFrame
		local previewTStroke = Instance.new("UIStroke")
		previewTStroke.Thickness = 1
		previewTStroke.Color = Color3.fromRGB(255,255,255)
		previewTStroke.Parent = previewTitle
		local previewSubtitle = Instance.new("TextLabel")
		previewSubtitle.Size = UDim2.new(1,0,0,-14)
		previewSubtitle.Position = UDim2.new(0,0,0,28)
		previewSubtitle.BackgroundTransparency = 1
		previewSubtitle.Text = "by What"
		previewSubtitle.Font = Enum.Font.Gotham
		previewSubtitle.TextSize = 8
		previewSubtitle.TextColor3 = Color3.fromRGB(255,255,255)
		previewSubtitle.Parent = previewFrame
		local previewDivider = Instance.new("Frame")
		previewDivider.Size = UDim2.new(1,-25,0,1)
		previewDivider.Position = UDim2.new(0,13,0,28)
		previewDivider.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewDivider.BorderSizePixel = 0
		previewDivider.Parent = previewFrame
		previewObjects = {
    		Frame = previewFrame,
    		Border = previewStroke,
    		Title = previewTitle,
			TitleStroke = previewTStroke,
    		Subtitle = previewSubtitle,
    		Divider = previewDivider,

    		Icons = {},
    		Options = {},
    		Toggles = {},
    		Buttons = {},
			Speed = {}
		}
		--picker color pulse
        local pulseRadioButtons = {}
        local currentPulseSlot = "Main"
        local setPickerColor

		local function createPulseSlot(parent, name, yPos)

    		-- Radio
    		local radio = Instance.new("TextButton")
    		radio.Size = UDim2.new(0,16,0,16)
    		radio.Position = UDim2.new(0,5,0,yPos + 3)

    		radio.BackgroundTransparency = 1
    		radio.Text = "○"
    		radio.Font = Enum.Font.GothamBold
    		radio.TextSize = 16
    		radio.TextColor3 = Color3.new(1,1,1)

    		radio.Parent = parent

   			-- Texto
    		local label = Instance.new("TextLabel")
    		label.Size = UDim2.new(0,45,0,20)
    		label.Position = UDim2.new(0,25,0,yPos)

    		label.BackgroundTransparency = 1
    		label.Text = name
    		label.FontFace = Font.fromName("Michroma")
    		label.TextSize = 11
    		label.TextColor3 = Color3.new(1,1,1)
    		label.TextXAlignment = Enum.TextXAlignment.Left

    		label.Parent = parent

    		-- Preview
    		local preview = Instance.new("TextButton")
    		preview.Size = UDim2.new(0,14,0,14)
    		preview.Position = UDim2.new(0,78,0,yPos + 4)

    		preview.BackgroundColor3 = Color3.new(1,1,1)
    		preview.BorderSizePixel = 0
    		preview.Text = ""

    		preview.Parent = parent

    		styleColorBox(preview)

    		pulseRadioButtons[name] = {
        		radio = radio,
        		preview = preview,
        		label = label
    		}

            radio.Activated:Connect(function()

	            currentPulseSlot = name

	            for slotName, data in pairs(pulseRadioButtons) do
		            data.radio.Text = (slotName == currentPulseSlot) and "◉" or "○"
	            end

	            selectedColor = pulseColors[currentPulseSlot]
                setPickerColor(selectedColor)

            end)

		end
		--========================================
		--move
		local UserInputService = game:GetService("UserInputService")
		local draggingWindow = false
		local dragStart
		local startPos
		local updateColorButtons
		local sliderDragging = false
		local dragging = false
		local sliderDragging = false
		local wheelDragging = false
		local currentH = 0
		local currentS = 0
		local selectedColor = Color3.new(1,1,1)

        local function isPointerDown(input)
            return input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
        end

        local function isPointerMove(input)
            return input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch
        end
		--mini hub infinite jump
		local previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,11,0,36)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Infinite Jump"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		local previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,32)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Infinite Jump"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		local previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,34)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		local toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		local previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		local knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini hub Fullbright 
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,11,0,56)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Fullbright"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,52)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Fullbright"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,54)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini hub Noclip 
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,15,0,15)
		previewIcon.Position = UDim2.new(0,9,0,73)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Noclip"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,72)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Noclip"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,74)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini hub Teleport 
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,12,0,96)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Teleport"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,92)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Teleport"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,94)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini hub Coin Farm 
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,12,0,116)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Coin Farm"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,112)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Coin Farm"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,114)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini hub Buy All
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,12,0,136)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Buy All"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,132)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Buy All"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewToggle = Instance.new("Frame")
		previewToggle.Size = UDim2.new(0,24,0,12)
		previewToggle.Position = UDim2.new(1,-35,0,134)
		previewToggle.BackgroundColor3 = Color3.fromRGB(255,50,50)
		previewToggle.Parent = previewFrame
		table.insert(previewObjects.Toggles, previewToggle)
		toggleCorner = Instance.new("UICorner")
		toggleCorner.CornerRadius = UDim.new(1,0)
		toggleCorner.Parent = previewToggle
		previewKnob = Instance.new("Frame")
		previewKnob.Size = UDim2.new(0,8,0,8)
		previewKnob.Position = UDim2.new(1,-10,0.5,-4)
		previewKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
		previewKnob.Parent = previewToggle
		knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1,0)
		knobCorner.Parent = previewKnob
		--mini Ignored Items hub 
		previewIcon = Instance.new("ImageLabel")
		previewIcon.Size = UDim2.new(0,10,0,10)
		previewIcon.Position = UDim2.new(0,12,0,156)
		previewIcon.BackgroundTransparency = 1
		previewIcon.Image = "rbxassetid://" .. ICONS["Ignored Items"]
		previewIcon.Parent = previewFrame
		table.insert(previewObjects.Icons, previewIcon)
		previewOption = Instance.new("TextLabel")
		previewOption.Size = UDim2.new(0,90,0,16)
		previewOption.Position = UDim2.new(0,26,0,152)
		previewOption.BackgroundTransparency = 1
		previewOption.Text = "Ignored items"
		previewOption.Font = Enum.Font.Gotham
		previewOption.TextSize = 10
		previewOption.TextColor3 = Color3.new(1,1,1)
		previewOption.TextXAlignment = Enum.TextXAlignment.Left
		previewOption.Parent = previewFrame
		table.insert(previewObjects.Options, previewOption)
		previewButton = Instance.new("TextLabel")
		previewButton.Size = UDim2.new(0,90,0,16)
		previewButton.Position = UDim2.new(0,122,0,152)
		previewButton.BackgroundTransparency = 1
		previewButton.Text = "◉"
		previewButton.Font = Enum.Font.Gotham
		previewButton.TextSize = 12
		previewButton.TextColor3 = Color3.new(1,1,1)
		previewButton.TextXAlignment = Enum.TextXAlignment.Left
		previewButton.Parent = previewFrame
		table.insert(previewObjects.Buttons, previewButton)
		local colorsFrame = Instance.new("Frame")
		colorsFrame.Size = UDim2.new(1,0,0,170)
		colorsFrame.BackgroundTransparency = 1
		colorsFrame.Parent = categoryContent
		--Picker Color
		local pickerFrame = Instance.new("Frame")
		pickerFrame.Size = UDim2.new(0,330,0,265)
		pickerFrame.Position = UDim2.new(0.5,-110,0.5,-90)
		pickerFrame.BackgroundColor3 = Color3.fromRGB(1,1,1)
		pickerFrame.Visible = false
        pickerFrame.Active = true
        pickerFrame.Parent = screenGui
		local pickerCorner = Instance.new("UICorner")
		pickerCorner.CornerRadius = UDim.new(0,10)
		pickerCorner.Parent = pickerFrame
		local pickerStroke = Instance.new("UIStroke")
		pickerStroke.Color = Color3.fromRGB(255,255,255)
		pickerStroke.Parent = pickerFrame
		local pickerTitle = Instance.new("TextLabel")
		pickerTitle.Size = UDim2.new(1,0,0,25)
		pickerTitle.BackgroundTransparency = 1
		pickerTitle.Text = "Color Picker"
		pickerTitle.TextColor3 = Color3.new(1,1,1)
		pickerTitle.Parent = pickerFrame
		pickerTitle.Active = true

        pulseColors = {
            Main = customTheme.PulseMain,
            Mid = customTheme.PulseMid,
            End = customTheme.PulseEnd,
        }
		
        local pulseTitle = Instance.new("TextLabel")
        pulseTitle.Size = UDim2.new(0,110,0,18)
        pulseTitle.Position = UDim2.new(0,8,0,24)
        pulseTitle.BackgroundTransparency = 1
        pulseTitle.Text = "Pulse"
        pulseTitle.FontFace = Font.fromName("Michroma")
        pulseTitle.TextSize = 15
        pulseTitle.TextColor3 = Color3.new(1,1,1)
        pulseTitle.TextXAlignment = Enum.TextXAlignment.Left
        pulseTitle.Parent = pickerFrame
        pickerPulseTitle = pulseTitle

        local pulseDescription = Instance.new("TextLabel")
        pulseDescription.Size = UDim2.new(0,130,0,50)
        pulseDescription.Position = UDim2.new(0,8,0,43)
        pulseDescription.BackgroundTransparency = 1
        pulseDescription.Text = "Choose the colors used by the pulse effect."
        pulseDescription.Font = Enum.Font.Gotham
        pulseDescription.TextSize = 12
        pulseDescription.TextColor3 = Color3.fromRGB(190,190,190)
        pulseDescription.TextWrapped = true
        pulseDescription.TextXAlignment = Enum.TextXAlignment.Left
        pulseDescription.TextYAlignment = Enum.TextYAlignment.Top
        pulseDescription.Parent = pickerFrame
        pickerPulseDescription = pulseDescription

        local pulsePanel = Instance.new("Frame")
        pulsePanel.Size = UDim2.new(0,110,0,120)
        pulsePanel.Position = UDim2.new(0,8,0,72)
        pulsePanel.BackgroundTransparency = 1
        pulsePanel.Visible = true
        pulsePanel.Parent = pickerFrame
        pickerPulsePanel = pulsePanel

		createPulseSlot(pulsePanel,"Main",3)
		createPulseSlot(pulsePanel,"Mid",31)
		createPulseSlot(pulsePanel,"End",59)

        pulseRadioButtons["Main"].radio.Text = "◉"

        for name, data in pairs(pulseRadioButtons) do
            data.preview.BackgroundColor3 = pulseColors[name]
        end

        local pulsePreview = Instance.new("Frame")
        pulsePreview.Size = UDim2.new(0,100,0,14)
        pulsePreview.Position = UDim2.new(0,13,0,165)
        pulsePreview.BorderSizePixel = 0
        pulsePreview.Parent = pickerFrame
        pickerPulsePreview = pulsePreview

        local pulsePreviewCorner = Instance.new("UICorner")
        pulsePreviewCorner.CornerRadius = UDim.new(0,4)
        pulsePreviewCorner.Parent = pulsePreview

        pulseGradient = Instance.new("UIGradient")
        --[[pulseGradient.Parent = pulsePreview

        updatePulsePreview()]]

        task.spawn(function()

            local t = 0

            while true do

                if pulsePreview.Visible then

                    t += 0.03

                    if t >= 4 then
                        t = 0
                    end

                    local color = getPulseColor(
                        pulseColors.Main,
                        pulseColors.Mid,
                        pulseColors.End,
                        t
                    )

                    pulsePreview.BackgroundColor3 = color

                    task.wait(0.03)

                else

                    task.wait(0.1)

                end

            end

        end)
		
        --================================================
		local closeButton = Instance.new("TextButton")
		closeButton.Size = UDim2.new(0,25,0,25)
		closeButton.Position = UDim2.new(1,-30,0,0)
		closeButton.Text = "X"
		closeButton.TextColor3 = Color3.new(1,1,1)
		closeButton.BackgroundTransparency = 1
		closeButton.Parent = pickerFrame
		closeButton.Activated:Connect(function()

			pickerFrame.Visible = false

		end)

		pickerTitle.InputBegan:Connect(function(input)

            if isPointerDown(input) then

                draggingWindow = true
                dragStart = input.Position
                startPos = pickerFrame.Position

            end

        end)

        UserInputService.InputEnded:Connect(function(input)

            if isPointerDown(input) then
                draggingWindow = false
            end

        end)
		local applyButton = Instance.new("TextButton")
		applyButton.Size = UDim2.new(0,100,0,25)
		applyButton.Position = UDim2.new(0.5,-50,1,-35)
        applyButton.FontFace = Font.fromName("Michroma")
        applyButton.TextSize = 12
		applyButton.Text = "APPLY"
        applyButton.BackgroundColor3 = Color3.fromRGB(1,1,1)
        applyButton.TextColor3 = Color3.new(255,255,255)
		applyButton.Parent = pickerFrame
        styleColorBox(applyButton)
        pickerApplyButton = applyButton
		colorPickerWindow = pickerFrame
		local colourWheel = Instance.new("ImageLabel")
		colourWheel.Size = UDim2.new(0,150,0,150)
		colourWheel.Position = UDim2.new(0,125,0,45)
		colourWheel.BackgroundTransparency = 1
		colourWheel.Image = "rbxassetid://6020299385"
		colourWheel.Parent = pickerFrame
        colourWheel.Active = true
        pickerWheel = colourWheel
		local wheelPicker = Instance.new("Frame")
		wheelPicker.Size = UDim2.new(0,10,0,10)
		wheelPicker.AnchorPoint = Vector2.new(0.5,0.5)
		wheelPicker.Position = UDim2.new(0.5,0,0.5,0)
		wheelPicker.BackgroundColor3 = Color3.new(1,1,1)
		wheelPicker.Parent = colourWheel
		--slider
		local darknessPicker = Instance.new("Frame")
		darknessPicker.Size = UDim2.new(0,20,0,150)
		darknessPicker.Position = UDim2.new(0,295,0,45)
		darknessPicker.BorderSizePixel = 0
		darknessPicker.Parent = pickerFrame
        darknessPicker.Active = true
        pickerDarkness = darknessPicker
		local darknessGradient = Instance.new("UIGradient")
		darknessGradient.Rotation = 90

		darknessGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
			ColorSequenceKeypoint.new(1, Color3.new(0,0,0))
		}

		darknessGradient.Parent = darknessPicker

		local darknessSlider = Instance.new("Frame")
		darknessSlider.Size = UDim2.new(1,4,0,4)
		darknessSlider.Position = UDim2.new(0,-2,0,0)

		darknessSlider.BackgroundColor3 = Color3.new(1,1,1)
		darknessSlider.BorderSizePixel = 0

		darknessSlider.Parent = darknessPicker

		local sliderCorner = Instance.new("UICorner")
		sliderCorner.CornerRadius = UDim.new(1,0)
		sliderCorner.Parent = darknessSlider

        setPickerColor = function(color)

            local h, s, v = color:ToHSV()

            currentH = h
            currentS = s
            selectedColor = color

            -- mover slider
            local y = (1 - v) * darknessPicker.AbsoluteSize.Y

            darknessSlider.Position = UDim2.new(
                0,
                -2,
                0,
                y
            )

            -- mover selector del cÃ­rculo
            local radius = colourWheel.AbsoluteSize.X / 2

            local angle = (1 - h) * math.pi * 2

            local dist = s * radius

            local dx = math.cos(angle) * dist
            local dy = -math.sin(angle) * dist

            wheelPicker.Position = UDim2.new(
                0,
                radius + dx,
                0,
                radius + dy
            )

            local wheelColor = Color3.fromHSV(h,s,1)

            darknessGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0,wheelColor),
                ColorSequenceKeypoint.new(1,Color3.new(0,0,0))
            }

        end

		colourWheel.InputBegan:Connect(function(input)
            frame.Draggable = true

			if isPointerDown(input) then

				wheelDragging = true

			end

		end)

		colourWheel.InputEnded:Connect(function(input)

			if isPointerDown(input) then

				wheelDragging = false

			end

		end)

		darknessPicker.InputBegan:Connect(function(input)
            frame.Draggable = true

			if isPointerDown(input) then

				sliderDragging = true

			end

		end)

		darknessPicker.InputEnded:Connect(function(input)

			if isPointerDown(input) then

				sliderDragging = false

			end

		end)

		UserInputService.InputChanged:Connect(function(input)

            if not isPointerMove(input) then
                return
            end

            if draggingWindow then

                local delta = input.Position - dragStart

                pickerFrame.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )

                return

            end

            if wheelDragging then

			local absPos = colourWheel.AbsolutePosition
			local absSize = colourWheel.AbsoluteSize

			local x = input.Position.X - absPos.X
			local y = input.Position.Y - absPos.Y

			local centerX = absSize.X / 2
			local centerY = absSize.Y / 2

			local dx = x - centerX
			local dy = y - centerY

			local radius = absSize.X / 2

			local distance = math.sqrt(dx * dx + dy * dy)

			if distance > radius then

				dx = dx / distance * radius
				dy = dy / distance * radius

			end

			wheelPicker.Position = UDim2.new(
				0,
				centerX + dx,
				0,
				centerY + dy
			)

			local centreOfWheel =
				Vector2.new(
					colourWheel.AbsolutePosition.X
						+ colourWheel.AbsoluteSize.X/2,

					colourWheel.AbsolutePosition.Y
						+ colourWheel.AbsoluteSize.Y/2
				)

			local colourPickerCentre =
				Vector2.new(
					colourWheel.AbsolutePosition.X
						+ centerX + dx,

					colourWheel.AbsolutePosition.Y
						+ centerY + dy
				)

			local h =
				(math.pi - math.atan2(
					colourPickerCentre.Y - centreOfWheel.Y,
					colourPickerCentre.X - centreOfWheel.X
				))
				/
				(math.pi * 2)

			local s =
				(centreOfWheel - colourPickerCentre).Magnitude
				/
				(colourWheel.AbsoluteSize.X/2)

			local wheelColor =
				Color3.fromHSV(
					math.clamp(h,0,1),
					math.clamp(s,0,1),
					1
				)

			darknessGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, wheelColor),
				ColorSequenceKeypoint.new(1, Color3.new(0,0,0))
			}

			local v =
				1 - (
					darknessSlider.Position.Y.Offset
					/
					darknessPicker.AbsoluteSize.Y
				)

			currentH = math.clamp(h,0,1)
			currentS = math.clamp(s,0,1)

			selectedColor =
    			Color3.fromHSV(
        			currentH,
        			currentS,
        			math.clamp(v,0,1)
    			)
			end

            if pulsePanel.Visible then
                pulseColors[currentPulseSlot] = selectedColor
                pulseRadioButtons[currentPulseSlot].preview.BackgroundColor3 = selectedColor
                updatePulsePreview()
            end

			if sliderDragging then

				local y = math.clamp(
					input.Position.Y - darknessPicker.AbsolutePosition.Y,
					0,
					darknessPicker.AbsoluteSize.Y
				)

				darknessSlider.Position = UDim2.new(
					0,
					-2,
					0,
					y
				)
				local v =
    				1 - (
       					y /
        				darknessPicker.AbsoluteSize.Y
    				)

				selectedColor =
    				Color3.fromHSV(
        				currentH,
        				currentS,
        				math.clamp(v,0,1)
    				)

                if pulsePanel.Visible then
                    pulseColors[currentPulseSlot] = selectedColor
                    pulseRadioButtons[currentPulseSlot].preview.BackgroundColor3 = selectedColor
                    updatePulsePreview()
                end

			end

		end)

		local pickerCorner = Instance.new("UICorner")
		pickerCorner.CornerRadius = UDim.new(1,0)
		pickerCorner.Parent = wheelPicker

		local pickerStroke = Instance.new("UIStroke")
		pickerStroke.Color = Color3.new(0,0,0)
		pickerStroke.Parent = wheelPicker

		applyButton.Activated:Connect(function()

            if currentPickerMode == "Pulse" then

                if currentEditingProperty and customPulseTheme[currentEditingProperty] then

                    customPulseTheme[currentEditingProperty].Main = pulseColors.Main
                    customPulseTheme[currentEditingProperty].Mid = pulseColors.Mid
                    customPulseTheme[currentEditingProperty].End = pulseColors.End

                end

                updateColorButtons()
                pickerFrame.Visible = false

                return

            end

			if currentEditingProperty == "Title" then

				customTheme.Title = selectedColor
				updatePreviewTitle()

			elseif currentEditingProperty == "Subtitle" then

				customTheme.Subtitle = selectedColor
				updatePreviewSubtitle()

			elseif currentEditingProperty == "Border" then

				customTheme.Border = selectedColor
				updatePreviewBorder()

			elseif currentEditingProperty == "Divider" then

				customTheme.Divider = selectedColor
				updatePreviewDivider()

			elseif currentEditingProperty == "TitleStroke" then

				customTheme.TitleStroke = selectedColor
				updatePreviewTitleStroke()

			elseif currentEditingProperty == "Icons" then

				customTheme.Icons = selectedColor
				updatePreviewIcons()

			elseif currentEditingProperty == "Options" then

				customTheme.Options = selectedColor
				updatePreviewOptions()

			elseif currentEditingProperty == "Toggles" then

				customTheme.Toggles = selectedColor
				updatePreviewToggles()

			elseif currentEditingProperty == "Buttons" then

				customTheme.Buttons = selectedColor
				updatePreviewButtons()

			elseif currentEditingProperty == "Speed" then

    			print("EntrÃ³ a Speed")
    			customTheme.Speed = selectedColor
    			print(customTheme.Speed)

			end
            
			updateColorButtons()
			pickerFrame.Visible = false

		end)

		local leftX = -10
		local rightX = 145

		local startY = 10
		local rowHeight = 30

		local leftLabelX = 20
		local leftColorX = 96 -- BOTON IZQUIERDO

		local rightLabelX = 130
		local rightColorX = 250 -- BOTON DERECHO

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Size = UDim2.new(0,50,0,25)
		titleLabel.Position = UDim2.new(0,leftX,0,startY)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = "TITLE"
		titleLabel.TextColor3 = Color3.new(1,1,1)
		titleLabel.FontFace = Font.fromName("Michroma")
		titleLabel.TextSize = 13
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.Parent = colorsFrame

		local titleColor = Instance.new("TextButton")
		titleColor.Size = UDim2.new(0,20,0,20)
		titleColor.Position = UDim2.new(0,leftColorX,0,startY+2)
		titleColor.BackgroundColor3 = customTheme.Title
		titleColor.Text = ""
		titleColor.Parent = colorsFrame
		styleColorBox(titleColor)

		local subtitleLabel = Instance.new("TextLabel")
		subtitleLabel.Size = UDim2.new(0,60,0,25)
		subtitleLabel.Position = UDim2.new(0,rightX,0,startY)
		subtitleLabel.BackgroundTransparency = 1
		subtitleLabel.Text = "SUBTITLE"
		subtitleLabel.TextColor3 = Color3.new(1,1,1)
		subtitleLabel.FontFace = Font.fromName("Michroma")
		subtitleLabel.TextSize = 13
		subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
		subtitleLabel.Parent = colorsFrame

		local subtitleColor = Instance.new("TextButton")
		subtitleColor.Size = UDim2.new(0,20,0,20)
		subtitleColor.Position = UDim2.new(0,rightColorX,0,startY + 2)
		subtitleColor.BackgroundColor3 = customTheme.Subtitle
		subtitleColor.Text = ""
		subtitleColor.Parent = colorsFrame
		styleColorBox(subtitleColor)

		local borderLabel = Instance.new("TextLabel")
		borderLabel.Size = UDim2.new(0,50,0,25)
		borderLabel.Position = UDim2.new(0,leftX,0,startY + rowHeight)
		borderLabel.BackgroundTransparency = 1
		borderLabel.Text = "BORDER"
		borderLabel.TextColor3 = Color3.new(1,1,1)
		borderLabel.FontFace = Font.fromName("Michroma")
		borderLabel.TextSize = 13
		borderLabel.TextXAlignment = Enum.TextXAlignment.Left
		borderLabel.Parent = colorsFrame

		local borderColor = Instance.new("TextButton")
		borderColor.Size = UDim2.new(0,20,0,20)
		borderColor.Position = UDim2.new(0,leftColorX,0,startY + rowHeight + 2)
		borderColor.BackgroundColor3 = customTheme.Border
		borderColor.Text = ""
		borderColor.Parent = colorsFrame
		styleColorBox(borderColor)
		
		local dividerLabel = Instance.new("TextLabel")
		dividerLabel.Size = UDim2.new(0,60,0,25)
		dividerLabel.Position = UDim2.new(0,rightX,0,startY + rowHeight)
		dividerLabel.BackgroundTransparency = 1
		dividerLabel.Text = "DIVIDER"
		dividerLabel.TextColor3 = Color3.new(1,1,1)
		dividerLabel.FontFace = Font.fromName("Michroma")
		dividerLabel.TextSize = 13
		dividerLabel.TextXAlignment = Enum.TextXAlignment.Left
		dividerLabel.Parent = colorsFrame

		local dividerColor = Instance.new("TextButton")
		dividerColor.Size = UDim2.new(0,20,0,20)
		dividerColor.Position = UDim2.new(0,rightColorX,0,startY + rowHeight + 2)
		dividerColor.BackgroundColor3 = customTheme.Divider
		dividerColor.Text = ""
		dividerColor.Parent = colorsFrame
		styleColorBox(dividerColor)

		local titleStrokeLabel = Instance.new("TextLabel")
		titleStrokeLabel.Size = UDim2.new(0,70,0,25)
		titleStrokeLabel.Position = UDim2.new(0,leftX,0,startY + rowHeight*2)
		titleStrokeLabel.BackgroundTransparency = 1
		titleStrokeLabel.Text = "TITLESTROKE"
		titleStrokeLabel.TextColor3 = Color3.new(1,1,1)
		titleStrokeLabel.FontFace = Font.fromName("Michroma")
		titleStrokeLabel.TextSize = 13
		titleStrokeLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleStrokeLabel.Parent = colorsFrame

		local titleStrokeColor = Instance.new("TextButton")
		titleStrokeColor.Size = UDim2.new(0,20,0,20)
		titleStrokeColor.Position = UDim2.new(0,leftColorX,0,startY + rowHeight*2 + 2)
		titleStrokeColor.BackgroundColor3 = customTheme.TitleStroke
		titleStrokeColor.Text = ""
		titleStrokeColor.Parent = colorsFrame
		styleColorBox(titleStrokeColor)

		local iconsLabel = Instance.new("TextLabel")
		iconsLabel.Size = UDim2.new(0,50,0,25)
		iconsLabel.Position = UDim2.new(0,rightX,0,startY + rowHeight*2)
		iconsLabel.BackgroundTransparency = 1
		iconsLabel.Text = "ICONS"
		iconsLabel.TextColor3 = Color3.new(1,1,1)
		iconsLabel.FontFace = Font.fromName("Michroma")
		iconsLabel.TextSize = 13
		iconsLabel.TextXAlignment = Enum.TextXAlignment.Left
		iconsLabel.Parent = colorsFrame

		local iconsColor = Instance.new("TextButton")
		iconsColor.Size = UDim2.new(0,20,0,20)
		iconsColor.Position = UDim2.new(0,rightColorX,0,startY + rowHeight*2 + 2)
		iconsColor.BackgroundColor3 = customTheme.Icons
		iconsColor.Text = ""
		iconsColor.Parent = colorsFrame
		styleColorBox(iconsColor)

		local optionsLabel = Instance.new("TextLabel")
		optionsLabel.Size = UDim2.new(0,50,0,25)
		optionsLabel.Position = UDim2.new(0,leftX,0,startY + rowHeight*3)
		optionsLabel.BackgroundTransparency = 1
		optionsLabel.Text = "OPTIONS"
		optionsLabel.TextColor3 = Color3.new(1,1,1)
		optionsLabel.FontFace = Font.fromName("Michroma")
		optionsLabel.TextSize = 13
		optionsLabel.TextXAlignment = Enum.TextXAlignment.Left
		optionsLabel.Parent = colorsFrame

		local optionsColor = Instance.new("TextButton")
		optionsColor.Size = UDim2.new(0,20,0,20)
		optionsColor.Position = UDim2.new(0,leftColorX,0,startY + rowHeight*3 + 2)
		optionsColor.BackgroundColor3 = customTheme.Options
		optionsColor.Text = ""
		optionsColor.Parent = colorsFrame
		styleColorBox(optionsColor)

		local togglesLabel = Instance.new("TextLabel")
		togglesLabel.Size = UDim2.new(0,60,0,25)
		togglesLabel.Position = UDim2.new(0,rightX,0,startY + rowHeight*3)
		togglesLabel.BackgroundTransparency = 1
		togglesLabel.Text = "TOGGLES"
		togglesLabel.TextColor3 = Color3.new(1,1,1)
		togglesLabel.FontFace = Font.fromName("Michroma")
		togglesLabel.TextSize = 13
		togglesLabel.TextXAlignment = Enum.TextXAlignment.Left
		togglesLabel.Parent = colorsFrame

		local togglesColor = Instance.new("TextButton")
		togglesColor.Size = UDim2.new(0,20,0,20)
		togglesColor.Position = UDim2.new(0,rightColorX,0,startY + rowHeight*3 + 2)
		togglesColor.BackgroundColor3 = customTheme.Toggles
		togglesColor.Text = ""
		togglesColor.Parent = colorsFrame
		styleColorBox(togglesColor)

		local buttonsLabel = Instance.new("TextLabel")
		buttonsLabel.Size = UDim2.new(0,50,0,25)
		buttonsLabel.Position = UDim2.new(0,leftX,0,startY + rowHeight*4)
		buttonsLabel.BackgroundTransparency = 1
		buttonsLabel.Text = "BUTTONS"
		buttonsLabel.TextColor3 = Color3.new(1,1,1)
		buttonsLabel.FontFace = Font.fromName("Michroma")
		buttonsLabel.TextSize = 13
		buttonsLabel.TextXAlignment = Enum.TextXAlignment.Left
		buttonsLabel.Parent = colorsFrame

		local buttonsColor = Instance.new("TextButton")
		buttonsColor.Size = UDim2.new(0,20,0,20)
		buttonsColor.Position = UDim2.new(0,leftColorX,0,startY + rowHeight*4 + 2)
		buttonsColor.BackgroundColor3 = customTheme.Buttons
		buttonsColor.Text = ""
		buttonsColor.Parent = colorsFrame
		styleColorBox(buttonsColor)
		-- custom colour
		applyCustomThemeButton = Instance.new("TextButton")
		applyCustomThemeButton.Size = UDim2.new(0,140,0,32)
		applyCustomThemeButton.Position = UDim2.new(0.5,-70,0,startY + rowHeight*5 + 15)
		applyCustomThemeButton.Text = "APPLY THEME"
		applyCustomThemeButton.FontFace = Font.fromName("Michroma")
		applyCustomThemeButton.TextSize = 12
		applyCustomThemeButton.BackgroundColor3 = Color3.fromRGB(1,1,1)
		applyCustomThemeButton.TextColor3 = Color3.new(1,1,1)
		applyCustomThemeButton.BorderSizePixel = 0
		applyCustomThemeButton.Parent = colorsFrame
		styleColorBox(applyCustomThemeButton)
		--speed box
		local speedLabel = Instance.new("TextLabel")
		speedLabel.Size = UDim2.new(0,70,0,25)
		speedLabel.Position = UDim2.new(0,rightX,0,startY + rowHeight*4)
		speedLabel.BackgroundTransparency = 1
		speedLabel.Text = "SPEED"
		speedLabel.TextColor3 = Color3.new(1,1,1)
		speedLabel.FontFace = Font.fromName("Michroma")
		speedLabel.TextSize = 13
		speedLabel.TextXAlignment = Enum.TextXAlignment.Left
		speedLabel.Parent = colorsFrame

		local speedColor = Instance.new("TextButton")
		speedColor.Size = UDim2.new(0,20,0,20)
		speedColor.Position = UDim2.new(0,rightColorX,0,startY + rowHeight*4 + 2)
		speedColor.BackgroundColor3 = customTheme.Speed
		speedColor.Text = ""
		speedColor.Parent = colorsFrame
		print("Creando speedColor:", speedColor)

		styleColorBox(speedColor)

        colorPreviewButtons = {
            Title = titleColor,
            Subtitle = subtitleColor,
            Border = borderColor,
            Divider = dividerColor,
            TitleStroke = titleStrokeColor,
            Icons = iconsColor,
            Options = optionsColor,
            Toggles = togglesColor,
            Buttons = buttonsColor,
            Speed = speedColor,
        }

		applyCustomThemeButton.Activated:Connect(function()

			selectedSolidTheme = "CUSTOM"

			applyCustomTheme()

		end)
		print("Speed guardado:", customTheme.Speed)
		updateColorButtons = function()
			print("Preview Speed:", customTheme.Speed)

			titleColor.BackgroundColor3 = customTheme.Title
			subtitleColor.BackgroundColor3 = customTheme.Subtitle
			borderColor.BackgroundColor3 = customTheme.Border
			dividerColor.BackgroundColor3 = customTheme.Divider
			titleStrokeColor.BackgroundColor3 = customTheme.TitleStroke
			iconsColor.BackgroundColor3 = customTheme.Icons
			optionsColor.BackgroundColor3 = customTheme.Options
			togglesColor.BackgroundColor3 = customTheme.Toggles
			buttonsColor.BackgroundColor3 = customTheme.Buttons
			speedColor.BackgroundColor3 = customTheme.Speed

		end

		titleColor.Activated:Connect(function()

			openColorPicker("Title")

		end)
		subtitleColor.Activated:Connect(function()

			openColorPicker("Subtitle")

		end)

		borderColor.Activated:Connect(function()

			openColorPicker("Border")

		end)

		dividerColor.Activated:Connect(function()

			openColorPicker("Divider")

		end)

		titleStrokeColor.Activated:Connect(function()

			openColorPicker("TitleStroke")

		end)

		iconsColor.Activated:Connect(function()

			openColorPicker("Icons")

		end)

		optionsColor.Activated:Connect(function()

			openColorPicker("Options")

		end)

		togglesColor.Activated:Connect(function()

			openColorPicker("Toggles")

		end)

		buttonsColor.Activated:Connect(function()

			openColorPicker("Buttons")

		end)
		print("Conectando evento Speed")
		speedColor.Activated:Connect(function()
			print("CLICK EN SPEED")
   			openColorPicker("Speed")
		end)

	end

end
--==================================================
--================= EFFECT LOOPS ===================
--==================================================
task.spawn(function()

    local theme
    local color

    while true do

        -- oscuro -> brillante
        for step = 0, 50 do
            local i = step / 50

            theme = currentThemeData

            color = theme.PulseDark:Lerp(
                theme.PulseBright,
                i
            )

            buttonStroke.Color = color
            icon.ImageColor3 = color

            task.wait(0.03)
        end

        -- brillante -> claro
        for step = 0, 50 do
            local i = step / 50
    
            theme = currentThemeData

            color = theme.PulseBright:Lerp(
                theme.PulseLight,
                i
            )

            buttonStroke.Color = color
            icon.ImageColor3 = color

            task.wait(0.03)
        end

        -- claro -> brillante
        for step = 0, 50 do
            local i = step / 50

            theme = currentThemeData

            color = theme.PulseLight:Lerp(
                theme.PulseBright,
                i
            )

            buttonStroke.Color = color
            icon.ImageColor3 = color

            task.wait(0.03)
        end

        -- brillante -> oscuro
        for step = 0, 50 do
            local i = step / 50

            theme = currentThemeData

            color = theme.PulseBright:Lerp(
                theme.PulseDark,
                i
            )

            buttonStroke.Color = color
            icon.ImageColor3 = color

            task.wait(0.03)
        end

    end
end)

task.spawn(function()
	while true do

		-- rojo oscuro -> rojo brillante
		for i = 0, 1, 0.02 do
			ignoreStroke.Color = Color3.new(0.4 + (0.6 * i), 0, 0)
			task.wait(0.03)
		end

		-- rojo -> blanco
		for i = 0, 1, 0.02 do
			ignoreStroke.Color = Color3.new(1, i, i)
			task.wait(0.03)
		end

		-- blanco -> rojo
		for i = 1, 0, -0.02 do
			ignoreStroke.Color = Color3.new(1, i, i)
			task.wait(0.03)
		end

		-- rojo brillante -> rojo oscuro
		for i = 1, 0, -0.02 do
			ignoreStroke.Color = Color3.new(0.4 + (0.6 * i), 0, 0)
			task.wait(0.03)
		end

	end
end)

-- loop principal
local function getCustomPulseColor(propertyName, t)

	local colors = appliedCustomPulseTheme[propertyName]

	if selectedSolidTheme == "CUSTOM" and colors then
		return getPulseColor(colors.Main, colors.Mid, colors.End, t)
	end

	return getPulseColor(
		currentThemeData.PulseDark,
		currentThemeData.PulseBright,
		currentThemeData.PulseLight,
		t
	)

end

local function getPreviewPulseColor(propertyName, t)

	local colors = customPulseTheme[propertyName]

	if colors then
		return getPulseColor(colors.Main, colors.Mid, colors.End, t)
	end

	return getCustomPulseColor(propertyName, t)

end

local function applyPulseColor(t)

	if effectsState.Border == "Pulse" then

		local color = getCustomPulseColor("Border", t)
		local previewColor = getPreviewPulseColor("Border", t)

		mainStroke.Color = color

		if previewObjects.Border then
			previewObjects.Border.Color = previewColor
		end

	end

	if effectsState.Subtitle == "Pulse" then

		local color = getCustomPulseColor("Subtitle", t)
		local previewColor = getPreviewPulseColor("Subtitle", t)

		subtitleLabel.TextColor3 = color

		if previewObjects.Subtitle then
			previewObjects.Subtitle.TextColor3 = previewColor
		end

	end

	if effectsState.Divider == "Pulse" then

		local color = getCustomPulseColor("Divider", t)
		local previewColor = getPreviewPulseColor("Divider", t)

		themeDivider.BackgroundColor3 = color
		settingsDivider.BackgroundColor3 = color
		effectsDivider.BackgroundColor3 = color

		if previewObjects.Divider then
			previewObjects.Divider.BackgroundColor3 = previewColor
		end

		if othersDivider then
			othersDivider.BackgroundColor3 = color
		end

	end

	if effectsState.TitleStroke == "Pulse" then

		local color = getCustomPulseColor("TitleStroke", t)
		local previewColor = getPreviewPulseColor("TitleStroke", t)

		titleStroke.Color = color

		if previewObjects.TitleStroke then
			previewObjects.TitleStroke.Color = previewColor
		end

	end

	if effectsState.Icons == "Pulse" then

		local color = getCustomPulseColor("Icons", t)
		local previewColor = getPreviewPulseColor("Icons", t)

		for _, icon in ipairs(themedIcons) do
			icon.ImageColor3 = color
		end

		if previewObjects.Icons then
			for _, icon in ipairs(previewObjects.Icons) do
				icon.ImageColor3 = previewColor
			end
		end

	end

	if effectsState.Buttons == "Pulse" then

		local color = getCustomPulseColor("Buttons", t)
		local previewButtonColor = getPreviewPulseColor("Buttons", t)
		local previewToggleColor = getPreviewPulseColor("Toggles", t)

		for _, btn in ipairs(themedButtons) do
			if btn.Text == "◉" then
				btn.TextColor3 = color
			end
		end

		if previewObjects.Buttons then
			for _, btn in ipairs(previewObjects.Buttons) do
				if btn.Text == "◉" then
					btn.TextColor3 = previewButtonColor
				end
			end
		end

		for _, data in pairs(toggleObjects) do
			if data.active and data.button then
				data.button.BackgroundColor3 = color
			end
		end

		if previewObjects.Toggles then
			for _, toggle in ipairs(previewObjects.Toggles) do
				toggle.BackgroundColor3 = previewToggleColor
			end
		end

		for _, stroke in ipairs(themedSpeedBoxes) do
			stroke.Color = color
		end

	end

	if colorPreviewButtons then

		if effectsState.TitleStroke == "Pulse" then
			colorPreviewButtons.Title.BackgroundColor3 = getPreviewPulseColor("Title", t)
			colorPreviewButtons.TitleStroke.BackgroundColor3 = getPreviewPulseColor("TitleStroke", t)
		end

		if effectsState.Subtitle == "Pulse" then
			colorPreviewButtons.Subtitle.BackgroundColor3 = getPreviewPulseColor("Subtitle", t)
		end

		if effectsState.Border == "Pulse" then
			colorPreviewButtons.Border.BackgroundColor3 = getPreviewPulseColor("Border", t)
		end

		if effectsState.Divider == "Pulse" then
			colorPreviewButtons.Divider.BackgroundColor3 = getPreviewPulseColor("Divider", t)
		end

		if effectsState.Icons == "Pulse" then
			colorPreviewButtons.Icons.BackgroundColor3 = getPreviewPulseColor("Icons", t)
		end

		if effectsState.Buttons == "Pulse" then
			colorPreviewButtons.Buttons.BackgroundColor3 = getPreviewPulseColor("Buttons", t)
			colorPreviewButtons.Toggles.BackgroundColor3 = getPreviewPulseColor("Toggles", t)
			colorPreviewButtons.Speed.BackgroundColor3 = getPreviewPulseColor("Speed", t)
		end

	end

end

task.spawn(function()

	local t = 0

	while true do

		t += 0.05 * pulseSpeed

		if t >= 4 then
			t = 0
		end

		applyPulseColor(t)

		task.wait(0.03)

	end

end)

function syncConfigurationInputs()

	if uiScaleBox then

		local value = tonumber(uiScaleBox.Text)

		if value then
			currentUIScale = math.clamp(value, 0.5, 2)
			uiScaleBox.Text = tostring(currentUIScale)

			if uiScale then
				uiScale.Scale = currentUIScale
			end
		end

	end

	if speedValueBox then

		local value = tonumber(speedValueBox.Text)

		if value then
			savedSpeedValue = math.clamp(value, 10, 999)
			speedValueBox.Text = tostring(savedSpeedValue)
		end

	end

end

function Config.applyVisuals()

	if selectedSolidTheme ~= "CUSTOM" then
		applyTheme(selectedSolidTheme)
	end

	if selectedSolidTheme == "CUSTOM" then

		if titulo then
			titulo.TextColor3 = appliedCustomTheme.Title
		end

		if titleStroke then
			titleStroke.Color = appliedCustomTheme.TitleStroke
		end

		if subtitleLabel then
			subtitleLabel.TextColor3 = appliedCustomTheme.Subtitle
		end

	end

	if uiScale then
		uiScale.Scale = currentUIScale
	end

	if uiScaleBox then
		uiScaleBox.Text = tostring(currentUIScale)
	end

    if applySavedSpeedValue then
        applySavedSpeedValue()
    elseif speedValueBox then
        speedValueBox.Text = tostring(savedSpeedValue)
    end

	if refreshIgnoredItemsUI then
		refreshIgnoredItemsUI()
	end

    for name, value in pairs(state) do
        if togglesUI[name] then
            togglesUI[name].set(value)
            handleToggle(name, value)
        end
    end

	updateBorder()
	updateTitle()
	updateSubtitle()
	updateIcons()
	updateButtons()
	updateDivider()
	updateBackground()

end
--==================================================
--============== EFFECT FUNCTIONS II ===============
--==================================================
updateBorder()
updateTitle()
updateSubtitle()
updateIcons()
updateButtons()
updateBackground()
updateDivider()
--==================================================
--================ EFFECTS UI ======================
--==================================================
local function clearOthersUI()

	for _, child in ipairs(othersContent:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end

end
local function createOthersButton(text)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0,220,0,30)
	btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    btn.BackgroundTransparency = 1
	btn.BorderSizePixel = 0
	btn.Text = text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Parent = othersContent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = btn

	return btn

end

function createPulseSpeedSlider()

	local row = Instance.new("Frame")
	row.Size = UDim2.new(0,220,0,42)
	row.BackgroundTransparency = 1
    row.Active = true
    row.Parent = othersContent

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,0,0,18)
	label.BackgroundTransparency = 1
	label.Text = "Pulse Speed: "..string.format("%.1fx", pulseSpeed)
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 14
	label.TextColor3 = Color3.new(1,1,1)
	label.Parent = row

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1,-20,0,6)
	bar.Position = UDim2.new(0,10,0,28)
	bar.BackgroundColor3 = Color3.fromRGB(70,70,70)
    bar.BorderSizePixel = 0
    bar.Active = true
    bar.Parent = row

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new((pulseSpeed - 0.2) / 2.8,0,1,0)
	fill.BackgroundColor3 = Color3.fromRGB(255,255,255)
	fill.BorderSizePixel = 0
    fill.Active = true
    fill.Parent = bar

	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0,14,0,14)
	knob.Position = UDim2.new(fill.Size.X.Scale, -7, 0.5, -7)
	knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
	knob.BorderSizePixel = 0
    knob.Active = true
    knob.Parent = bar

	local dragging = false

	local function updateSlider(inputX)
		local alpha = math.clamp(
			(inputX - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
			0,
			1
		)

		pulseSpeed = 0.2 + (alpha * 2.8)

		fill.Size = UDim2.new(alpha,0,1,0)
		knob.Position = UDim2.new(alpha,-7,0.5,-7)
		label.Text = "Pulse Speed: "..string.format("%.1fx", pulseSpeed)
	end

	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
            frame.Draggable = false
			updateSlider(input.Position.X)
		end
	end)

	knob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
            frame.Draggable = false
			updateSlider(input.Position.X)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateSlider(input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
            frame.Draggable = true
		end
	end)

end

local function showOthersCustom()

	clearOthersUI()

	local saveConfigButton = createOthersButton("Save Configuration")
    local loadConfigButton = createOthersButton("Load Configuration")
    createPulseSpeedSlider()

	saveConfigButton.Activated:Connect(function()
        Config.save()
    end)

    loadConfigButton.Activated:Connect(function()
        Config.load()
    end)

	task.wait()

	othersContent.Size = UDim2.new(
		0,260,
		0,
		othersLayout.AbsoluteContentSize.Y + 10
	)

end

local function clearEffectsUI()
    for _,child in ipairs(effectsContent:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

local function createRadio(parent, selected, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,20,0,20)
    btn.BackgroundTransparency = 1
    btn.Text = selected and "◉" or "○"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255,255,255)

    btn.Activated:Connect(callback)
    btn.Parent = parent

    return btn
end

local function createEffectRow(parent, name)

	local row = Instance.new("Frame")
	row.Size = UDim2.new(1,0,0,25)
	row.BackgroundTransparency = 1
	row.Parent = parent

	-- LABEL
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0,100,1,0)
	label.Position = UDim2.new(0,col.Label,0,0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 14
	label.TextColor3 = Color3.new(1,1,1)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = row

	local options

	if name == "Background" then
    	options = {"On","Off"}
	else
    	options = {"None","Fixed","Pulse"}
	end

	local buttons = {}

	local function refreshButtons()

    	for optionName, button in pairs(buttons) do

        	local selected

        	if name == "Background" then

    			selected = (effectsState.Background == optionName)

			else

    			selected = (effectsState[name] == optionName)

			end

        	if selected then

    			button.Text = "◉"

    			if selectedSolidTheme == "CUSTOM" then

        			button.TextColor3 = customTheme.Buttons

    			elseif effectsState.Buttons == "None" then

        			button.TextColor3 = Color3.fromRGB(255,255,255)

    			elseif effectsState.Buttons == "Fixed" then

        			button.TextColor3 = currentThemeData.PulseBright

    			end

			else

    			button.Text = "○"
    			button.TextColor3 = Color3.fromRGB(150,150,150)

			end

    	end

	end

	for _,opt in ipairs(options) do

		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0,20,0,20)

		table.insert(themedButtons, btn)

		if opt == "None" or opt == "Off" then
    		btn.Position = UDim2.new(0,col.None,0.5,-10)

		elseif opt == "Fixed" or opt == "On" then
    		btn.Position = UDim2.new(0,col.Fixed,0.5,-10)

		elseif opt == "Pulse" then
    		btn.Position = UDim2.new(0,col.Pulse,0.5,-10)
		end

		buttons[opt] = btn

		btn.BackgroundTransparency = 1

		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 18
		btn.Parent = row

		btn.Activated:Connect(function()

    		if name == "Background" then

    			effectsState.Background = opt

    			updateBackground()
    			refreshButtons()

			else

    			effectsState[name] = opt

				refreshButtons()

				if name == "Border" then
					updateBorder()

				elseif name == "TitleStroke" then
					updateTitle()

				elseif name == "Subtitle" then
					updateSubtitle()

				elseif name == "Icons" then
					updateIcons()

				elseif name == "Buttons" then
    				updateButtons()

				elseif name == "Divider" then
    				updateDivider()
				end

			end

		end)

	end
	refreshButtons()
end

local function showEffectsCustom()

	clearEffectsUI()

	-- HEADER
	local header = Instance.new("Frame")
	header.Size = UDim2.new(1,0,0,20)
	header.BackgroundTransparency = 1
	header.Parent = effectsContent

	local function makeHeader(text, x, offset, width)
		local lbl = Instance.new("TextLabel")
		lbl.Size = UDim2.new(0, width or 80, 1, 0)
		lbl.Position = UDim2.new(0, x + (offset or 0), 0, 0)
		lbl.BackgroundTransparency = 1
		lbl.Text = text
		lbl.Font = Enum.Font.GothamBold
		lbl.TextSize = 12
		lbl.TextColor3 = Color3.fromRGB(255,255,255)
		lbl.Parent = header
	end

	local headers = {
		{"STATE", col.Label, -13, 60},
		{"NONE",  col.None,  -31, 80},
		{"FIXED", col.Fixed, -28, 80},
		{"PULSE", col.Pulse, -33, 80},
	}

	for _, data in ipairs(headers) do
		makeHeader(data[1], data[2], data[3], data[4])
	end

	local list = {
    	"Border",
    	"TitleStroke",
    	"Subtitle",
    	"Icons",
    	"Buttons",
    	"Divider",
		"Background"
	}

	for _,name in ipairs(list) do
		createEffectRow(effectsContent, name)
	end

	task.wait()

	effectsContent.Size = UDim2.new(
		0,260,
		0,
		effectsLayout.AbsoluteContentSize.Y +30
	)
end
--==================================================
--=============== MENU FUNCTIONS ===================
--==================================================
local function showMain()

	currentPage = "Main"

	optionsContainer.Visible = true
	settingsContainer.Visible = false

	titulo.Visible = true
	subtitulo.Visible = true

	settingsTitle.Visible = false
	
	backBtn.Visible = false
	settingsBtn.Visible = true


end

local function showSettings()

	currentPage = "Settings"

	optionsContainer.Visible = false
	settingsContainer.Visible = true

	titulo.Visible = false
	subtitulo.Visible = false

	settingsTitle.Visible = true
	backBtn.Visible = true
	settingsBtn.Visible = false


end

local function toggleMenu()

    if animating then
        return
    end

    animating = true

    if visible then

        local tween = TweenService:Create(
            frame,
            TweenInfo.new(
                0.35,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out
            ),
            {
                Position = offscreenPos
            }
        )

        tween:Play()

        tween.Completed:Connect(function()
            frame.Visible = false
            visible = false
            animating = false
        end)

    else

        frame.Position = offscreenPos
        frame.Visible = true

        local tween = TweenService:Create(
            frame,
            TweenInfo.new(
                0.35,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out
            ),
            {
                Position = originalPos
            }
        )

        tween:Play()

        tween.Completed:Connect(function()
            visible = true
            animating = false
        end)

    end

end

defaultOption = createThemeOption("Default")
solidOption = createThemeOption("Solid")
customOption = createThemeOption("Custom")
defaultOption.BackgroundTransparency = 1
solidOption.BackgroundTransparency = 1
customOption.BackgroundTransparency = 1
--==================================================
--================ MENU OPTIONS ====================
--==================================================
-- OPTIONS
crearOpcion("Infinite Jump")
crearOpcion("Fullbright")
crearOpcion("Noclip")
crearOpcion("Teleport")
crearSpeedBox()
crearOpcion("Coin Farm")
crearOpcion("Buy All")
crearBotonExecute("Ignored Items")
crearOpcion("Speed Battle X4")
crearOpcion("Infinite Roll")
crearBotonExecute("Re-Join")
crearBotonExecute("Server Hop")
updateIcons()
--==================================================
--================ SOCIAL SYSTEM ===================
--==================================================
local spacer = Instance.new("Frame")
spacer.Size = UDim2.new(0,260,0,-10)
spacer.BackgroundTransparency = 1
spacer.Parent = optionsContainer

local socialFrame = Instance.new("Frame")
socialFrame.Size = UDim2.new(0,260,0,40)
socialFrame.BackgroundTransparency = 1
socialFrame.Parent = optionsContainer
-- SOCIAL
local function crearSocial(nombre, imagen, posicion)

	local btn = Instance.new("ImageButton")
	btn.Size = UDim2.new(0,38,0,38)
	btn.Position = posicion
	btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
	btn.BorderSizePixel = 0
	btn.Image = imagen
	btn.Parent = socialFrame


	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,10)
	corner.Parent = btn

    table.insert(themedExecuteButtons, stroke)

	return btn
end
youtube = crearSocial(
	"YouTube",
	"rbxassetid://125307718842922",
	UDim2.new(0.5,-50,0,0)
)

discord = crearSocial(
	"Discord",
	"rbxassetid://112923634253188",
	UDim2.new(0.5,10,0,0)
)
--==================================================
--==================== EVENTS ======================
--==================================================
local effectsExpanded = false

effectsDropdown.Activated:Connect(function()

    effectsExpanded = not effectsExpanded

    if effectsExpanded then

        effectsDropdown.Text = "Custom ▼"

        showEffectsCustom()

    else

        effectsDropdown.Text = "Custom ▶"

        clearEffectsUI()

        effectsContent.Size = UDim2.new(0,260,0,0)

    end

end)

themeDropdown.Activated:Connect(function()

	themeOptions.Visible = not themeOptions.Visible

	if themeOptions.Visible then
		themeOptions.Size = UDim2.new(0,140,0,96)
	else
		themeOptions.Size = UDim2.new(0,140,0,0)
	end

end)

local othersExpanded = false

othersDropdown.Activated:Connect(function()

	othersExpanded = not othersExpanded

	if othersExpanded then

		othersDropdown.Text = "Custom ▼"
		showOthersCustom()

	else

		othersDropdown.Text = "Custom ▶"
		clearOthersUI()
		othersContent.Size = UDim2.new(0,260,0,0)

	end

end)

defaultOption.Activated:Connect(function()
	selectCategory("Default")
end)

solidOption.Activated:Connect(function()
	selectCategory("Solid")
end)

customOption.Activated:Connect(function()
	selectCategory("Custom")
end)

settingsBtn.Activated:Connect(function()

	if currentPage == "Main" then
		showSettings()
	end

end)

uiScaleBox.FocusLost:Connect(function()

	local value = tonumber(uiScaleBox.Text)

	if value then

		value = math.clamp(value, 0.5, 2)

		currentUIScale = value
		uiScale.Scale = value

		uiScaleBox.Text = tostring(value)

	else

		uiScaleBox.Text = tostring(currentUIScale)

	end

end)

backBtn.Activated:Connect(function()

	showMain()

end)

toggleButton.Activated:Connect(toggleMenu)

youtube.Activated:Connect(function()

	pcall(function()
		setclipboard("https://youtube.com/@eclipse-hub-1")
	end)

	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Prion Hub",
			Text = "YouTube link copied!",
			Duration = 3
		})
	end)

end)

discord.Activated:Connect(function()

	pcall(function()
		setclipboard("https://discord.gg/7wp3NY5N")
	end)

	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Prion Hub",
			Text = "Discord link copied!",
			Duration = 3
		})
	end)

end)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	optionsContainer.CanvasSize = UDim2.new(
		0,
		0,
		0,
		layout.AbsoluteContentSize.Y + 10
	)
end)
--==================================================
--================= THE END 😎 =====================
--==================================================
print("Prion Hub cargado correctamente")
applyTheme(selectedSolidTheme)
