local TeleportStyles = {
	Part_Under_Torso = false
}
local LocalPlayer = game:GetService('Players').LocalPlayer
local TweenServce = game:GetService('TweenService')
local HumanoidRootPart : BasePart = nil

local function CheckUser()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('Humanoid') then
		if LocalPlayer.Character:FindFirstChild('Humanoid').Health > 0 then
			return true
		end
	end
	return false
end

function Update_HumanoidRootPart()
	if CheckUser() then
		HumanoidRootPart = LocalPlayer.Character:FindFirstChild('HumanoidRootPart') or LocalPlayer.Character.PrimaryPart
	end
	return HumanoidRootPart
end
function TeleportStyles:Teleport(TargetPosition)
	Update_HumanoidRootPart()
	if CheckUser() then
		if HumanoidRootPart then
			pcall(function()
					TeleportStyles.Part_Under_Torso = true
				repeat task.wait()
					HumanoidRootPart.CFrame = CFrame.new(TargetPosition)
					local Distance = (HumanoidRootPart.Position - TargetPosition).Magnitude
				until HumanoidRootPart.CFrame == CFrame.new(TargetPosition) or Distance <= 3.5
					TeleportStyles.Part_Under_Torso = false
			end)
			return true
		end
	end
	return false
end

function TeleportStyles:TeleportTween(TargetPosition,Time)
	local Style = TweenInfo.new(Time,Enum.EasingStyle.Linear)
	Update_HumanoidRootPart()
	if CheckUser() then
		if HumanoidRootPart then
			TeleportStyles.Part_Under_Torso = true
			local Tween = TweenServce:Create(HumanoidRootPart,Style,{CFrame = CFrame.new(TargetPosition)})
			Tween:Play()
			Tween.Completed:Wait()
			TeleportStyles.Part_Under_Torso = false
			return true
		end
	end
	return false
end

function TeleportStyles:TeleportTweenBypass(TargetPosition,___)
	Update_HumanoidRootPart()
	if CheckUser() then
		if HumanoidRootPart then
			local Distance = (HumanoidRootPart.Position - TargetPosition).Magnitude / (___ or 255)
			local Style = TweenInfo.new(Distance,Enum.EasingStyle.Linear)
			local Tween = TweenServce:Create(HumanoidRootPart,Style,{CFrame = CFrame.new(TargetPosition)})
			Tween:Play()
			Tween.Completed:Wait()
			return true
		end
	end
	return false
end


function TeleportStyles:TeleportBodyVelocity(TargetPosition,Distance,quen)
	Update_HumanoidRootPart()
	if CheckUser() then
		if HumanoidRootPart then
			local Target = Vector3.new(TargetPosition.X,0,TargetPosition.Z)
			local MyPosition = LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position
			local _Distance = (Vector3.new(MyPosition.X,0,MyPosition.Z) - Target)
			local IsError = false
			local run
			run = game:GetService('RunService').Stepped:Connect(function()
				local Find = pcall(function()
					MyPosition = LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position
					_Distance = (Vector3.new(MyPosition.X,0,MyPosition.Z) - Target)
					local Velocity = (TargetPosition - LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position)
					LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Velocity = (Velocity * (quen or 5))
				end)
				if not Find then
					IsError = true
					if run then
						run:Disconnect()
					end
				end
			end)
			pcall(function()
				repeat wait() until _Distance.Magnitude <= (Distance or 12) or IsError
			end)
			if run then
				run:Disconnect()
			end
			return true
		end
	end
	return false
end

coroutine.wrap(function()
	Update_HumanoidRootPart()
	local PART = Instance.new('Part')
	local image___ = Instance.new('Decal',PART)
	PART.Size = Vector3.new(3,1,3)
	image___.Face = Enum.NormalId.Top
	image___.Texture = "rbxassetid://8450601351"
	PART.Anchored = true
	PART.CanCollide = false
	PART.CastShadow = false
	PART.Material = Enum.Material.Neon

	while true do task.wait()
		pcall(function()
			if HumanoidRootPart then
				PART.CFrame = HumanoidRootPart.CFrame * CFrame.new(0,-2.5,0)
				if TeleportStyles.Part_Under_Torso then
					PART.Parent = workspace
				else
					PART.Parent =nil
				end
			end
		end)
	end
end)()

return TeleportStyles
