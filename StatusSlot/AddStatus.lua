--[[

	AddStatus
	@author Garantae

	Controls the appearance of the text as well as the request for the removal of the text
	after its set amount of visibility time.

--]]

--// Configurables
local StatusDuration = 2 -- How long the text will be visible on-screen

--// Fade text in
while script.Parent.TextTransparency > 0 do
	script.Parent.TextTransparency = script.Parent.TextTransparency - 0.1
	wait(0.01)
end

wait(StatusDuration)

--// Fade text out
while script.Parent.TextTransparency < 1 do
	script.Parent.TextTransparency = script.Parent.TextTransparency + 0.1
	wait(0.01)
end

--// Request for status notification to be removed
game.ReplicatedStorage.CORE_RemoteEvents.RemoveStatus:FireServer(script.Parent.Name)
