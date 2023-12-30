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
	if global.stack.size() != 1:
		ExitBtn.visible = true
	elif ExitBtn.visible:
		ExitBtn.visible = false

func _process(delta):
	if global.entryBtnVisible:
		EnterBtn.visible = true
	elif EnterBtn.visible:
		EnterBtn.visible = false

func _on_enter_pressed():
	global.stack[-1][1] = global.pos
	global.curr = global.to
	global.stack.push_back([global.to, Vector2.ZERO])
	trans.change_scene()

func _on_exit_pressed():
	global.stack.pop_back()
	#print(global.stack)
	global.curr = global.stack[-1][0]
	trans.change_scene()

# custom signals for player movement
func _on_right_button_down():
	emit_signal("right_pressed")

func _on_right_button_up():
	emit_signal("right_released")

func _on_left_button_down():
	emit_signal("left_pressed")

func _on_left_button_up():
	emit_signal("left_released")
