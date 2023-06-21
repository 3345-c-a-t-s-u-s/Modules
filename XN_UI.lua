--[[
	-- how to use --
	- require 
	local XN = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Modules/main/XN_UI.lua"))();
	- Create Window 
	local window = XN.new(<title> , <toggle key> none);
	- Create Section
	local Section = window:Newdex(<title>)
	- Assets -
	* Button
	Section:NewButton(<title>,function() 
		
	end)
	* Toggle
	Section:NewToggle(<Title>,info <false> or <true>,function(boolen)
	
	end)
	* Label
	Section:NewLabel(<string>)
	* Keybinds
	Section:NewKeybinds(<title>,<info - KeyCode>,function(key)
	
	end)
]]

-- Bypass CoreGui --
pcall(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Qit2p2UN"))()
end)
--------------------
local Tween = game:GetService('TweenService')
local Usi = game:GetService('UserInputService')
local localplayer = game:GetService('Players').LocalPlayer
local Mouse = localplayer:GetMouse()
local run = game:GetService('RunService')

local XN = {}

local function RandomName()
	local Name = "{"
	for i=0,math.random(10,15) do task.wait()
		Name = Name..tostring(math.random(1,9))
		if math.random(1,5) == 2  then
			Name = Name..tostring("x")
		end
	end
	return tostring(Name)
end

local function CalculateDistance(pointA, pointB)
	return math.sqrt(((pointB.X - pointA.X) ^ 2) + ((pointB.Y - pointA.Y) ^ 2))
end

function Create_Ripple(Parent : Frame)
	Parent.ClipsDescendants = true

	local ripple = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new('UIStroke',ripple)

	ripple.Name = "ripple"
	ripple.Parent = Parent
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.ZIndex = -9999999
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Size = UDim2.new(0,0,0,0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(255,255,255)
	UIStroke.LineJoinMode = Enum.LineJoinMode.Round
	UIStroke.Thickness = 14
	UIStroke.Transparency = 0.3

	UICorner.CornerRadius = UDim.new(0.5, 0)
	UICorner.Parent = ripple

	local buttonAbsoluteSize = Parent.AbsoluteSize
	local buttonAbsolutePosition = Parent.AbsolutePosition

	local mouseAbsolutePosition = Vector2.new(Mouse.X, Mouse.Y)
	local mouseRelativePosition = (mouseAbsolutePosition - buttonAbsolutePosition)

	ripple.BackgroundTransparency = 0.84
	ripple.Position = UDim2.new(0, mouseRelativePosition.X, 0, mouseRelativePosition.Y)
	ripple.Parent = Parent

	local topLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, 0))
	local topRight = CalculateDistance(mouseRelativePosition, Vector2.new(buttonAbsoluteSize.X, 0))
	local bottomRight = CalculateDistance(mouseRelativePosition, buttonAbsoluteSize)
	local bottomLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, buttonAbsoluteSize.Y))

	local Size_UP = UDim2.new(50,0,50,0)
	Tween:Create(ripple,TweenInfo.new(2),{Size = Size_UP,BackgroundTransparency = 1}):Play()
	game:GetService('Debris'):AddItem(ripple,2.2)
end

