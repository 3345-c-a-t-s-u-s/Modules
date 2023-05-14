--[[

Power By Bedolhub
-------------------------------- 
local UI = require(script.Parent)

local new = UI.new('Tester',Enum.KeyCode.RightControl)

local SEC = new:CreateSection('Main')
local cop = new:CreateSection('Copy')

local Button = new:CreateButton(SEC,'CSGO',function()
	print('click')
end)
local Toggle = new:CreateToggle(cop,'Df',function(value)
	print(value)
end)

local Titlee = new:CreateTitle(SEC,'CSO')

local Copy__ = new:CreateCopy(SEC,'discord','https://csgo.com')

local kkBind = new:CreateKeybinds(SEC,'Setg',Enum.KeyCode.RightControl,function(newKey)
	new:ChangedKeybind(newKey)
	new:CreateNotification('now your Changed key toggle',10)
end)

]]

local PathfindingService = game:GetService('PathfindingService')
local UserinputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local UI = {}
UI.__index = UI

function Create_Dta_UI(self)
	local Data = Instance.new("ScreenGui")
	local Movement = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title_HUB = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local Buttons = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Blackground = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Power = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")
	local Notification = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")

	Data.Name = tostring(math.random(1,9))..tostring(math.random(1,9))..tostring(math.random(1,9))
	Data.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Data.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Data.ResetOnSpawn = false

	Movement.Name = "Movement"
	Movement.Parent = Data
	Movement.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Movement.BorderSizePixel = 0
	Movement.Position = UDim2.new(0.5,0,0.5,0)
	Movement.Size = UDim2.new(0.550000012, 0, 0.650000012, 0)
	Movement.AnchorPoint = Vector2.new(0.5,0.5)
	Movement.ClipsDescendants = true
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Movement

	Title_HUB.Name = "Title_HUB"
	Title_HUB.Parent = Movement
	Title_HUB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_HUB.BackgroundTransparency = 1.000
	Title_HUB.Position = UDim2.new(0.249243036, 0, 0.018527668, 0)
	Title_HUB.Size = UDim2.new(0.5, 0, 0.0500000007, 0)
	Title_HUB.Font = Enum.Font.ArialBold
	Title_HUB.Text = self.DataItile
	Title_HUB.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_HUB.TextScaled = true
	Title_HUB.TextSize = 14.000
	Title_HUB.TextWrapped = true

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Title_HUB

	Buttons.Name = "Buttons"
	Buttons.Parent = Movement
	Buttons.Active = true
	Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Buttons.BackgroundTransparency = 1.000
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.0498486049, 0, 0.108078063, 0)
	Buttons.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
	Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
	Buttons.ScrollBarThickness = 1

	UIListLayout.Parent = Buttons
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 12)

	Blackground.Name = "Blackground"
	Blackground.Parent = Movement
	Blackground.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	Blackground.BorderSizePixel = 0
	Blackground.Position = UDim2.new(0.0166162029, 0, 0.243947625, 0)
	Blackground.Size = UDim2.new(0.966162026, 0, 0.728977263, 0)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Blackground

	Power.Name = "Power"
	Power.Parent = Movement
	Power.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Power.BackgroundTransparency = 1.000
	Power.Position = UDim2.new(0, 0, 0.981966436, 0)
	Power.Size = UDim2.new(0.15475224, 0, 0.0160325784, 0)
	Power.Font = Enum.Font.ArialBold
	Power.Text = "Power By Bedol Hub"
	Power.TextColor3 = Color3.fromRGB(255, 255, 255)
	Power.TextScaled = true
	Power.TextSize = 14.000
	Power.TextWrapped = true
	Power.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Power

	Notification.Name = "Notification"
	Notification.Parent = Data
	Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notification.BackgroundTransparency = 1.000
	Notification.Position = UDim2.new(0.773761153, 0, 0.489130437, 0)
	Notification.Size = UDim2.new(0.218521535, 0, 0.5, 0)
	Notification.ZIndex = 5555555

	UIListLayout_2.Parent = Notification
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Bottom
	return Data
end

