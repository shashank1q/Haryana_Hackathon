extends TextureRect

@export var scene_id : String

func _ready():
	$Area2D/CollisionShape2D.position = Vector2(size.x * 0.5, size.y * 0.75)
	$Area2D/CollisionShape2D.shape.extents = Vector2(size.x * 0.45 , size.y * 0.25)
	

func _on_area_2d_body_entered(body):
	if body.name == "player" and scene_id in global.doorOpen:
		global.to = scene_id
		global.pos = body.global_position
		global.entryBtnVisible = true

func _on_area_2d_body_exited(body):
	if body.name == "player":
		global.entryBtnVisible = false
