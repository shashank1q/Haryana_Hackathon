extends CanvasLayer

#signals
signal left_pressed
signal right_pressed
signal left_released
signal right_released


@export var hide_nav_btn = false

@onready var EnterBtn = $ActionBtn/enter
@onready var ExitBtn = $ActionBtn/Exit

func _ready():
	if hide_nav_btn:
		$moveBtn.visible = false

func _process(delta):
	if global.entryBtnVisible:
		EnterBtn.visible = true
	elif EnterBtn.visible:
		EnterBtn.visible = false
	if global.stack.size() != 1:
		ExitBtn.visible = true
	elif ExitBtn.visible:
		ExitBtn.visible = false

func _on_enter_pressed():
	global.stack.push_back(global.curr)
	trans.change_scene()

func _on_exit_pressed():
	trans.change_scene()
	global.stack.pop_back()
	global.entryBtnVisible = true

# custom signals for player movement
func _on_right_button_down():
	emit_signal("right_pressed")

func _on_right_button_up():
	emit_signal("right_released")

func _on_left_button_down():
	emit_signal("left_pressed")

func _on_left_button_up():
	emit_signal("left_released")
