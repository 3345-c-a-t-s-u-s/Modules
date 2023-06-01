--[[
	Convert it now!!!

	01000011 01010010 01000101 01000001 01010100 01000101 00100000 01000010 01011001 00100000 01000011 01000001 01010100 01011111 01010011 01010101 01010011 00100000 01001001 01000110 00100000 01011001 01001111 01010101 00100000 01010111 01000001 01001110 01001110 01000001 00100000 01010100 01001111 00100000 01010101 01010011 01000101 00100000 01010100 01001000 01001001 01010011 00100000 01000100 01001101 00100000 01001101 01000101 00100000 01000011 01000001 01010100 01011111 01010011 01010101 01010011 00100011 00111000 00110110 00110011 00110101
]]

local KW_ScreenGui = nil

local KW = {
	LocalPlayer = game:GetService('Players').LocalPlayer;
}

KW.Mouse = KW.LocalPlayer:GetMouse()
KW.KeyToggle = Enum.KeyCode.RightControl

local tween = game:GetService("TweenService")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

local function CalculateDistance(pointA, pointB)
	return math.sqrt(((pointB.X - pointA.X) ^ 2) + ((pointB.Y - pointA.Y) ^ 2))
end

function KW.Toggle()
	if KW_ScreenGui then
		if KW_ScreenGui.Enabled then
			KW_ScreenGui.Enabled = false
		else
			KW_ScreenGui.Enabled = true
		end
	end
end

function Create_Ripple(Parent : Frame)
	Parent.ClipsDescendants = true
	
	local ripple = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	ripple.Name = "ripple"
	ripple.Parent = Parent
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.ZIndex = -9999999
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Size = UDim2.new(0,0,0,0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeYY
	
	UICorner.CornerRadius = UDim.new(0.5, 0)
	UICorner.Parent = ripple
	
	local buttonAbsoluteSize = Parent.AbsoluteSize
	local buttonAbsolutePosition = Parent.AbsolutePosition

	local mouseAbsolutePosition = Vector2.new(KW.Mouse.X, KW.Mouse.Y)
	local mouseRelativePosition = (mouseAbsolutePosition - buttonAbsolutePosition)

	ripple.BackgroundTransparency = 0.84
	ripple.Position = UDim2.new(0, mouseRelativePosition.X, 0, mouseRelativePosition.Y)
	ripple.Parent = Parent

	local topLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, 0))
	local topRight = CalculateDistance(mouseRelativePosition, Vector2.new(buttonAbsoluteSize.X, 0))
	local bottomRight = CalculateDistance(mouseRelativePosition, buttonAbsoluteSize)
	local bottomLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, buttonAbsoluteSize.Y))

	local Size_UP = UDim2.new(50,0,50,0)
	tween:Create(ripple,TweenInfo.new(1.65),{Size = Size_UP,BackgroundTransparency = 1}):Play()
	game:GetService('Debris'):AddItem(ripple,1.85)
end

