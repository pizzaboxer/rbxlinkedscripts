%eECK/fqlBRPVVVF4lyt83ZL5Pt6pSBxwrsUuEZlfHLyKN1rfReq2vOppuJSSVBHqIoLXsOjXnS1Pog7iDTIL6UAj5yI+szADBsf7AZKtxVcj9T5wZWUetIzwDfl07ZxC8U4bnJb+boLXU58RFS6o1pLzI4Putv98LpGeH6wltxk=%%1014611%wallWidth = 12
wallHeight = 4
brickSpeed = 0.04

local Tool = script.Parent


-- places a brick at pos and returns the position of the brick's opposite corner
function placeBrick(cf, pos, color)
	local brick = Instance.new("Part")
	brick.BrickColor = color
	brick.CFrame = cf * CFrame.new(pos + brick.size / 2)
	script.Parent.BrickCleanup:clone().Parent = brick -- attach cleanup script to this brick
	brick.BrickCleanup.Disabled = false
	brick.Parent = game.Workspace
	brick:makeJoints()
	return  brick, pos +  brick.size
end

function buildWall(cf)

	local color = BrickColor.random()
	local bricks = {}

	assert(wallWidth>0)
	local y = 0
	while y < wallHeight do
		local p
		local x = -wallWidth/2
		while x < wallWidth/2 do
			local brick
			brick, p = placeBrick(cf, Vector3.new(x, y, 0), color)
			x = p.x
			table.insert(bricks, brick)
			wait(brickSpeed)
		end
		y = p.y
	end

	return bricks

end


function snap(v)
	if math.abs(v.x)>math.abs(v.z) then
		if v.x>0 then
			return Vector3.new(1,0,0)
		else
			return Vector3.new(-1,0,0)
		end
	else
		if v.z>0 then
			return Vector3.new(0,0,1)
		else
			return Vector3.new(0,0,-1)
		end
	end
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
	local lookAt = snap( (targetPos - character.Head.Position).unit )
	local cf = CFrame.new(targetPos, targetPos + lookAt)

	Tool.Handle.BuildSound:play()

	buildWall(cf)

	wait(5)

	Tool.Enabled = true
end

script.Parent.Activated:connect(onActivated)

