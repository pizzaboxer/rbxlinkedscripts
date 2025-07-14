%RZgMHSjqjjMFUZM2fSgVK0bRQmQGM1UBWpkdVAuTyAh52x15FNSMfMkbgjQ+fJb5kmxiT+9KI61K+4WZedZhMDJhKn3grCOQVfidribRodUTXUtNV1tJK4wP5IZpKpSVK1SwlITzCHY72wBt6G9E+LP+RjWI+8/46BmR7r/oCns=%%1014632%
ball = script.Parent
damage = 25

r = game:service("RunService")

last_sound_time = r.Stepped:wait()

function onTouched(hit)

local now = r.Stepped:wait()

if (now - last_sound_time > .1) then
ball.Boing:play()
last_sound_time = now
else
return
end

local humanoid = hit.Parent:findFirstChild("Humanoid")
if humanoid~=nil then
tagHumanoid(humanoid)
humanoid:TakeDamage(damage)
wait(2)
untagHumanoid(humanoid)
connection:disconnect()
else
damage = damage / 2
if damage < 2 then
connection:disconnect()
end
end
end

function tagHumanoid(humanoid)
-- todo: make tag expire
local tag = ball:findFirstChild("creator")
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

connection = ball.Touched:connect(onTouched)


t, s = r.Stepped:wait()
d = t + 5.0 - s
while t < d do
t = r.Stepped:wait()
end

ball.Parent = nil