function Create__Notification(self,Titlesss,_time)
	
	local Notification = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Times = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local ContDown = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")

	Notification.Name = "Notification"
	Notification.Parent = self.DataUI.Notification
	Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notification.BackgroundTransparency = 1.000
	Notification.BorderSizePixel = 0
	Notification.Size = UDim2.new(1, 0, 0.5, 0)

	Frame.Parent = Notification
	Frame.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
	Frame.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Frame

	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.81, 0.30), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Frame

	Times.Name = "Times"
	Times.Parent = Frame
	Times.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Times.BackgroundTransparency = 0.700
	Times.Position = UDim2.new(0.0232341997, 0, 0.713315248, 0)
	Times.Size = UDim2.new(0.949999988, 0, 0.0500000007, 0)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Times

	ContDown.Name = "ContDown"
	ContDown.Parent = Times
	ContDown.AnchorPoint = Vector2.new(0.5, 0.5)
	ContDown.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
	ContDown.Position = UDim2.new(0.5, 0, 0.5, 0)
	ContDown.Size = UDim2.new(1, 0, 0.5, 0)
	ContDown.BorderSizePixel = 0
	
	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = ContDown

	Title.Name = "Title"
	Title.Parent = Frame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0464683995, 0, 0.129076093, 0)
	Title.Size = UDim2.new(0.899999976, 0, 0.5, 0)
	Title.Font = Enum.Font.ArialBold
	Title.Text = Titlesss or "Notification"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true

	UIGradient_2.Rotation = 90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.81, 0.30), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Title
	coroutine.wrap(function()
		Frame.Position = UDim2.new(1.1,0,0,0)
		TweenService:Create(Frame,TweenInfo.new(0.5),{Position = UDim2.new(0,0,0,0)}):Play()
		local waiting = _time
		local max = _time
		repeat task.wait(0.1)
			local x = (waiting / max)
			TweenService:Create(ContDown,TweenInfo.new(0.1),{Size = UDim2.new(x,0,1,0)}):Play()
			waiting -= 0.1
		until waiting <= -0.1
		wait(0.25)
		TweenService:Create(Frame,TweenInfo.new(0.5),{Position =  UDim2.new(1.1,0,0,0)}):Play()
		wait(0.55)
		Notification:Destroy()
	end)()
end

function UI.new(__title__,Keybind)
	if not __title__ then
		return
	end
	local self = {
		DataItile = __title__,
		ToggleKey = Keybind or Enum.KeyCode.RightControl
	}
	setmetatable(self,UI)
	self.DataUI = Create_Dta_UI(self)
	self.ViewSection = nil
	self.SectionList = {}
	local IsToggle = true
	UserinputService.InputBegan:Connect(function(Keey)
		if Keey.KeyCode == self.ToggleKey then
			
			local movement = self.DataUI.Movement
			if  IsToggle  then
				TweenService:Create(movement,TweenInfo.new(0.65,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)}):Play()
				IsToggle = false
			else
				TweenService:Create(movement,TweenInfo.new(0.65,Enum.EasingStyle.Back),{Size = UDim2.new(0.550000012, 0, 0.550000012, 0)}):Play()
				IsToggle = true
			end
		end
	end)
	local frame = self.DataUI.Movement
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		TweenService:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UserinputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	return self
end 


function UI:ChangedKeybind(NewKey)
	self.ToggleKey = NewKey or Enum.KeyCode.RightControl
	return self
end

