%VywwpqLBRvghzLEWlmj01Hrxowc/Ki8uwzTuEL1U4VXXGsjT8/n5thDtEpZsLu1caD6T37n0EMq37y5QN29wu12b4jUvd8sfvCD+pc7nVzsoHJzj67CD/PBYKNixnEtOx/dqzaoUuAEjAwp9dPA+RAmKq/HZGaP35CZC7Spd1gg=%%1014476%local Tool = script.Parent;

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
