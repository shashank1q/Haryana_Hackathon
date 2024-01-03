extends Node

func _pause():
	get_tree().paused = !get_tree().paused

func change_scene():
	$AnimationPlayer.play("start")

func _on_animation_player_animation_finished(anim_name):
	#print(global.curr)
	if anim_name == "start":
		var res = get_tree().change_scene_to_file(Const.path[global.stack[-1][0]])
		if res == OK:
			$AnimationPlayer.play("end")
	elif(global.curr == global.nextDialogueScene):
		DialogueManager.show_dialogue_balloon(load("res://dialogue/new.dialogue"), "d" + str(global.dialogueNumber))
