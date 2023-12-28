extends ColorRect

func _on_area_2d_body_entered(body):
	if body.name == "player":
		global.curr = "bedroom"
		global.entryBtnVisible = true
	#DialogueManager.show_dialogue_balloon(load("res://dialogue/new.dialogue"),"this_is_a_node_title")
func _on_area_2d_body_exited(body):
	if body.name == "player":
		global.entryBtnVisible = false
