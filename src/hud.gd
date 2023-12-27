extends CanvasLayer

#signals
signal left_pressed
signal right_pressed
signal left_released
signal right_released


@onready var EnterBtn = $ActionBtn/enter
@onready var ExitBtn = $ActionBtn/Exit

func _process(delta):
	if global.entryBtnVisible:
		EnterBtn.visible = true
	elif EnterBtn.visible:
		EnterBtn.visible = false
	if not global.stack.is_empty():
		ExitBtn.visible = true
	elif ExitBtn.visible:
		ExitBtn.visible = false

func _on_enter_pressed():
	global.entryBtnVisible = false
	global.stack.push_back(global.curr)

func _on_exit_pressed():
	global.entryBtnVisible = true
	global.stack.pop_back()

# custom signals for player movement
func _on_right_button_down():
	emit_signal("right_pressed")

func _on_right_button_up():
	emit_signal("right_released")


func _on_left_button_down():
	emit_signal("left_pressed")

func _on_left_button_up():
	emit_signal("left_released")
