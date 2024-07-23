--[[

	BladeLua by Bladesify © CC0 1.0 Universal (2024)

	https://github.com/Bladesifyyy

Dont Try to skid you scums, just enjoy the cheat & go on with your day your not a programmer or coder...
]]

--// Cache

local loadstring, getgenv, setclipboard, tablefind, UserInputService = loadstring, getgenv, setclipboard, table.find, game:GetService("UserInputService")

--// Loaded check

if BladeLua or BladeLuaV2Loaded then
    return
end

--// Environment

getgenv().BladeLua = {}

--// Load Modules

loadstring(game:HttpGet("https://raw.githubusercontent.com/Bladesifyyy/BladeLua.main/Updates/Aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bladesifyyy/BladeLua.main/Updates/Wall%2520Hack.lua"))()

--// Variables

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library
local Aimbot, WallHack = getgenv().BladeLua.Aimbot, getgenv().BladeLua.WallHack
local Parts, Fonts, TracersType = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}, {"UI", "System", "Plex", "Monospace"}, {"Bottom", "Center", "Mouse"}

--// Frame

Library.UnloadCallback = function()
	Aimbot.Functions:Exit()
	WallHack.Functions:Exit()
	getgenv().BladeLua = nil
end

local MainFrame = Library:CreateWindow({
	Name = "BladeLua",
	Themeable = {
        Image = "395920627",
		Info = "Original Creator Exunys\nEdited & Updated By Bladesify",
		Credit = false
	},
	Background = "",
    Theme = [[{"__Designer.Colors.topGradient":"FF00FF","__Designer.Colors.section":"FF69B4","__Designer.Colors.hoveredOptionBottom":"FFA07A","__Designer.Background.ImageAssetID":"", "__Designer.Colors.selectedOption":"FF69B4","__Designer.Colors.unselectedOption":"ADADAD","__Designer.Files.WorkspaceFile":"BladeLua","__Designer.Colors.unhoveredOptionTop":"4F4F4F","__Designer.Colors.outerBorder":"4F4F4F","__Designer.Background.ImageColor":"4F4F4F","__Designer.Colors.tabText":"FFFFFF","__Designer.Colors.elementBorder":"0B0B0B","__Designer.Background.ImageTransparency":100,"__Designer.Colors.background":"1A1A1A","__Designer.Colors.innerBorder":"535353","__Designer.Colors.bottomGradient":"212121","__Designer.Colors.sectionBackground":"262626","__Designer.Colors.hoveredOptionTop":"FFD700","__Designer.Colors.otherElementText":"7B44A8","__Designer.Colors.main":"FF00FF","__Designer.Colors.elementText":"FFFFFF","__Designer.Colors.unhoveredOptionBottom":"3E3E3E","__Designer.Background.UseBackgroundImage":true}]];
    })

--// Tabs

local AimbotTab = MainFrame:CreateTab({
	Name = "Aimbot"
})

local VisualsTab = MainFrame:CreateTab({
	Name = "Visuals"
})


local FunctionsTab = MainFrame:CreateTab({
	Name = "Functions"
})

--// Aimbot Sections

local Values = AimbotTab:CreateSection({
	Name = "Values"
})

local Checks = AimbotTab:CreateSection({
	Name = "Checks"
})

local ThirdPerson = AimbotTab:CreateSection({
	Name = "Third Person"
})

local FOV_Values = AimbotTab:CreateSection({
	Name = "Field Of View",
	Side = "Right"
})

local FOV_Appearance = AimbotTab:CreateSection({
	Name = "FOV Circle Appearance",
	Side = "Right"
})

--// Visuals Sections

local WallHackChecks = VisualsTab:CreateSection({
	Name = "Checks"
})

local ESPSettings = VisualsTab:CreateSection({
	Name = "ESP Settings"
})

local BoxesSettings = VisualsTab:CreateSection({
	Name = "Boxes Settings"
})

local ChamsSettings = VisualsTab:CreateSection({
	Name = "Chams Settings"
})

local TracersSettings = VisualsTab:CreateSection({
	Name = "Tracers Settings",
	Side = "Right"
})

