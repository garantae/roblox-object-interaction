--[[

  DoorBehavior
  @author Garantae

  Door opens if a player has the specified key in their inventory, while refusing entry to those who do not.

--]]

--// Variables
local DoorName = script.Parent.ItemName.Value
local IsDoorOpen = script.Parent.IsDoorOpen
local DoorModel = script.Parent.Name
local DoorSound = script.Parent.DoorSound
local DoorLockedSound = script.Parent.DoorLocked
local DoorUnlockedSound = script.Parent.DoorUnlock
local DoorLocked = true

--// Configurables
local KeyName = "Silver Key" -- REQUIRED KEY TO OPEN THE DOOR
local LockNotificationText = "Locked. I need a key to get in." -- MESSAGE TO PLAYERS WITHOUT A KEY
local UnlockedNotificationText = "Unlocked " .. DoorName -- MESSAGE TO PLAYERS WHO UNLOCKED THE DOOR (DISPLAYS ONCE)


script.Parent.ClickDetector.MouseClick:Connect(function(player)
	if DoorLocked == false then
		if IsDoorOpen.Value == false then
			IsDoorOpen.Value = true
			DoorSound:Play()
			--// Hide the closed door
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("ClosedDoor").Transparency = 1
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("ClosedDoor").CanCollide = false
			--// Show the opened door
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("OpenedDoor").Transparency = 0
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("OpenedDoor").CanCollide = true
		else
			IsDoorOpen.Value = false
			DoorSound:Play()
			--// Show the closed door
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("ClosedDoor").Transparency = 0
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("ClosedDoor").CanCollide = true
			--// Hide the opened door
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("OpenedDoor").Transparency = 1
			game.Workspace:FindFirstChild(DoorModel.."Model"):FindFirstChild("OpenedDoor").CanCollide = false
		end
	else
		if player:FindFirstChild(KeyName) then
			DoorLocked = false
			script.Parent.ItemName.Value = "Door"
			DoorUnlockedSound:Play()
			
			--// Delete key from inventory (if it exists)
			if player:FindFirstChild(KeyName) then
				player:FindFirstChild(KeyName):Destroy()
			end
			if game.Players[player.Name].PlayerGui.ItemInventory.MainFrame:FindFirstChild(KeyName) then
				game.Players[player.Name].PlayerGui.ItemInventory.MainFrame:FindFirstChild(KeyName):Destroy()
			end
			
			--// Display unlock notification
			if game.Players[player.Name].PlayerGui:FindFirstChild("StatusBar"):FindFirstChild("MainFrame") then
				local UnlockNotification = game.ReplicatedStorage.CORE_Interface.StatusSlot:Clone()
				UnlockNotification.Text = UnlockedNotificationText
				UnlockNotification.Parent = game.Players[player.Name].PlayerGui:FindFirstChild("StatusBar"):FindFirstChild("MainFrame")
			end
		end
		if DoorLocked == true then
			DoorLockedSound:Play()
			
			if LockNotificationText ~= "" and not game.Players[player.Name].PlayerGui.StatusBar.MainFrame:FindFirstChild(DoorName.."LockedNotification") then
				local LockNotification = game.ReplicatedStorage.CORE_Interface.StatusSlot:Clone()
				LockNotification.Name = DoorName.."LockedNotification"
				LockNotification.Text = LockNotificationText
				LockNotification.Parent = game.Players[player.Name].PlayerGui:FindFirstChild("StatusBar"):FindFirstChild("MainFrame")
			end	
		end	
	end
end)
