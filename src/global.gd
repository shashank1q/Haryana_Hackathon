extends Node

var energy: int = 80
var stress: int = 30
var money : int= 50
var joy : int = 50
var curr : String = "bedroom"
var pos : Vector2 = Vector2.ZERO
var stack : Array = [
	["world", Vector2(523, 498)], 
	["home", Vector2(1386, 446)],
	["bedroom", Vector2(0, 0)]
]
var to:String
var entryBtnVisible : bool = false
var dialogueNumber : int = 1
var ObjectiveNumber : int = 0
var doorOpen : Array = ["vegi"]
var nextDialogueScene: String = "bedroom"
