--// Fade in
while script.Parent.TextTransparency > 0 do
	script.Parent.TextTransparency = script.Parent.TextTransparency - 0.1
	wait(0.01)
end

wait(2)

--// Fade out
while script.Parent.TextTransparency < 1 do
	script.Parent.TextTransparency = script.Parent.TextTransparency + 0.1
	wait(0.01)
end

--// Request for removal
game.ReplicatedStorage.CORE_RemoteEvents.RemoveStatus:FireServer(script.Parent.Name)