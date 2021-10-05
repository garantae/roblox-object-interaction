--[[

	ObjectHover
	@author Garantae

	Show the data (i.e. name) of a hovered object containing an "ItemName" StringValue. 

--]]

--// Client
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

--// GUI
local HOVER_MAINFRAME = script.Parent.HoverItemGUI.MainFrame
local HOVER_TXT = HOVER_MAINFRAME.TitleText

--// Main
game:GetService('RunService').RenderStepped:Connect(function()
	
	local X = mouse.X
	local Y = mouse.Y
	
	if mouse.Target then
		
		local pos1 = mouse.Target.Position
	    local pos2 = player.Character:WaitForChild("Torso").Position
	    local magnitude = (pos1 - pos2).magnitude
		
    		--// If object has "ItemName" StringValue, display it 
		if workspace:FindFirstChild(mouse.Target.Name) ~= nil and workspace[mouse.Target.Name]:FindFirstChild("ItemName") ~= nil and magnitude <= 10 then
			
			HOVER_TXT.Text = workspace[mouse.Target.Name]:FindFirstChild("ItemName").Value
			
				if HOVER_MAINFRAME.Visible == false then
					HOVER_MAINFRAME.Visible = true
					HOVER_MAINFRAME.Position = UDim2.new(0,X,0,Y - 30)
				end
        
		else
			
			if HOVER_MAINFRAME.Visible == true then
				HOVER_MAINFRAME.Visible = false
			end
			
		end
	end
	
end)
