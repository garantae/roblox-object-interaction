# About
Details what an object does when interacted by a player. When attempting to open a locked door, if the player does not own the required item, they will receive a unique status message asking them to find an item to unlock it. To collect said item, the player must click on it which will create a StringValue in the player's character model where it can be recorded and checked for possession by the server (and thereby other objects). For the client, the collected item's name and image will be sent to the player's inventory interface where it can be viewed by them.

# Showcased Functions
* #### Locked Door
  * Deny entry to players without a key, as well as granting entry to those with one. Additionally, the locked door will send unique status messages to players based on its current state (locked/unlocked).
* #### Object Hover
  * Objects containing the "ItemName" StringValue will have its data sent to the player's user interface and allow interaction upon mouse hover.
* #### Item Inventory
  * Items, such as keys, are added to the player's character model where it can be altered, removed, or checked for possession by objects who require it. Additionally, the item's data, such as name and image, is sent to the player's inventory interface where it can be viewed and kept track of by the player.


# Locked Door Showcase

https://user-images.githubusercontent.com/91921033/136106373-ff98b3fe-3047-4104-b0f1-1af9aed7f77a.mp4

