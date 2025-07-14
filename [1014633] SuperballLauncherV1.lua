Tool = script.Parent

function fire(v)

	Tool.Handle.Boing:play()

	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

	local missile = Instance.new("Part")

        

	local spawnPos = vCharacter.PrimaryPart.Position
	


	spawnPos  = spawnPos + (v * 5)

	missile.Position = spawnPos
	missile.Size = Vector3.new(2,2,2)
	missile.Velocity = v * 200
	missile.BrickColor = BrickColor.random() -- BrickColor.new(26)
	missile.Shape = 0
	missile.BottomSurface = 0
	missile.TopSurface = 0
	missile.Name = "Cannon Shot"
	missile.Elasticity = 1
	missile.Reflectance = .2
	missile.Friction = 0

	Tool.Handle.Boing:clone().Parent = missile
	

	
	local new_script = script.Parent.CannonBall:clone()
	new_script.Disabled = false
	new_script.Parent = missile

	local creator_tag = Instance.new("ObjectValue")
	creator_tag.Value = vPlayer
	creator_tag.Name = "creator"
	creator_tag.Parent = missile
	


	missile.Parent = game.Workspace

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

	fire(lookAt)

	wait(2)

	Tool.Enabled = true
end


script.Parent.Activated:connect(onActivated)

