--[[

  RemoveStatus
  @author Garantae

  When called, remove the status notification text from the player's screen.

--]]

--// Variables
local RemoteEvents = game.ReplicatedStorage.CORE_RemoteEvents
local RemoveStatus = RemoteEvents:FindFirstChild("RemoveStatus")

RemoveStatus.OnServerEvent:Connect(function(player,StatusName)
	if game.Players[player.Name].PlayerGui.StatusBar.MainFrame:FindFirstChild(StatusName) then
		game.Players[player.Name].PlayerGui.StatusBar.MainFrame:FindFirstChild(StatusName):Destroy()
	end
end)
