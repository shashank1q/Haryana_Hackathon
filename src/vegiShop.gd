extends ColorRect

func _on_area_2d_body_entered(body):
	if body.name == "player":
		global.curr = "vegi"
		global.entryBtnVisible = true

func _on_area_2d_body_exited(body):
	if body.name == "player":
		global.entryBtnVisible = false
