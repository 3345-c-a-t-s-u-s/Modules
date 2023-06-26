local Noification = {}

local TweenService = game:GetService('TweenService')

function  Noification.Create()
	local notification = Instance.new("ScreenGui")
	local showd = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	notification.Name = "notification"
	notification.Parent =  game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	notification.ResetOnSpawn = false

	showd.Name = "showd"
	showd.Parent = notification
	showd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	showd.BackgroundTransparency = 1.000
	showd.Position = UDim2.new(0.832304537, 0, 0.643682063, 0)
	showd.Size = UDim2.new(0.149176955, 0, 0.340353251, 0)

	UIListLayout.Parent = showd
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0,12)
	
	local Functions = {}

	function Functions:NewNoification(CreatorName,NoificationText,Time)

		local main = Instance.new("Frame")
		local controller = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Time_Tap = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local load = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local title_main = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local creator = Instance.new("TextLabel")
		local UIGradient = Instance.new("UIGradient")
		local txnotification = Instance.new("TextLabel")
		local UIGradient_2 = Instance.new("UIGradient")

		main.Name = "main"
		main.Parent = showd
		main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		main.BackgroundTransparency = 1.000
		main.Size = UDim2.new(1.10000002, 0, 0.400000006, 0)

		controller.Name = "controller"
		controller.Parent = main
		controller.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		controller.BorderSizePixel = 0
		controller.ClipsDescendants = true
		controller.Position = UDim2.new(1.5,0,0,0)
		controller.Size = UDim2.new(1, 0, 1, 0)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = controller

		Time_Tap.Name = "Time_Tap"
		Time_Tap.Parent = controller
		Time_Tap.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		Time_Tap.BackgroundTransparency = 1.000
		Time_Tap.BorderSizePixel = 0
		Time_Tap.Size = UDim2.new(1, 0, 1, 0)

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = Time_Tap

		load.Name = "load"
		load.Parent = Time_Tap
		load.AnchorPoint = Vector2.new(1, 0)
		load.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		load.BackgroundTransparency = 0.650
		load.Position = UDim2.new(1, 0, 0.499000013, 0)
		load.Size = UDim2.new(1, 0, 0.5, 0)

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = load

		title_main.Name = "title_main"
		title_main.Parent = controller
		title_main.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		title_main.Size = UDim2.new(1, 0, 0.899999976, 0)

		UICorner_4.CornerRadius = UDim.new(0, 4)
		UICorner_4.Parent = title_main

		creator.Name = "creator"
		creator.Parent = title_main
		creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		creator.BackgroundTransparency = 1.000
		creator.BorderColor3 = Color3.fromRGB(27, 42, 53)
		creator.Position = UDim2.new(0.0438859984, 0, 0.0831670016, 0)
		creator.Size = UDim2.new(0.63291496, 0, 0.197028339, 0)
		creator.Font = Enum.Font.ArialBold
		creator.Text = CreatorName or "Creator"
		creator.TextColor3 = Color3.fromRGB(255, 255, 255)
		creator.TextScaled = true
		creator.TextSize = 14.000
		creator.TextWrapped = true
		creator.TextXAlignment = Enum.TextXAlignment.Left

		UIGradient.Rotation = 90
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.43, 0.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.53, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = creator

		txnotification.Name = "txnotification"
		txnotification.Parent = title_main
		txnotification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		txnotification.BackgroundTransparency = 1.000
		txnotification.BorderColor3 = Color3.fromRGB(27, 42, 53)
		txnotification.Position = UDim2.new(0.0626947731, 0, 0.415834576, 0)
		txnotification.Size = UDim2.new(0.877428949, 0, 0.377223492, 0)
		txnotification.Font = Enum.Font.ArialBold
		txnotification.Text = NoificationText or "notification"
		txnotification.TextColor3 = Color3.fromRGB(255, 255, 255)
		txnotification.TextScaled = true
		txnotification.TextSize = 14.000
		txnotification.TextWrapped = true

		UIGradient_2.Rotation = 90
		UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.43, 0.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.53, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient_2.Parent = txnotification

		TweenService:Create(controller,TweenInfo.new(0.75),{Position = UDim2.new(0,0,0,0)}):Play()

		local tween = TweenService:Create(load,TweenInfo.new(Time or 1),{Size = UDim2.new(0, 0, 0.5, 0)})
		
		tween:Play()
		
		tween.Completed:Connect(function()
			TweenService:Create(controller,TweenInfo.new(0.75),{Position = UDim2.new(1.5,0,0,0)}):Play()
			game:GetService('Debris'):AddItem(main,1)
		end)


	end

	return Functions
end

return Noification