local HeadDotsSettings = VisualsTab:CreateSection({
	Name = "Head Dots Settings",
	Side = "Right"
})

local HealthBarSettings = VisualsTab:CreateSection({
	Name = "Health Bar Settings",
	Side = "Right"
})

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Functions"
})

--// Aimbot Values

Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.Settings.Enabled,
	Callback = function(New, Old)
		Aimbot.Settings.Enabled = New
	end
}).Default = Aimbot.Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Aimbot.Settings.Toggle,
	Callback = function(New, Old)
		Aimbot.Settings.Toggle = New
	end
}).Default = Aimbot.Settings.Toggle

Aimbot.Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Aimbot.Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = New
	end
}).Default = Aimbot.Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Aimbot.Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.Sensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Aimbot.Settings.Sensitivity

--// Aimbot Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Aimbot.Settings.TeamCheck,
	Callback = function(New, Old)
		Aimbot.Settings.TeamCheck = New
	end
}).Default = Aimbot.Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Aimbot.Settings.WallCheck,
	Callback = function(New, Old)
		Aimbot.Settings.WallCheck = New
	end
}).Default = Aimbot.Settings.WallCheck

Checks:AddToggle({
	Name = "Alive Check",
	Value = Aimbot.Settings.AliveCheck,
	Callback = function(New, Old)
		Aimbot.Settings.AliveCheck = New
	end
}).Default = Aimbot.Settings.AliveCheck

--// Aimbot ThirdPerson

ThirdPerson:AddToggle({
	Name = "Enable Third Person",
	Value = Aimbot.Settings.ThirdPerson,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPerson = New
	end
}).Default = Aimbot.Settings.ThirdPerson

ThirdPerson:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.ThirdPersonSensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPersonSensitivity = New
	end,
	Min = 0.1,
	Max = 5,
	Decimals = 1
}).Default = Aimbot.Settings.ThirdPersonSensitivity

--// FOV Settings Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.FOVSettings.Enabled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Enabled = New
	end
}).Default = Aimbot.FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = Aimbot.FOVSettings.Visible,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Visible = New
	end
}).Default = Aimbot.FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = Aimbot.FOVSettings.Amount,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 300
}).Default = Aimbot.FOVSettings.Amount

--// FOV Settings Appearance

FOV_Appearance:AddToggle({
	Name = "Filled",
	Value = Aimbot.FOVSettings.Filled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Filled = New
	end
}).Default = Aimbot.FOVSettings.Filled

FOV_Appearance:AddSlider({
	Name = "Transparency",
	Value = Aimbot.FOVSettings.Transparency,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimal = 1
}).Default = Aimbot.FOVSettings.Transparency

FOV_Appearance:AddSlider({
	Name = "Sides",
	Value = Aimbot.FOVSettings.Sides,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = Aimbot.FOVSettings.Sides

FOV_Appearance:AddSlider({
	Name = "Thickness",
	Value = Aimbot.FOVSettings.Thickness,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Thickness = New
	end,
	Min = 1,
	Max = 50
}).Default = Aimbot.FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = Aimbot.FOVSettings.Color,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Color = New
	end
}).Default = Aimbot.FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = Aimbot.FOVSettings.LockedColor,
	Callback = function(New, Old)
		Aimbot.FOVSettings.LockedColor = New
	end
}).Default = Aimbot.FOVSettings.LockedColor

--// Wall Hack Settings

WallHackChecks:AddToggle({
	Name = "Enabled",
	Value = WallHack.Settings.Enabled,
	Callback = function(New, Old)
		WallHack.Settings.Enabled = New
	end
}).Default = WallHack.Settings.Enabled

WallHackChecks:AddToggle({
	Name = "Team Check",
	Value = WallHack.Settings.TeamCheck,
	Callback = function(New, Old)
		WallHack.Settings.TeamCheck = New
	end
}).Default = WallHack.Settings.TeamCheck

WallHackChecks:AddToggle({
	Name = "Alive Check",
	Value = WallHack.Settings.AliveCheck,
	Callback = function(New, Old)
		WallHack.Settings.AliveCheck = New
	end
}).Default = WallHack.Settings.AliveCheck

