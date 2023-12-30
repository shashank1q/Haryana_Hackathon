extends Node


func _ready():
	DialogueManager.show_dialogue_balloon(load("res://dialogue/new.dialogue"), "vegi")
	global.doorOpen = ["home", "kitchen"]
	global.ObjectiveNumber += 1
	global.dialogueNumber += 1
	global.nextDialogueScene = "kitchen"
