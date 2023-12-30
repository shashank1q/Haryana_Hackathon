extends Node

var curr : String = "bedroom"
var pos : Vector2 = Vector2.ZERO
var stack : Array = [
	["world", Vector2(-184, 467)], 
	["home", Vector2(1307, 415)],
	["bedroom", Vector2(0, 0)]
]
var to:String
var entryBtnVisible : bool = false
var dialogueNumber : int = 1
var ObjectiveNumber : int = 0
var doorOpen : Array = ["vegi"]
var nextDialogueScene: String = "bedroom"
