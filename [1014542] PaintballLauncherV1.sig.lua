%A+onLyEr7tQ0KGisb1Q3qpsgHmUTyq3eWYRs1Kcok0wVqbaEisFv/qwP5TN+rdQdSutm4zPV0M/kR9s1hokdD+PjjHdXeULgr0WYnVNC2TdGuE79pf5SHiLZa77YnSgzzQ66VnBRZcPXxndI0IhjpTzIKfxec/9j9CiQhhlL1JM=%%1014542%Tool = script.Parent

colors = {45, 119, 21, 24, 23, 105, 104}

function fire(v)

	Tool.Handle.Fire:play()
	

	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

	local missile = Instance.new("Part")

        

	local spawnPos = vCharacter.PrimaryPart.Position
	


	spawnPos  = spawnPos + (v * 8)

	missile.Position = spawnPos
	missile.Size = Vector3.new(1,1,1)
	missile.Velocity = v * 100
	missile.BrickColor = BrickColor.new(colors[math.random(1, #colors)])
	missile.Shape = 0
	missile.BottomSurface = 0
	missile.TopSurface = 0
	missile.Name = "Paintball"
	missile.Elasticity = 0
	missile.Reflectance = 0
	missile.Friction = .9

	local force = Instance.new("BodyForce")
	force.force = Vector3.new(0,90,0)
	force.Parent = missile
	
	Tool.BrickCleanup:clone().Parent = missile

	local new_script = script.Parent.Paintball:clone()
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

	wait(.5)

	Tool.Enabled = true
end


script.Parent.Activated:connect(onActivated)