function KW.Window(TITLE_WINDOW)
	
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local conntroller = Instance.new("ScreenGui") KW_ScreenGui = conntroller
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Main_Title = Instance.new("TextLabel")
	local CloseButton = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local Explorer = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local ExplorerFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")

	conntroller.Name = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))
	conntroller.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	conntroller.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	conntroller.ResetOnSpawn = false

	Frame.Parent = conntroller
	Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.324612409, 0, 0.324388593, 0)
	Frame.Size = UDim2.new(0.349999994, 0, 0.349999994, 0)

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Frame

	Main_Title.Name = "Main_Title"
	Main_Title.Parent = Frame
	Main_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main_Title.BackgroundTransparency = 1.000
	Main_Title.Position = UDim2.new(0.0221483968, 0, 0.0291149095, 0)
	Main_Title.Size = UDim2.new(0.806810617, 0, 0.100000016, 0)
	Main_Title.Font = Enum.Font.GothamBold
	Main_Title.Text = TITLE_WINDOW or "BD UI"
	Main_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main_Title.TextScaled = true
	Main_Title.TextWrapped = true
	Main_Title.TextXAlignment = Enum.TextXAlignment.Left

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Frame
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.Position = UDim2.new(0.924695492, 0, 0.0291149095, 0)
	CloseButton.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
	CloseButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CloseButton.Font = Enum.Font.ArialBold
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextScaled = true
	CloseButton.TextSize = 14.000
	CloseButton.TextWrapped = true

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = CloseButton

	Explorer.Name = "Explorer"
	Explorer.Parent = Frame
	Explorer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Explorer.BackgroundTransparency = 0.750
	Explorer.BorderSizePixel = 0
	Explorer.Position = UDim2.new(0.780730963, 0, 0.140722066, 0)
	Explorer.Size = UDim2.new(0.199999988, 0, 0.824262381, 0)

	UICorner_3.CornerRadius = UDim.new(0, 3)
	UICorner_3.Parent = Explorer

	ExplorerFrame.Name = "ExplorerFrame"
	ExplorerFrame.Parent = Explorer
	ExplorerFrame.Active = true
	ExplorerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExplorerFrame.BackgroundTransparency = 1.000
	ExplorerFrame.BorderSizePixel = 0
	ExplorerFrame.Position = UDim2.new(0, 0, 0.0353223793, 0)
	ExplorerFrame.Size = UDim2.new(1, 0, 0.929355264, 0)
	ExplorerFrame.CanvasSize = UDim2.new(0, 0, 0, 1)
	ExplorerFrame.ScrollBarThickness = 1

	UIListLayout.Parent = ExplorerFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 12)
	
	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		local Gan_Y = UIListLayout.AbsoluteContentSize.Y
		ExplorerFrame.CanvasSize = UDim2.new(0,0,0,Gan_Y)
	end)
	
	local Section = {}
	local SectionList = {}
	
	function Section:NewSection(Title)
		local Section = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local Button = Instance.new("TextButton")
		
		Section.Name = "Section"
		Section.Parent = ExplorerFrame
		Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Section.BackgroundTransparency = 0.650
		Section.Size = UDim2.new(0.899999976, 0, 0.300000012, 0)

		UIAspectRatioConstraint.Parent = Section
		UIAspectRatioConstraint.AspectRatio = 2.650

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Section

		Button.Name = "Button"
		Button.Parent = Section
		Button.AnchorPoint = Vector2.new(0.5, 0.5)
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button.Size = UDim2.new(1, 0, 0.800000012, 0)
		Button.Font = Enum.Font.ArialBold
		Button.Text = Title or "Mins"
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextScaled = true
		Button.TextSize = 14.000
		Button.TextWrapped = true
		
		-----------------------------
		local SectionFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout_Of_Section = Instance.new("UIListLayout")

		SectionFrame.Name = "SectionFrame"
		SectionFrame.Parent = Frame
		SectionFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		SectionFrame.BackgroundTransparency = 0.500
		SectionFrame.BorderSizePixel = 0
		SectionFrame.Position = UDim2.new(0.022148395, 0, 0.164984554, 0)
		SectionFrame.Size = UDim2.new(0.74086374, 0, 0.781444073, 0)
		if #SectionList <= 0 then
			SectionFrame.Visible = true
		else
			SectionFrame.Visible = false
		end
		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = SectionFrame

		ScrollingFrame.Parent = SectionFrame
		ScrollingFrame.Active = true
		ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ScrollingFrame.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.ScrollBarThickness = 1

		UIListLayout_Of_Section.Parent = ScrollingFrame
		UIListLayout_Of_Section.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_Of_Section.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_Of_Section.Padding = UDim.new(0, 5)
		
		UIListLayout_Of_Section:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			local Gan_Y = UIListLayout_Of_Section.AbsoluteContentSize.Y
			ScrollingFrame.CanvasSize = UDim2.new(0,0,0,Gan_Y)
		end)
		
		table.insert(SectionList,SectionFrame)
		Button.MouseButton1Click:Connect(function()
			for i,v in ipairs(SectionList) do
				if v ~= SectionFrame then
					v.Visible = false
				else
					v.Visible = true
				end
			end
			Create_Ripple(Section)
			SectionFrame.Visible = true
			Section.Visible = true
		end)
		
		local Opstions = {}
		
		function Opstions:NewButton(__Title__,callback)
			callback = callback or function() end
			local Button = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Button_2 = Instance.new("TextButton")

			Button.Name = "Button"
			Button.Parent = ScrollingFrame
			Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Button.BackgroundTransparency = 0.450
			Button.Size = UDim2.new(0.980000019, 0, 0.5, 0)

			UIAspectRatioConstraint.Parent = Button
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Button

			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Button_2.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
			Button_2.BackgroundTransparency = 1.000
			Button_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button_2.Size = UDim2.new(0.899999976, 0, 0.600000024, 0)
			Button_2.Font = Enum.Font.ArialBold
			Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.TextScaled = true
			Button_2.TextSize = 14.000
			Button_2.TextWrapped = true
			Button_2.Text = __Title__ or "no title"
			
			Button_2.MouseButton1Click:Connect(function()
				Create_Ripple(Button)
				callback()
			end)
		end
		
		function Opstions:NewKeybind(__Title__,fist_key : Enum.KeyCode,callback)
			callback = callback or function() end
			local KeyName = input:GetStringForKeyCode(fist_key) or "Unknow"
			if #KeyName <= 0 then
				KeyName = fist_key.Name
			end
			local Keybind = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local ViewInfo = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")

			Keybind.Name = "Keybind"
			Keybind.Parent = ScrollingFrame
			Keybind.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Keybind.BackgroundTransparency = 0.450
			Keybind.Size = UDim2.new(0.980000019, 0, 0.5, 0)

			UIAspectRatioConstraint.Parent = Keybind
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Keybind

			Title.Name = "Title"
			Title.Parent = Keybind
			Title.AnchorPoint = Vector2.new(0.5, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Title.Position = UDim2.new(0.367542028, 0, 0.5, 0)
			Title.Size = UDim2.new(0.649999976, 0, 0.5, 0)
			Title.Font = Enum.Font.GothamBold
			Title.Text = __Title__ or "Keybinds"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextWrapped = true

			ViewInfo.Name = "ViewInfo"
			ViewInfo.Parent = Keybind
			ViewInfo.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
			ViewInfo.BackgroundTransparency = 0.450
			ViewInfo.Position = UDim2.new(0.738553703, 0, 0.120416366, 0)
			ViewInfo.Size = UDim2.new(0.75, 0, 0.75, 0)
			ViewInfo.SizeConstraint = Enum.SizeConstraint.RelativeYY
			ViewInfo.Font = Enum.Font.ArialBold
			ViewInfo.Text = KeyName or "unknow"
			ViewInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
			ViewInfo.TextScaled = true
			ViewInfo.TextSize = 14.000
			ViewInfo.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = ViewInfo
			
			ViewInfo.MouseButton1Click:Connect(function()
				ViewInfo.Text = "Press Key"
				local Target = nil
				local Connect = input.InputBegan:Connect(function(key)
					if key.KeyCode == Enum.KeyCode.Unknown then
						return
					end
					Target = key.KeyCode
				end)
				repeat wait() until Target
				KeyName = input:GetStringForKeyCode(Target)
				if #KeyName <= 0 then
					KeyName = fist_key.Name
				end
				ViewInfo.Text  = KeyName
				if Connect then
					Connect:Disconnect()
				end
				callback(Target)
			end)
		end
		
		function Opstions:NewToggle(__Title__,callback)
			callback = callback or function() end
			
			local Toggle = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Toggle_2 = Instance.new("TextButton")
			local Ground = Instance.new("ImageLabel")
			local Enabled = Instance.new("ImageLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Toggle.BackgroundTransparency = 0.450
			Toggle.Size = UDim2.new(0.980000019, 0, 0.5, 0)

			UIAspectRatioConstraint.Parent = Toggle
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Toggle

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.AnchorPoint = Vector2.new(0.5, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Title.Position = UDim2.new(0.367542028, 0, 0.5, 0)
			Title.Size = UDim2.new(0.649999976, 0, 0.5, 0)
			Title.Font = Enum.Font.GothamBold
			Title.Text = __Title__ or "Toggle"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextWrapped = true

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
			Toggle_2.BackgroundTransparency = 1.000
			Toggle_2.Position = UDim2.new(0.738553703, 0, 0.120416366, 0)
			Toggle_2.Size = UDim2.new(0.75, 0, 0.75, 0)
			Toggle_2.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Toggle_2.Font = Enum.Font.ArialBold
			Toggle_2.Text = "[[[]]]]"
			Toggle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle_2.TextScaled = true
			Toggle_2.TextSize = 14.000
			Toggle_2.TextTransparency = 1.000
			Toggle_2.TextWrapped = true

			Ground.Name = "Ground"
			Ground.Parent = Toggle_2
			Ground.AnchorPoint = Vector2.new(0.5, 0.5)
			Ground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Ground.BackgroundTransparency = 1.000
			Ground.Position = UDim2.new(0.5, 0, 0.5, 0)
			Ground.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
			Ground.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Ground.Image = "http://www.roblox.com/asset/?id=4560909609"
			Ground.ImageColor3 = Color3.fromRGB(148, 148, 148)

			Enabled.Name = "Enabled"
			Enabled.Parent = Toggle_2
			Enabled.AnchorPoint = Vector2.new(0.5, 0.5)
			Enabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Enabled.BackgroundTransparency = 1.000
			Enabled.Position = UDim2.new(0.5, 0, 0.5, 0)
			Enabled.Size = UDim2.new(1.10000002, 0, 1.10000002, 0)
			Enabled.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Enabled.Visible = false
			Enabled.Image = "rbxassetid://3926309567"
			Enabled.ImageRectOffset = Vector2.new(784, 420)
			Enabled.ImageRectSize = Vector2.new(48, 48)
			
			Toggle_2.MouseButton1Click:Connect(function()
				Create_Ripple(Toggle)
				if Enabled.Visible then
					Enabled.Visible = false
				else
					Enabled.Visible = true
				end
				
				callback(Enabled.Visible)
			end)
		end
		
		function Opstions:NewLabel(__Title__)
			local label = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")

			label.Name = "label"
			label.Parent = ScrollingFrame
			label.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
			label.BackgroundTransparency = 0.450
			label.Size = UDim2.new(0.980000019, 0, 0.5, 0)

			UIAspectRatioConstraint.Parent = label
			UIAspectRatioConstraint.AspectRatio = 5.000

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = label

			Title.Name = "Title"
			Title.Parent = label
			Title.AnchorPoint = Vector2.new(0.5, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Title.Position = UDim2.new(0.5, 0, 0.5, 0)
			Title.Size = UDim2.new(1, 0, 0.75, 0)
			Title.Font = Enum.Font.GothamBold
			Title.Text = __Title__ or "unknow Title"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextWrapped = true
		end
		
		return Opstions
	end
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	input.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
	CloseButton.MouseButton1Click:Connect(function()
		KW.Toggle()
	end)
	
	input.InputBegan:Connect(function(key)
		if key.KeyCode == KW.KeyToggle then
			KW.Toggle()
		end
	end)
	
	return Section
end

function KW.Change_Key_Toggle(NewKey)
	if NewKey then
		KW.KeyToggle = NewKey 
	end
end

return KW