function UI:	CreateSection(SectionTitle)
	-- Creatte Button ----
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Button = Instance.new("TextButton")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	Frame.Parent = self.DataUI.Movement.Buttons
	Frame.BackgroundColor3 = Color3.fromRGB(129, 129, 129)
	Frame.Size = UDim2.new(2, 0, 1, 0)
	Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Frame

	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.83, 0.31), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Frame

	Button.Name = "Button"
	Button.Parent = Frame
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	Button.Font = Enum.Font.ArialBold
	Button.Text = tostring(SectionTitle) or 'unknow'
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextWrapped = true

	UIGradient_2.Rotation = 90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.76, 0.70), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Button

	UIAspectRatioConstraint.Parent = Frame
	UIAspectRatioConstraint.AspectRatio = 2.000
	
	---------------------------------------------
	-------------- Create frame 
	
	local SSS_F = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")


	SSS_F.Name = tostring(SectionTitle) or 'unknow'
	SSS_F.Parent = self.DataUI.Movement
	SSS_F.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	SSS_F.BackgroundTransparency = 0.150
	SSS_F.BorderSizePixel = 0
	SSS_F.Position = UDim2.new(0.142160848, 0, 0.268651187, 0)
	SSS_F.Size = UDim2.new(0.713226497, 0, 0.679570138, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = SSS_F

	ScrollingFrame.Parent = SSS_F
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.ScrollBarThickness = 4

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 12)
	if not self.ViewSection then
		self.ViewSection = SSS_F
		SSS_F.Visible  = true
	else
		SSS_F.Visible = false
	end
	table.insert(self.SectionList,SSS_F)
	Button.MouseButton1Click:Connect(function()
		for i,v : Frame in ipairs(self.SectionList) do
			if v ~= SSS_F then
				coroutine.wrap(function()
					TweenService:Create(v,TweenInfo.new(0.15),{Position = UDim2.new(1.1,0,0.269,0)}):Play()
					task.wait(0.15)
					v.Visible = false
				end)()
			else
				if self.ViewSection ~= SSS_F then
					SSS_F.Position = UDim2.new(-1, 0,0.269, 0)
					self.ViewSection = SSS_F
					v.Visible= true
					TweenService:Create(SSS_F,TweenInfo.new(0.15),{Position =  UDim2.new(0.142160848, 0, 0.268651187, 0)}):Play()
				end
			end
		end
	end)
	return ScrollingFrame
end

function UI:CreateButton(Parent,Title___,callback)
	if not Title___ or not callback then
		return
	end
	local Button = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Button_2 = Instance.new("TextButton")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local ImageLabel = Instance.new("ImageLabel")
	local Tap = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")

	Button.Name = "Button"
	Button.Parent = Parent
	Button.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
	Button.Size = UDim2.new(0.850000024, 0, 0.200000003, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Button

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient.Parent = Button

	Button_2.Name = "Button"
	Button_2.Parent = Button
	Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button_2.BackgroundTransparency = 1.000
	Button_2.Position = UDim2.new(0.0791801214, 0, 0.249918208, 0)
	Button_2.Size = UDim2.new(0.741639757, 0, 0.50000006, 0)
	Button_2.Font = Enum.Font.ArialBold
	Button_2.Text = Title___ or 'unknow'
	Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button_2.TextScaled = true
	Button_2.TextSize = 14.000
	Button_2.TextWrapped = true
	Button_2.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Rotation = 90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.68, 0.50), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Button_2

	UIAspectRatioConstraint.Parent = Button
	UIAspectRatioConstraint.AspectRatio = 5.000

	ImageLabel.Parent = Button
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0.803982735, 0, 0.137042522, 0)
	ImageLabel.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
	ImageLabel.Image = "rbxassetid://9728118892"

	Tap.Name = "Tap"
	Tap.Parent = Button
	Tap.AnchorPoint = Vector2.new(0.5, 0.5)
	Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tap.BorderSizePixel = 0
	Tap.Position = UDim2.new(0.49695462, 0, 0.880673647, 0)
	Tap.Size = UDim2.new(0, 0, 0.100000001, 0)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Tap
	
	Button_2.MouseButton1Click:Connect(function()
		Tap.Size =  UDim2.new(0, 0, 0.100000001, 0)
		Tap.BackgroundTransparency = 0
		TweenService:Create(Tap,TweenInfo.new(0.5),{Size =  UDim2.new(0.85, 0, 0.100000001, 0),BackgroundTransparency = 1}):Play()
		if callback then
			callback()
		end
	end)
	return Button
end


