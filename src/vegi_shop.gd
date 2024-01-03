extends Node

@onready var panel = $background/panel
@onready var item = preload("res://utils/shop_items.tscn")

# add more item here
var items = [
	["res://images/tomato.png", "Tomatoes", "50"],
	["res://images/potato.png", "Potatoes  ", "100"],
	["res://images/carrot.png", "Carrotes  ", "60"],
	["res://images/apple.png", "Apples     ", "150"],
]

# update tasks here
func update_task():
	if global.ObjectiveNumber == 0:
		global.doorOpen = ["home", "kitchen"]
		global.ObjectiveNumber += 1
		global.dialogueNumber += 1
		global.nextDialogueScene = "kitchen"
	$HUD/progress._update()

func on_btn_pressed(cost):
	if(global.money >= cost):
		global.money -= cost
		$background/panel/Label.add_theme_color_override("font_color", Color.LIME_GREEN)
		$background/panel/Label.text = "Thanks for purchasing!"
		
		update_task()
	else:
		$background/panel/Label.add_theme_color_override("font_color", Color.RED)
		$background/panel/Label.text = "Sorry, you don't have enough money"
	$background/panel/Label.visible = true

func generate_items():
	for i in items:
		var inst  = item.instantiate()
		inst.get_node("icon").texture = load(i[0])
		inst.get_node("name").text = i[1]
		inst.get_node("Button").text = i[2]
		inst.get_node("Button").pressed.connect(on_btn_pressed.bind(int(i[2])))
		panel.add_child(inst)

func _ready():
	generate_items()
	DialogueManager.show_dialogue_balloon(load("res://dialogue/new.dialogue"), "vegi")
