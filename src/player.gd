extends CharacterBody2D

const SPEED : int = 300
var vel : int = 0
@onready var sprite := $Sprite


func _physics_process(delta):
	velocity.x = vel
	move_and_slide()
	

func _on_hud_left_pressed():
	vel = -SPEED

func _on_hud_left_released():
	vel = 0

func _on_hud_right_pressed():
	vel = SPEED

func _on_hud_right_released():
	vel = 0
