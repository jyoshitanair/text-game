extends Node2D
@onready var fade: ColorRect = $ColorRect2
@onready var main_text: RichTextLabel = $Label2
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
		if type_finished:
			text_array_index += 1
			if text_array_index >=text_array.size():
				text_array_index = 0
			main_text.text= text_array[text_array_index]
			typeity_type()
		else:
			if tween_type:
				tween_type.kill()
			main_text.visible_characters = main_text.text.length()
			type_finished =true
func typeity_type() -> void: 
	type_finished = false
	main_text.visible_characters = 0 
	tween_type = create_tween()
	var total_type_time = main_text.text.length() *0.08
	main_text.visible = true
	tween_type.tween_property(main_text, "visible_characters",main_text.text.length(),total_type_time)
	await tween_type.finished
	type_finished = true
		