--// Visuals Settings

ESPSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.ESPSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.Enabled = New
	end
}).Default = WallHack.Visuals.ESPSettings.Enabled

ESPSettings:AddToggle({
	Name = "Outline",
	Value = WallHack.Visuals.ESPSettings.Outline,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.Outline = New
	end
}).Default = WallHack.Visuals.ESPSettings.Outline

ESPSettings:AddToggle({
	Name = "Display Distance",
	Value = WallHack.Visuals.ESPSettings.DisplayDistance,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.DisplayDistance = New
	end
}).Default = WallHack.Visuals.ESPSettings.DisplayDistance

ESPSettings:AddToggle({
	Name = "Display Health",
	Value = WallHack.Visuals.ESPSettings.DisplayHealth,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.DisplayHealth = New
	end
}).Default = WallHack.Visuals.ESPSettings.DisplayHealth

ESPSettings:AddToggle({
	Name = "Display Name",
	Value = WallHack.Visuals.ESPSettings.DisplayName,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.DisplayName = New
	end
}).Default = WallHack.Visuals.ESPSettings.DisplayName

ESPSettings:AddSlider({
	Name = "Offset",
	Value = WallHack.Visuals.ESPSettings.Offset,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.Offset = New
	end,
	Min = -30,
	Max = 30
}).Default = WallHack.Visuals.ESPSettings.Offset

ESPSettings:AddColorpicker({
	Name = "Text Color",
	Value = WallHack.Visuals.ESPSettings.TextColor,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.TextColor = New
	end
}).Default = WallHack.Visuals.ESPSettings.TextColor

ESPSettings:AddColorpicker({
	Name = "Outline Color",
	Value = WallHack.Visuals.ESPSettings.OutlineColor,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.OutlineColor = New
	end
}).Default = WallHack.Visuals.ESPSettings.OutlineColor

ESPSettings:AddSlider({
	Name = "Text Transparency",
	Value = WallHack.Visuals.ESPSettings.TextTransparency,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.TextTransparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.ESPSettings.TextTransparency

ESPSettings:AddSlider({
	Name = "Text Size",
	Value = WallHack.Visuals.ESPSettings.TextSize,
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.TextSize = New
	end,
	Min = 8,
	Max = 24
}).Default = WallHack.Visuals.ESPSettings.TextSize

ESPSettings:AddDropdown({
	Name = "Text Font",
	Value = Fonts[WallHack.Visuals.ESPSettings.TextFont + 1],
	Callback = function(New, Old)
		WallHack.Visuals.ESPSettings.TextFont = Drawing.Fonts[New]
	end,
	List = Fonts,
	Nothing = "UI"
}).Default = Fonts[WallHack.Visuals.ESPSettings.TextFont + 1]

BoxesSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.BoxSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Enabled = New
	end
}).Default = WallHack.Visuals.BoxSettings.Enabled

BoxesSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Visuals.BoxSettings.Transparency,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.BoxSettings.Transparency

BoxesSettings:AddSlider({
	Name = "Thickness",
	Value = WallHack.Visuals.BoxSettings.Thickness,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = WallHack.Visuals.BoxSettings.Thickness

BoxesSettings:AddSlider({
	Name = "Scale Increase (For 3D)",
	Value = WallHack.Visuals.BoxSettings.Increase,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Increase = New
	end,
	Min = 1,
	Max = 5
}).Default = WallHack.Visuals.BoxSettings.Increase

BoxesSettings:AddColorpicker({
	Name = "Color",
	Value = WallHack.Visuals.BoxSettings.Color,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Color = New
	end
}).Default = WallHack.Visuals.BoxSettings.Color

BoxesSettings:AddDropdown({
	Name = "Type",
	Value = WallHack.Visuals.BoxSettings.Type == 1 and "3D" or "2D",
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Type = New == "3D" and 1 or 2
	end,
	List = {"3D", "2D"},
	Nothing = "3D"
}).Default = WallHack.Visuals.BoxSettings.Type == 1 and "3D" or "2D"

BoxesSettings:AddToggle({
	Name = "Filled (2D Square)",
	Value = WallHack.Visuals.BoxSettings.Filled,
	Callback = function(New, Old)
		WallHack.Visuals.BoxSettings.Filled = New
	end
}).Default = WallHack.Visuals.BoxSettings.Filled

ChamsSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.ChamsSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.Enabled = New
	end
}).Default = WallHack.Visuals.ChamsSettings.Enabled

