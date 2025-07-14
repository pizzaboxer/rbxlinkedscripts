Tool = script.Parent
bombScript = script.Parent.Bomb

function plant(v)
	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

	local bomb = Instance.new("Part")

        

	local spawnPos = vCharacter.PrimaryPart.Position


	

	bomb.Position = Vector3.new(spawnPos.x, spawnPos.y+3, spawnPos.z)
	bomb.Size = Vector3.new(2,2,2)
	
	bomb.BrickColor = BrickColor.new(21)
	bomb.Shape = 0
	bomb.BottomSurface = 0
	bomb.TopSurface = 0
	bomb.Reflectance = 1
	bomb.Name = "TimeBomb"
	bomb.Locked = true

	local creator_tag = Instance.new("ObjectValue")
	creator_tag.Value = game.Players.LocalPlayer
	creator_tag.Name = "creator"
	creator_tag.Parent = bomb

	bomb.Parent = game.Workspace
	local new_script = script.Parent.Bomb:clone()
	new_script.Disabled = false
	new_script.Parent = bomb

end



Tool.Enabled = true
function onActivated()

	if not Tool.Enabled then
		return
	end

	Tool.Enabled = false

	local character = Tool.Parent;
	local humanoid = character.Humanoid
	if humanoid == nil then
		print("Humanoid not found")
		return 
	end

	local targetPos = humanoid.TargetPoint
	local lookAt = (targetPos - character.Head.Position).unit

	plant(lookAt)

	wait(2)

	Tool.Enabled = true
end


script.Parent.Activated:connect(onActivated)