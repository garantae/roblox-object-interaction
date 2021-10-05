--[[

  KeyBehavior
  @author Garantae

  When a player collects this item, add a value in the player model to record that they own this item. Then, send the item data to the
  player's user interface.

--]]

--// Variables
local KeyName = script.Parent.ItemName.Value
local InventorySlot = game.ReplicatedStorage.CORE_Interface.InventorySlot
local StatusSlot = game.ReplicatedStorage.CORE_Interface.StatusSlot


script.Parent.ClickDetector.MouseClick:Connect(function(player)
	
	--// Add the value to the player
	if player:FindFirstChild("KeyName") == nil then
		local KeyItem = Instance.new("StringValue")
		KeyItem.Name = KeyName
		KeyItem.Parent = player
		
		--// Add the item into the inventory
		local KeyItemAdd = InventorySlot:Clone()
		KeyItemAdd.Name = KeyName
		KeyItemAdd.ItemName.Text = KeyName
		KeyItemAdd.ItemImage.Image = "rbxassetid://6181658410"
		KeyItemAdd.Parent = game.Players[player.Name].PlayerGui.ItemInventory.MainFrame
		
		--// Display notification
		local KeyNotification = StatusSlot:Clone()
		KeyNotification.Name = KeyName
		KeyNotification.Text = "Picked up " .. KeyName
		KeyNotification.Parent = game.Players[player.Name].PlayerGui.StatusBar.MainFrame
	end
	
	--// Play the pick up sound
	if script.Parent.KeyPickUp.IsPlaying == false then
		script.Parent.KeyPickUp.TimePosition = 0.4
		script.Parent.KeyPickUp:Play()
	end
		
	--// Destroy the model in workspace
	workspace:FindFirstChild(script.Parent.Name.."Model"):Destroy()
	script.Parent.ClickDetector:Destroy()
	script.Parent.ItemName:Destroy()
		
	repeat wait() until script.Parent.KeyPickUp.IsPlaying == false
		
	script.Parent:Destroy()

end)