function XN.new(Title_Main : string,ToggleKey : Enum.KeyCode)
	if not Title_Main then return warn("error title") end
	local ToggleKey = ToggleKey or Enum.KeyCode.RightControl
	local ASSET_XN = {}
	
	ASSET_XN.Title = Title_Main;
	ASSET_XN.toggle_key = ToggleKey;
	ASSET_XN.dexs = {}
	ASSET_XN.Toggle_boolen = true
	
	local dragToggle = nil
	local dragSpeed = 0.05
	local dragStart = nil
	local startPos = nil
	
	local XN = Instance.new("ScreenGui")
	local TOGGLE_FRAME = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local ToggleButton = Instance.new("TextButton")
	local MAIN_FRAME = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Title_MAIN = Instance.new("TextLabel")
	local UICorner_3 = Instance.new("UICorner")
	local dex_button = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local dex_button_list = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local CloseButton = Instance.new("TextButton")
	
	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		dex_button_list.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
	end)
	
	XN.Name = RandomName() or "{/}"
	XN.Parent = game:FindFirstChild('CoreGui') or game:GetService('Players').LocalPlayer.PlayerGui
	XN.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	XN.ResetOnSpawn = false
	XN.IgnoreGuiInset = true
	
	TOGGLE_FRAME.Name = "TOGGLE_FRAME"
	TOGGLE_FRAME.Parent = XN
	TOGGLE_FRAME.AnchorPoint = Vector2.new(0.5, 0)
	TOGGLE_FRAME.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
	TOGGLE_FRAME.Position = UDim2.new(0.5, 0, -0.2, 0)
	TOGGLE_FRAME.Size = UDim2.new(0.241991013, 0, 0.0601222739, 0)
	TOGGLE_FRAME.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = TOGGLE_FRAME

	Title.Name = "Title"
	Title.Parent = TOGGLE_FRAME
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.5, 0, 0.100000001, 0)
	Title.Size = UDim2.new(0.949999988, 0, 0.449999988, 0)
	Title.Font = Enum.Font.GothamBold
	Title.Text = Title_Main or "XN UI Decode"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextStrokeTransparency = 0.890
	Title.TextWrapped = true

	ToggleButton.Name = "ToggleButton"
	ToggleButton.Parent = TOGGLE_FRAME
	ToggleButton.AnchorPoint = Vector2.new(0.5, 0)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.BackgroundTransparency = 1.000
	ToggleButton.Position = UDim2.new(0.5, 0, 0.550000012, 0)
	ToggleButton.Size = UDim2.new(0.400000006, 0, 0.449999988, 0)
	ToggleButton.Font = Enum.Font.ArialBold
	ToggleButton.Text = "—"
	ToggleButton.TextColor3 = Color3.fromRGB(161, 161, 161)
	ToggleButton.TextScaled = true
	ToggleButton.TextSize = 14.000
	ToggleButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.TextStrokeTransparency = 0.480
	ToggleButton.TextWrapped = true

	MAIN_FRAME.Name = "MAIN_FRAME"
	MAIN_FRAME.Parent = XN
	MAIN_FRAME.AnchorPoint = Vector2.new(0.5, 0.5)
	MAIN_FRAME.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	MAIN_FRAME.BorderSizePixel = 0
	MAIN_FRAME.Position = UDim2.new(0.5, 0, 0.302989125, 0)
	MAIN_FRAME.Size = UDim2.new(0.35, 0, 0.35, 0)

	UICorner_2.CornerRadius = UDim.new(0, 6)
	UICorner_2.Parent = MAIN_FRAME

	Title_MAIN.Name = "Title_MAIN"
	Title_MAIN.Parent = MAIN_FRAME
	Title_MAIN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_MAIN.BackgroundTransparency = 1.000
	Title_MAIN.Position = UDim2.new(0.0159986839, 0, 0.0231595859, 0)
	Title_MAIN.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
	Title_MAIN.Font = Enum.Font.ArialBold
	Title_MAIN.Text = Title_Main or "XN UI Decode"
	Title_MAIN.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_MAIN.TextScaled = true
	Title_MAIN.TextSize = 14.000
	Title_MAIN.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Title_MAIN.TextStrokeTransparency = 0.800
	Title_MAIN.TextWrapped = true
	Title_MAIN.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = Title_MAIN

	dex_button.Name = "dex_button"
	dex_button.Parent = MAIN_FRAME
	dex_button.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	dex_button.BackgroundTransparency = 0.200
	dex_button.Position = UDim2.new(0.788506508, 0, 0.150537252, 0)
	dex_button.Size = UDim2.new(0.17313683, 0, 0.795781851, 0)

	UICorner_4.CornerRadius = UDim.new(0, 3)
	UICorner_4.Parent = dex_button

	dex_button_list.Name = "dex_button_list"
	dex_button_list.Parent = dex_button
	dex_button_list.Active = true
	dex_button_list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dex_button_list.BackgroundTransparency = 1.000
	dex_button_list.BorderColor3 = Color3.fromRGB(27, 42, 53)
	dex_button_list.BorderSizePixel = 0
	dex_button_list.Size = UDim2.new(1, 0, 1, 0)
	dex_button_list.CanvasSize = UDim2.new(0, 0, 0, 11)
	dex_button_list.ScrollBarThickness = 2

	UIListLayout.Parent = dex_button_list
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = MAIN_FRAME
	CloseButton.AnchorPoint = Vector2.new(0.5, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.Position = UDim2.new(0.954819739, 0, 0.0211894512, 0)
	CloseButton.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
	CloseButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CloseButton.ZIndex = 55555
	CloseButton.Font = Enum.Font.ArialBold
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(161, 161, 161)
	CloseButton.TextScaled = true
	CloseButton.TextSize = 14.000
	CloseButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextStrokeTransparency = 0.760
	CloseButton.TextTransparency = 0.260
	CloseButton.TextWrapped = true
	
	function ASSET_XN:Newdex(Titleing : string)
		local dex_button = Instance.new("TextButton")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local assts = {}
		
		dex_button.Name = "dex_button"
		dex_button.Parent = dex_button_list
		dex_button.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
		dex_button.BackgroundTransparency = 0.350
		dex_button.Size = UDim2.new(1, 0, 1, 0)
		dex_button.Font = Enum.Font.GothamBold
		dex_button.Text = Titleing or "index.json"
		dex_button.TextColor3 = Color3.fromRGB(255, 255, 255)
		dex_button.TextScaled = true
		dex_button.TextSize = 14.000
		dex_button.TextWrapped = true

		UIAspectRatioConstraint.Parent = dex_button
		UIAspectRatioConstraint.AspectRatio = 2.500

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = dex_button

		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
		UIGradient.Parent = dex_button	
		--
		local dex_frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		
		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			ScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
		end)
		
		dex_frame.Name = "dex_frame"
		dex_frame.Parent = MAIN_FRAME
		dex_frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		dex_frame.Position = UDim2.new(0.0411394723, 0, 0.165976971, 0)
		dex_frame.Size = UDim2.new(0.719410539, 0, 0.777915061, 0)

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = dex_frame

		ScrollingFrame.Parent = dex_frame
		ScrollingFrame.Active = true
		ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ScrollingFrame.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
		ScrollingFrame.ScrollBarThickness = 2

		UIListLayout.Parent = ScrollingFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		if #ASSET_XN.dexs == 0 then
			dex_frame.Visible = true
		else
			dex_frame.Visible = false
		end
		
		table.insert(ASSET_XN.dexs,dex_frame)
		
		dex_button.MouseButton1Click:Connect(function()
			Create_Ripple(dex_button)
			for indx, id in ipairs(ASSET_XN.dexs) do
				if id == dex_frame then
					id.Visible = true
				else
					id.Visible = false
				end
			end
		end)
		
		function assts:NewButton(title : string,callback : FunctionalTest)
			local callback = callback or function() end
			local Button = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local ImageLabel = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local UICorner = Instance.new("UICorner")
			local UIGradient_2 = Instance.new("UIGradient")
			local Button_2 = Instance.new("TextButton")
			local UIGradient_3 = Instance.new("UIGradient")

			Button.Name = "Button"
			Button.Parent = ScrollingFrame
			Button.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
			Button.ClipsDescendants = true
			Button.Size = UDim2.new(0.980000019, 0, 1, 0)

			UIAspectRatioConstraint.Parent = Button
			UIAspectRatioConstraint.AspectRatio = 5.000

			ImageLabel.Parent = Button
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.Position = UDim2.new(0.875363827, 0, 0.5, 0)
			ImageLabel.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
			ImageLabel.Image = "rbxassetid://3944703587"

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient.Parent = ImageLabel

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Button

			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient_2.Parent = Button

			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.BackgroundTransparency = 1.000
			Button_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Button_2.Position = UDim2.new(0.0272991881, 0, 0.214981109, 0)
			Button_2.Size = UDim2.new(0.752226412, 0, 0.550000012, 0)
			Button_2.Font = Enum.Font.SourceSansBold
			Button_2.TextColor3 = Color3.fromRGB(239, 239, 239)
			Button_2.TextScaled = true
			Button_2.TextSize = 14.000
			Button_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.TextStrokeTransparency = 0.870
			Button_2.TextWrapped = true
			Button_2.TextXAlignment = Enum.TextXAlignment.Left
			Button_2.Text = title or "buton"
			
			UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient_3.Parent = Button_2
			Button_2.MouseButton1Click:Connect(function()
				Create_Ripple(Button)
				callback(true)
				return
			end)
			return Button
		end
		
		function assts:NewToggle(itle,start,callback)
			local callback = callback or function() end
			local start = start or false
			local Toggle = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local Title = Instance.new("TextLabel")
			local UIGradient_2 = Instance.new("UIGradient")
			local ToggleMain = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIGradient_3 = Instance.new("UIGradient")
			local Button = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")
			local Effect = Instance.new("UIGradient")
			local Shaodw = Instance.new("ImageLabel")
			local UICorner_4 = Instance.new("UICorner")

			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
			Toggle.ClipsDescendants = true
			Toggle.Size = UDim2.new(0.980000019, 0, 1, 0)

			UIAspectRatioConstraint.Parent = Toggle
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Toggle

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient.Parent = Toggle

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0204742867, 0, 0.5, 0)
			Title.Size = UDim2.new(0.720474422, 0, 0.5, 0)
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = itle or "Toggle"
			Title.TextColor3 = Color3.fromRGB(239, 239, 239)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextStrokeTransparency = 0.740
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient_2.Parent = Title

			ToggleMain.Name = "ToggleMain"
			ToggleMain.Parent = Toggle
			ToggleMain.Active = true
			ToggleMain.AnchorPoint = Vector2.new(0, 0.5)
			ToggleMain.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
			ToggleMain.Position = UDim2.new(0.713, 0, 0.5, 0)
			ToggleMain.Size = UDim2.new(0.25, 0, 0.449999988, 0)

			UICorner_2.CornerRadius = UDim.new(0, 7)
			UICorner_2.Parent = ToggleMain

			UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.10), NumberSequenceKeypoint.new(0.37, 0.65), NumberSequenceKeypoint.new(0.50, 0.70), NumberSequenceKeypoint.new(0.68, 0.71), NumberSequenceKeypoint.new(1.00, 0.10)}
			UIGradient_3.Parent = ToggleMain

			Button.Name = "Button"
			Button.Parent = ToggleMain
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(198, 0, 3)
			Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Button.Position = UDim2.new(0.2042588, 0, 0.5, 0)
			Button.Size = UDim2.new(0.850000024, 0, 0.850000024, 0)
			Button.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Button.Font = Enum.Font.SourceSans
			Button.TextColor3 = Color3.fromRGB(255, 0, 4)
			Button.TextScaled = true
			Button.TextSize = 14.000
			Button.TextTransparency = 1.000
			Button.TextWrapped = true

			UICorner_3.CornerRadius = UDim.new(0.5, 0)
			UICorner_3.Parent = Button

			Effect.Offset = Vector2.new(-2, 0)
			Effect.Rotation = 45
			Effect.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.17, 1.00), NumberSequenceKeypoint.new(0.50, 1.00), NumberSequenceKeypoint.new(0.75, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
			Effect.Name = "Effect"
			Effect.Parent = Button

			Shaodw.Name = "Shaodw"
			Shaodw.Parent = Button
			Shaodw.AnchorPoint = Vector2.new(0.5, 0.5)
			Shaodw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Shaodw.BackgroundTransparency = 1.000
			Shaodw.Position = UDim2.new(0.5, 0, 0.5, 0)
			Shaodw.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			Shaodw.ZIndex = -5555
			Shaodw.Image = "rbxassetid://6756560488"
			Shaodw.ImageTransparency = 0.590

			UICorner_4.CornerRadius = UDim.new(0.5, 0)
			UICorner_4.Parent = Shaodw
			local function EffectToggle()
				coroutine.wrap(function()
					Effect.Offset = Vector2.new(-2,0)
					Tween:Create(Effect,TweenInfo.new(0.55),{Offset = Vector2.new(2,0)}):Play()
				end)()
			end
			
			local function TOGGLE_AUTO()
				EffectToggle()
				if start then
					Tween:Create(Button,TweenInfo.new(0.3),{Position = UDim2.new(0.204, 0,0.5, 0),BackgroundColor3 = Color3.fromRGB(198, 0, 3)}):Play()
					start = false
				else
					start = true
					Tween:Create(Button,TweenInfo.new(0.3),{Position = UDim2.new(0.845, 0,0.5, 0),BackgroundColor3 = Color3.fromRGB(53, 198, 0)}):Play()
				end
			end
			start = not start
			TOGGLE_AUTO()
			Button.MouseButton1Click:Connect(function()
				Create_Ripple(Toggle)
				TOGGLE_AUTO()
				callback(start)
			end)
		end
		
		function assts:NewLabel(TITITITIITITITIT)
			local Lable = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local TextLabel = Instance.new("TextLabel")
			local UIGradient_2 = Instance.new("UIGradient")

			Lable.Name = "Lable"
			Lable.Parent = ScrollingFrame
			Lable.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
			Lable.ClipsDescendants = true
			Lable.Size = UDim2.new(0.980000019, 0, 1, 0)

			UIAspectRatioConstraint.Parent = Lable
			UIAspectRatioConstraint.AspectRatio = 6.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Lable

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient.Parent = Lable

			TextLabel.Parent = Lable
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(0.949999988, 0, 0.5, 0)
			TextLabel.Font = Enum.Font.ArialBold
			TextLabel.Text = TITITITIITITITIT or "XN"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient_2.Parent = TextLabel
			return Lable
		end
		
		function assts:NewKeybinds(Title,info,callback)
			local info = info or Enum.KeyCode.H
			local Keybinds = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local Button = Instance.new("TextButton")
			local UIGradient_2 = Instance.new("UIGradient")
			local KEY = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")

			Keybinds.Name = "Keybinds"
			Keybinds.Parent = ScrollingFrame
			Keybinds.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
			Keybinds.ClipsDescendants = true
			Keybinds.Size = UDim2.new(0.980000019, 0, 1, 0)

			UIAspectRatioConstraint.Parent = Keybinds
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Keybinds

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient.Parent = Keybinds

			Button.Name = "Button"
			Button.Parent = Keybinds
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Button.Position = UDim2.new(0.0272991881, 0, 0.214981109, 0)
			Button.Size = UDim2.new(0.752226412, 0, 0.550000012, 0)
			Button.Font = Enum.Font.SourceSansBold
			Button.Text = Title or "Keybinds"
			Button.TextColor3 = Color3.fromRGB(239, 239, 239)
			Button.TextScaled = true
			Button.TextSize = 14.000
			Button.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextStrokeTransparency = 0.870
			Button.TextWrapped = true
			Button.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.82)}
			UIGradient_2.Parent = Button

			KEY.Name = "KEY"
			KEY.Parent = Keybinds
			KEY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KEY.BackgroundTransparency = 1.000
			KEY.Position = UDim2.new(0.78485167, 0, 0.0341239832, 0)
			KEY.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			KEY.SizeConstraint = Enum.SizeConstraint.RelativeYY
			KEY.Font = Enum.Font.ArialBold
			KEY.Text = info.Name or "unknow"
			KEY.TextColor3 = Color3.fromRGB(255, 255, 255)
			KEY.TextScaled = true
			KEY.TextSize = 14.000
			KEY.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			KEY.TextStrokeTransparency = 0.520
			KEY.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0.5, 0)
			UICorner_2.Parent = KEY
			Button.MouseButton1Click:Connect(function()
				Create_Ripple(Keybinds)
				local newtarget = nil
				local FUNCTION = Usi.InputBegan:Connect(function(KeyInput)
					if KeyInput.KeyCode ~= Enum.KeyCode.Unknown then
						if Usi:GetStringForKeyCode(KeyInput.KeyCode) then
							newtarget = KeyInput.KeyCode
						end
					end
				end)
				repeat task.wait() KEY.Text = "..." until newtarget
				if FUNCTION then
					FUNCTION:Disconnect()
				end
				KEY.Text = newtarget.Name
				callback(newtarget)
				return
			end)
		end
		return assts
	end
	
	function ASSET_XN:ToggleUI()
		if ASSET_XN.Toggle_boolen then
			ASSET_XN.Toggle_boolen = false
			Tween:Create(MAIN_FRAME,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)}):Play()
			Tween:Create(TOGGLE_FRAME,TweenInfo.new(1,Enum.EasingStyle.Back),{Position = UDim2.new(0.5,0,0.012,0)}):Play()
		else
			MAIN_FRAME.Visible = true
			ASSET_XN.Toggle_boolen = true
			Tween:Create(TOGGLE_FRAME,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position = UDim2.new(0.5,0,-0.12,0)}):Play()
			Tween:Create(MAIN_FRAME,TweenInfo.new(0.5,Enum.EasingStyle.Back),{Size = UDim2.new(0.35,0,0.35,0)}):Play()
		end
	end
	
	function ASSET_XN:ChangeKey(new)
		new = new or ToggleKey
		ASSET_XN.toggle_key = new
		return ASSET_XN
	end
	
	Usi.InputBegan:Connect(function(KEY)
		if KEY.KeyCode == ASSET_XN.toggle_key then
			ASSET_XN:ToggleUI()
		end
	end)
	
	ToggleButton.MouseButton1Click:Connect(function()
		Create_Ripple(TOGGLE_FRAME)
		ASSET_XN:ToggleUI()
	end)
	
	CloseButton.MouseButton1Click:Connect(function()
		ASSET_XN:ToggleUI()
	end)

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(MAIN_FRAME, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	MAIN_FRAME.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = MAIN_FRAME.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Usi.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
	return ASSET_XN;
end

return XN
