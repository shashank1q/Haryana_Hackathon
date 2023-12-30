extends ColorRect

@export var scene_id : String

func _on_area_2d_body_entered(body):
	if body.name == "player" and scene_id in global.doorOpen:
		global.to = scene_id
		global.pos = body.global_position
		global.entryBtnVisible = true

func _on_area_2d_body_exited(body):
	if body.name == "player":
		global.entryBtnVisible = false
