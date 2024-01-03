extends Node

var button = Button
var arr = [1,2,3,4,5,6,7,8,9,10]
var count = 1;
const reward = 10
var time = 60

func shuffle():
	var temp 
	for i in range(10):
		randomize()
		var pos = randi() % 10
		temp = arr[pos]
		arr[pos] = arr[i]
		arr[i] = temp

func add_btn():
	var index = 1
	for i in arr:
		var b  = button.new()
		b.text = str(i)
		b.custom_minimum_size = Vector2(70,70)
		var mark = get_node("gamePanel/Marker2D" + str(index))
		index += 1
		b.button_up.connect(_on_btn_pressed.bind(i, b))
		mark.add_child(b)

func delete_btn():
	for i in range(1,11):
		var mark = get_node("gamePanel/Marker2D" + str(i))
		for m in mark.get_children():
			print(m)
			m.queue_free()

func _enter_animation():
	$AnimationPlayer.play("enter")

func _on_btn_pressed(n, node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "global_position", $gamePanel/box/boxPos.global_position, 0.4)
	tween.tween_callback(node.queue_free)
	
	if(count == 10):
		await get_tree().create_timer(0.45).timeout
		count = 0
		global.money += reward
		$HUD/progress._update()
		$AnimationPlayer.play("complete")
	elif(n != count):
		await get_tree().create_timer(0.45).timeout
		count = 1
		delete_btn()
		$AnimationPlayer.play("error")
		return
	count += 1

func _on_timer_timeout():
	time -= 1
	if time == -1:
		$Timer.stop()
		global.stress = min(global.stress + 30, 100)
		$AnimationPlayer.play("exit")
		return
	$timerLabel/time.text = str(time)

func _exit_room():
	$HUD._on_exit_pressed()
