extends CharacterBody2D

const SPEED : int = 300
var vel : int = 0
@onready var sprite := $Sprite
@export var limit : Vector3 = Vector3(-10000, 10000, 10000)

func _ready():
	$Camera2D.limit_left = limit.x
	$Camera2D.limit_right = limit.y
	$Camera2D.limit_bottom = limit.z

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		$Sprite.flip_h = false
		vel  = SPEED
	elif Input.is_action_pressed("right"):
		$Sprite.flip_h = true
		vel = -SPEED
	else:
		vel = 0
	velocity.x = vel
	move_and_slide()
	

func _on_hud_left_pressed():
	$Sprite.flip_h = true
	vel = -SPEED

func _on_hud_left_released():
	vel = 0

func _on_hud_right_pressed():
	$Sprite.flip_h = false
	vel = SPEED

func _on_hud_right_released():
	vel = 0
