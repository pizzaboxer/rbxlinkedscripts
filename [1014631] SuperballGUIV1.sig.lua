%BGC8mgdW8dEG833hNT7yts92Ohs00Bw8Er+AxgoGvklcPNzSkWK0V/2QWrhQmp1ffQBXqeC1u7BNn2SdZsjtt+jZfK67z2Jl/ROpnq94QSz//h8/wSf10Ezgp46slf68D9k7iUy+I8L9j/sLWJxNYv1k+9e4g0j/SbEAxQsqeoI=%%1014631%local Tool = script.Parent;

enabled = true
function onButton1Down(mouse)
	if not enabled then
		return
	end

	enabled = false
	mouse.Icon = "rbxasset://textures\\GunWaitCursor.png"

	wait(2)
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
