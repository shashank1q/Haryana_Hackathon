extends Panel

func _ready():
	_update()

func _update():
	$Label/objective.text = Const.objective[global.ObjectiveNumber]
	$VBoxContainer/HBoxContainer/ProgressBar.value = global.energy
	$VBoxContainer/HBoxContainer2/ProgressBar.value = global.joy
	$VBoxContainer/HBoxContainer3/ProgressBar.value = global.stress
	$VBoxContainer/HBoxContainer4/Label.text = str(global.money) + " Money"
