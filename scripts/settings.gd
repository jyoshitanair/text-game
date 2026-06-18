extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		Manager.next_scene_in_queue = "res://scenes/mainmenu.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
