%btUQya9HgX/b3AGJnHPXQcULmTzpUsZ24mUcKOJfhtAqXMnCtR9a30yzFk97MAAtlV1pNl/xHDe7rk/ZR72Y+imjIcfhTJnPlfLHqHzNehIIiHHC+y20F4GkJe0qcbe3TCjoIjXLsJz41HK7n5btPNk5BvsN3F3woCkGsv6ALog=%%1014618%bombScript = script.Parent.Bomb
Tool = script.Parent

function plant()
	local bomb = Instance.new("Part")
   
	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

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
	creator_tag.Value = vPlayer
	creator_tag.Name = "creator"
	creator_tag.Parent = bomb

	bomb.Parent = game.Workspace
	local new_script = bombScript:clone()
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

	plant()

	wait(6)

	Tool.Enabled = true
end


script.Parent.Activated:connect(onActivated)