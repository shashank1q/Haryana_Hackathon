extends CanvasLayer

func _pause():
	get_tree().paused = !get_tree().paused

func change_scene():
	$AnimationPlayer.play("start")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		var res = get_tree().change_scene_to_file(global.path[global.stack[-1]])
		if res == OK:
			$AnimationPlayer.play("end")
