extends Node

func _ready():
	if global.stack[-1][1] != Vector2.ZERO:
		$player.global_position = global.stack[-1][1]
