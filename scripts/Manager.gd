extends Node
var next_scene_in_queue =  "res://scenes/mainmenu.tscn"
var next_pause =  "res://scenes/mainmenu.tscn"
var paused = false
#stupid other stuff
var pointer_position = 1
var normal_type = true
var tween_type
var type_finished
var text_array_index = 0
var can_move= false
var visible_characters = null 
var total_type_time = null 
var urname = "silly kitty"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