function UI:CreateToggle(Parent,title,callback)
	if not Parent or not title then
		return
	end
	local Toggle = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local TITLE = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")
	local Toggle_2 = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local Blackground = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local UIStroke = Instance.new('UIStroke')
	local UIGradient2 = Instance.new("UIGradient")
	local Bools = false

	Toggle.Name = "Toggle"
	Toggle.Parent = Parent
	Toggle.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
	Toggle.Size = UDim2.new(0.850000024, 0, 0.200000003, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Toggle

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient.Parent = Toggle

	UIAspectRatioConstraint.Parent = Toggle
	UIAspectRatioConstraint.AspectRatio = 5.000

	TITLE.Name = "TITLE"
	TITLE.Parent = Toggle
	TITLE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.BackgroundTransparency = 1.000
	TITLE.Position = UDim2.new(0.0304538943, 0, 0.228404194, 0)
	TITLE.Size = UDim2.new(0.775001407, 0, 0.5, 0)
	TITLE.Font = Enum.Font.ArialBold
	TITLE.Text = title
	TITLE.TextColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.TextScaled = true
	TITLE.TextSize = 14.000
	TITLE.TextWrapped = true
	TITLE.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.79, 0.34), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = TITLE

	Toggle_2.Name = "Toggle"
	Toggle_2.Parent = Toggle
	Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Toggle_2.BackgroundTransparency = 1.000
	Toggle_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Toggle_2.Position = UDim2.new(0.840527534, 0, 0.289311975, 0)
	Toggle_2.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
	Toggle_2.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Toggle_2.Font = Enum.Font.SourceSans
	Toggle_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Toggle_2.TextSize = 14.000
	Toggle_2.TextTransparency = 1.000

	UICorner_2.CornerRadius = UDim.new(0, 1000)
	UICorner_2.Parent = Toggle_2

	Blackground.Name = "Blackground"
	Blackground.Parent = Toggle_2
	Blackground.AnchorPoint = Vector2.new(0.5, 0.5)
	Blackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Blackground.BorderSizePixel = 0
	Blackground.Position = UDim2.new(0.5, 0, 0.5, 0)
	Blackground.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	Blackground.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Blackground.Visible = false

	UICorner_3.CornerRadius = UDim.new(0, 1000)
	UICorner_3.Parent = Blackground

	UIGradient_3.Rotation = 90
	UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient_3.Parent = Blackground
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Thickness = 4.5
	UIStroke.Parent = Toggle_2

	UIGradient2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient2.Parent = UIStroke
	UIGradient2.Rotation = 0
	
	Toggle_2.MouseButton1Click:Connect(function()
		if Bools then
			Bools = false
		else
			Bools = true
		end
		Blackground.Visible = Bools
		callback(Bools)
	end)
	return Toggle
end

function UI:CreateTitle(Parent,Title__)
	if not Parent or not Title__ then
		return
	end
	local Title = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local TITLE = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")
	local Tap = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")

	Title.Name = "Title"
	Title.Parent = Parent
	Title.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
	Title.Size = UDim2.new(0.850000024, 0, 0.200000003, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Title

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient.Parent = Title

	UIAspectRatioConstraint.Parent = Title
	UIAspectRatioConstraint.AspectRatio = 5.000

	TITLE.Name = "TITLE"
	TITLE.Parent = Title
	TITLE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.BackgroundTransparency = 1.000
	TITLE.Position = UDim2.new(0.0365446731, 0, 0.243631378, 0)
	TITLE.Size = UDim2.new(0.930316269, 0, 0.5, 0)
	TITLE.Font = Enum.Font.ArialBold
	TITLE.Text = Title__ or 'unknow'
	TITLE.TextColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.TextScaled = true
	TITLE.TextSize = 14.000
	TITLE.TextWrapped = true

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.20, 0.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.80, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = TITLE

	Tap.Name = "Tap"
	Tap.Parent = Title
	Tap.AnchorPoint = Vector2.new(0.5, 0.5)
	Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tap.BorderSizePixel = 0
	Tap.Position = UDim2.new(0.49695462, 0, 0.880673647, 0)
	Tap.Size = UDim2.new(0.899999976, 0, 0.0500000007, 0)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Tap
	
	return Title
end

function UI:CreateCopy(Parent,title,setclipbord)
	if not Parent or not title then
		return
	end
	

	local Copy = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Button = Instance.new("TextButton")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local ImageLabel = Instance.new("ImageLabel")

	Copy.Name = "Copy"
	Copy.Parent = Parent
	Copy.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
	Copy.Size = UDim2.new(0.850000024, 0, 0.200000003, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Copy

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient.Parent = Copy

	Button.Name = "Button"
	Button.Parent = Copy
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.Position = UDim2.new(0.0791801214, 0, 0.249918208, 0)
	Button.Size = UDim2.new(0.841639757, 0, 0.50000006, 0)
	Button.Font = Enum.Font.ArialBold
	Button.Text = title
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextWrapped = true
	Button.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Rotation = 90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.68, 0.50), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Button

	UIAspectRatioConstraint.Parent = Copy
	UIAspectRatioConstraint.AspectRatio = 5.000

	ImageLabel.Parent = Copy
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0.803982735, 0, 0.137042522, 0)
	ImageLabel.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
	ImageLabel.Image = "rbxassetid://10169282923"
	Button.MouseButton1Click:Connect(function()
		Create__Notification(self,'Copy '..title,4)
		pcall(function()
			setclipboard(setclipbord)
		end)
	end)
	return Copy
