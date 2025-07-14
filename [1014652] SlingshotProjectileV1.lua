pellet = script.Parent
damage = 8

function onTouched(hit)
	humanoid = hit.Parent:findFirstChild("Humanoid")
	if humanoid~=nil then
		tagHumanoid(humanoid)
		humanoid.Health = humanoid.Health - damage
		wait(2)
		untagHumanoid(humanoid)
	else
		damage = damage / 2
		if damage < 0.1 then
			connection:disconnect()
		end
	end
end

function tagHumanoid(humanoid)
	-- todo: make tag expire
	local tag = pellet:findFirstChild("creator")
	if tag ~= nil then
		local new_tag = tag:clone()
		new_tag.Parent = humanoid
		
	end
end


function untagHumanoid(humanoid)
	if humanoid ~= nil then
		local tag = humanoid:findFirstChild("creator")
		if tag ~= nil then
			
			tag.Parent = nil
		end
	end
end

connection = pellet.Touched:connect(onTouched)

r = game:service("RunService")
t, s = r.Stepped:wait()
d = t + 2.0 - s
while t < d do
	t = r.Stepped:wait()
end

pellet.Parent = nil