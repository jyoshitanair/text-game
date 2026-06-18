extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		Manager.next_scene_in_queue = "res://scenes/mainmenu.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