ChamsSettings:AddToggle({
	Name = "Filled",
	Value = WallHack.Visuals.ChamsSettings.Filled,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.Filled = New
	end
}).Default = WallHack.Visuals.ChamsSettings.Filled

ChamsSettings:AddToggle({
	Name = "Entire Body (For R15 Rigs)",
	Value = WallHack.Visuals.ChamsSettings.EntireBody,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.EntireBody = New
	end
}).Default = WallHack.Visuals.ChamsSettings.EntireBody

ChamsSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Visuals.ChamsSettings.Transparency,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.ChamsSettings.Transparency

ChamsSettings:AddSlider({
	Name = "Thickness",
	Value = WallHack.Visuals.ChamsSettings.Thickness,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.Thickness = New
	end,
	Min = 0,
	Max = 3
}).Default = WallHack.Visuals.ChamsSettings.Thickness

ChamsSettings:AddColorpicker({
	Name = "Color",
	Value = WallHack.Visuals.ChamsSettings.Color,
	Callback = function(New, Old)
		WallHack.Visuals.ChamsSettings.Color = New
	end
}).Default = WallHack.Visuals.ChamsSettings.Color

TracersSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.TracersSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.TracersSettings.Enabled = New
	end
}).Default = WallHack.Visuals.TracersSettings.Enabled

TracersSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Visuals.TracersSettings.Transparency,
	Callback = function(New, Old)
		WallHack.Visuals.TracersSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.TracersSettings.Transparency

TracersSettings:AddSlider({
	Name = "Thickness",
	Value = WallHack.Visuals.TracersSettings.Thickness,
	Callback = function(New, Old)
		WallHack.Visuals.TracersSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = WallHack.Visuals.TracersSettings.Thickness

TracersSettings:AddColorpicker({
	Name = "Color",
	Value = WallHack.Visuals.TracersSettings.Color,
	Callback = function(New, Old)
		WallHack.Visuals.TracersSettings.Color = New
	end
}).Default = WallHack.Visuals.TracersSettings.Color

TracersSettings:AddDropdown({
	Name = "Start From",
	Value = TracersType[WallHack.Visuals.TracersSettings.Type],
	Callback = function(New, Old)
		WallHack.Visuals.TracersSettings.Type = tablefind(TracersType, New)
	end,
	List = TracersType,
	Nothing = "Bottom"
}).Default = Fonts[WallHack.Visuals.TracersSettings.Type + 1]

HeadDotsSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.HeadDotSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Enabled = New
	end
}).Default = WallHack.Visuals.HeadDotSettings.Enabled

HeadDotsSettings:AddToggle({
	Name = "Filled",
	Value = WallHack.Visuals.HeadDotSettings.Filled,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Filled = New
	end
}).Default = WallHack.Visuals.HeadDotSettings.Filled

HeadDotsSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Visuals.HeadDotSettings.Transparency,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.HeadDotSettings.Transparency

