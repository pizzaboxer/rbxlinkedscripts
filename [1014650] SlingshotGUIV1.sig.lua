%iZJE2OQ6D1SdBrPeAXt4/072KASIYcxZE8gmzwvV/LXFMlqfvX+74kXOcF9q4jkagNwQsMpyFv8/wgsAV7KkZPHcFOLYQ703t3ANmzdu4V55tWE+j7YGRq5bqvMEau2TZapigAZLk7ImcHd3XTdE5TR+zjEqcqY0B0nxHDdyh7I=%%1014650%local Tool = script.Parent;

enabled = true
function onButton1Down(mouse)
	if not enabled then
		return
	end

	enabled = false
	mouse.Icon = "rbxasset://textures\\GunWaitCursor.png"

	wait(.2)
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
