--rbxsig%aoxvdm1aPjaZNWfciK/Pr0xTiQSMTYPK6DeYzUBftM3ktWksFxD/qPfCrisawJWUgizm/pahcvio8hGdfVGRiDrzgV+Eu4mePmGNQTrNP1WKW+gHElJt9nBVEWptENhA5JCXALEN65aM6HLKdEaWvEOtAKhSF2Y2nJcuyixzj58=%
--rbxassetid%1014476%
local Tool = script.Parent;

enabled = true
function onButton1Down(mouse)
	if not enabled then
		return
	end

	enabled = false
	mouse.Icon = "rbxasset://textures\\GunWaitCursor.png"

	wait(.5)
	mouse.Icon = "rbxasset://textures\\GunCursor.png"
	enabled = true

end

function onEquippedLocal(mouse)

	if mouse == nil then
		print("Mouse not found")
		return 
	end

	mouse.Icon = "rbxasset://textures\\GunCursor.png"
	mouse.Button1Down:connect(function() onButton1Down(mouse) end)
end


Tool.Equipped:connect(onEquippedLocal)