HeadDotsSettings:AddSlider({
	Name = "Thickness",
	Value = WallHack.Visuals.HeadDotSettings.Thickness,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = WallHack.Visuals.HeadDotSettings.Thickness

HeadDotsSettings:AddSlider({
	Name = "Sides",
	Value = WallHack.Visuals.HeadDotSettings.Sides,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = WallHack.Visuals.HeadDotSettings.Sides

HeadDotsSettings:AddColorpicker({
	Name = "Color",
	Value = WallHack.Visuals.HeadDotSettings.Color,
	Callback = function(New, Old)
		WallHack.Visuals.HeadDotSettings.Color = New
	end
}).Default = WallHack.Visuals.HeadDotSettings.Color

HealthBarSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Visuals.HealthBarSettings.Enabled,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Enabled = New
	end
}).Default = WallHack.Visuals.HealthBarSettings.Enabled

HealthBarSettings:AddDropdown({
	Name = "Position",
	Value = WallHack.Visuals.HealthBarSettings.Type == 1 and "Top" or WallHack.Visuals.HealthBarSettings.Type == 2 and "Bottom" or WallHack.Visuals.HealthBarSettings.Type == 3 and "Left" or "Right",
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Type = New == "Top" and 1 or New == "Bottom" and 2 or New == "Left" and 3 or 4
	end,
	List = {"Top", "Bottom", "Left", "Right"},
	Nothing = "Left"
}).Default = WallHack.Visuals.HealthBarSettings.Type == 1 and "Top" or WallHack.Visuals.HealthBarSettings.Type == 2 and "Bottom" or WallHack.Visuals.HealthBarSettings.Type == 3 and "Left" or "Right"

HealthBarSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Visuals.HealthBarSettings.Transparency,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Visuals.HealthBarSettings.Transparency

HealthBarSettings:AddSlider({
	Name = "Size",
	Value = WallHack.Visuals.HealthBarSettings.Size,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Size = New
	end,
	Min = 2,
	Max = 10
}).Default = WallHack.Visuals.HealthBarSettings.Size

HealthBarSettings:AddSlider({
	Name = "Blue",
	Value = WallHack.Visuals.HealthBarSettings.Blue,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Blue = New
	end,
	Min = 0,
	Max = 255
}).Default = WallHack.Visuals.HealthBarSettings.Blue

HealthBarSettings:AddSlider({
	Name = "Offset",
	Value = WallHack.Visuals.HealthBarSettings.Offset,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.Offset = New
	end,
	Min = -30,
	Max = 30
}).Default = WallHack.Visuals.HealthBarSettings.Offset

HealthBarSettings:AddColorpicker({
	Name = "Outline Color",
	Value = WallHack.Visuals.HealthBarSettings.OutlineColor,
	Callback = function(New, Old)
		WallHack.Visuals.HealthBarSettings.OutlineColor = New
	end
}).Default = WallHack.Visuals.HealthBarSettings.OutlineColor


--// Functions / Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Aimbot.Functions:ResetSettings()
		WallHack.Functions:ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart BladeLua",
	Callback = function()
		Aimbot.Functions:Restart()
		WallHack.Functions:Restart()
	end
})

FunctionsSection:AddButton({
	Name = "Exit BladeLua",
	Callback = Library.Unload,
})


do
    local Aux = Instance.new("BindableFunction")
Aux.OnInvoke = function(Answer)
    if Answer == "Ok" then
        return
    end
    Library.load()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end



	game.StarterGui:SetCore("SendNotification", {
		Title = "🎆 BladeLua  🎆",
		Text = "Make Sure To Leave A Star On Github Page :)",
		Button1 = "Ok",
		Duration = 1 / 0,
		Icon = "rbxassetid://4996891970",
		Callback = Aux
	})
end

do
    local Aux = Instance.new("BindableFunction")
    Aux.OnInvoke = function(Answer)
        if Answer == "No" then
            return
        end

        -- Create a new thread to run the new script without blocking the UI
        coroutine.wrap(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)()
    end

    game.StarterGui:SetCore("SendNotification", {
        Title = "infiniteyield",
        Text = "Would You Like To Inject infiniteyield Script",
        Button1 = "Yes",
        Button2 = "No",
        Duration = 1 / 0,
        Icon = "rbxassetid://6238537240",
        Callback = Aux
    })
end

do
    local Aux = Instance.new("BindableFunction")
    Aux.OnInvoke = function(Answer)
        if Answer == "No" then
            return
        end

        -- Create a new thread to run the new script without blocking the UI
        coroutine.wrap(function()
loadstring( game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()        
        end)()
    end

    game.StarterGui:SetCore("SendNotification", {
        Title = "Orca Script",
        Text = "Would You Like To Inject Orca Script",
        Button1 = "Yes",
        Button2 = "No",
        Duration = 1 / 0,
        Icon = "rbxassetid://6238537240",
        Callback = Aux
    })
end