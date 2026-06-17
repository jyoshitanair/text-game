extends Node2D
@onready var label_3: Label = $Label3
@onready var pointer: Polygon2D = $pointer
var elapsed_time = 0
var pointer_position = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if elapsed_time >= 0.35:
		elapsed_time = 0
		label_3.visible = !label_3.visible 
	else:
		elapsed_time += delta
	#moving
	if Input.is_action_just_pressed("down"):
		if pointer.position == Vector2(-80,40.0):
			pointer.position = Vector2(-80,138.0)
			pointer_position = 2
		elif pointer.position == Vector2(-80,138.0):
			pointer.position = Vector2(-80,236.0)
			pointer_position = 3
		else:
			pointer.position = Vector2(-80,40.0)
			pointer_position = 1
	if Input.is_action_just_pressed("enter"):
		if pointer_position == 1 :
			Manager.next_scene_in_queue = "res://scenes/dialog.tscn"
			get_tree().change_scene_to_file("res://scenes/loading.tscn")
		if pointer_position == 2:
			Manager.next_scene_in_queue = "res://scenes/settings.tscn"
			get_tree().change_scene_to_file("res://scenes/loading.tscn")
			
