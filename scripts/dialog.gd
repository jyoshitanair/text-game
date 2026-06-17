extends Node2D
@onready var fade: ColorRect = $ColorRect2
@onready var main_text: RichTextLabel = $Label2
@onready var pointer: Polygon2D = $choices/pointer
@onready var choices: Node2D = $choices
@export var path1: String
@export var path2: String
var pointer_position = 1
var normal_type = true
var tween_type
var type_finished
var text_array_index = 0 
@export var text_array = ["no","sjkfjladjhkjhjkkhjhjkhjkhhjhjhkhjhkjf","ksjdlkfjslf"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_text.text = text_array[text_array_index]
	main_text.visible = false
	fade.modulate = Color(0.0, 0.0, 0.0, 1.0)
	fade.visible = true
	var tween = create_tween()
	tween.tween_property(fade,"modulate",Color(0.0, 0.0, 0.0, 0.0),1.0)
	await tween.finished
	fade.queue_free()
	typeity_type()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		if normal_type:
			if not type_finished:
				if tween_type:
					tween_type.kill()
				main_text.visible_characters = main_text.text.length()
				type_finished =true
			else:
				text_array_index += 1
				print(text_array_index)
				if text_array_index >= text_array.size():
					print("FULL")
					normal_type = false 	
					choices.show()
					return
				main_text.text= text_array[text_array_index]
				typeity_type()
		else:
			if pointer_position == 1 :
				get_tree().change_scene_to_file(path1)
			if pointer_position == 2:
				get_tree().change_scene_to_file(path2)
	if Input.is_action_just_pressed("down") and normal_type == false:
		if pointer.position == Vector2(1481.0,40.0):
			pointer.position = Vector2(1481.0,138.0)
			pointer_position = 2
		elif pointer.position == Vector2(1481.0,138.0):
			pointer.position = Vector2(1481.0,40.0)
			pointer_position = 1
func typeity_type() -> void: 
	type_finished = false
	main_text.visible_characters = 0 
	tween_type = create_tween()
	var total_type_time = main_text.text.length() *0.08
	main_text.visible = true
	tween_type.tween_property(main_text, "visible_characters",main_text.text.length(),total_type_time)
	await tween_type.finished
	type_finished = true
		