end

function UI:CreateKeybinds(Parent,tile,Dats,callback)
	if not Parent or not tile or not Dats or not callback then
		return
	end
	local Keybinds = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local TITLE = Instance.new("TextLabel")
	local UIGradient_2 = Instance.new("UIGradient")
	local Button = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local Blackground = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local UIGradient_4 = Instance.new("UIGradient")

	Keybinds.Name = "Keybinds"
	Keybinds.Parent = Parent
	Keybinds.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
	Keybinds.Size = UDim2.new(0.850000024, 0, 0.200000003, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Keybinds

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient.Parent = Keybinds

	UIAspectRatioConstraint.Parent = Keybinds
	UIAspectRatioConstraint.AspectRatio = 5.000

	TITLE.Name = "TITLE"
	TITLE.Parent = Keybinds
	TITLE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.BackgroundTransparency = 1.000
	TITLE.Position = UDim2.new(0.0304538943, 0, 0.228404194, 0)
	TITLE.Size = UDim2.new(0.775001407, 0, 0.5, 0)
	TITLE.Font = Enum.Font.ArialBold
	TITLE.Text = "Keybinds"
	TITLE.TextColor3 = Color3.fromRGB(255, 255, 255)
	TITLE.TextScaled = true
	TITLE.TextSize = 14.000
	TITLE.TextWrapped = true
	TITLE.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.79, 0.34), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = TITLE

	Button.Name = "Button"
	Button.Parent = Keybinds
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Button.Position = UDim2.new(0.831391394, 0, 0.197950304, 0)
	Button.Size = UDim2.new(0.550000012, 0, 0.550000012, 0)
	Button.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Button.Font = Enum.Font.ArialBold
	Button.Text = UserinputService:GetStringForKeyCode(Dats) or 'unknow'
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextWrapped = true

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Button

	Blackground.Name = "Blackground"
	Blackground.Parent = Button
	Blackground.AnchorPoint = Vector2.new(0.5, 0.5)
	Blackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Blackground.BorderSizePixel = 0
	Blackground.Position = UDim2.new(0.5, 0, 0.5, 0)
	Blackground.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	Blackground.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Blackground.Visible = false

	UICorner_3.CornerRadius = UDim.new(0, 1000)
	UICorner_3.Parent = Blackground

	UIGradient_3.Rotation = 90
	UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient_3.Parent = Blackground

	UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.35), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.34)}
	UIGradient_4.Parent = Button
	Button.MouseButton1Click:Connect(function()
		local isk = false
		local Keycode = nil
		Button.Text  = '...'
		local rbzx = UserinputService.InputBegan:Connect(function(KeycDDode)
			if KeycDDode.KeyCode ~= Enum.KeyCode.Unknown then
				Keycode = KeycDDode.KeyCode
				isk = true
			end
		end)
		repeat task.wait() until isk
		Button.Text= Keycode.Name
		callback(Keycode)
	end)
	return Keybinds
end

function UI:CreateNotification(TITLE,TIME)
	if not TITLE or not TIME then
		return	
	end
	Create__Notification(self,TITLE,TIME)
end
return UI
