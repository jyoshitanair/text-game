extends Node2D
@onready var fade: ColorRect = $ColorRect2
@onready var main_text: RichTextLabel = $Label2
@onready var pointer: Polygon2D = $choices/pointer
@onready var choices: Node2D = $choices
@onready var cat: Label = $Label
@export var path1: String
@export var path2: String
var pointer_position = 1
var normal_type = true
var tween_type
var type_finished
var text_array_index = 0 
var can_move= false
var total_type_time = null
var ending= false 
@export var text_array = ["no","sjkfjladjhkjhjkkhjhjkhjkhhjhjhkhjhkjf","ksjdlkfjslf"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if text_array[2] == "FAHHHH":
		text_array[2] = "... %s? ........ %s!!!!! No wake up please!"%[Manager.urname,(Manager.urname).to_upper()]
	if self.is_in_group("ending"):
		ending = true
	pointer_position = Manager.pointer_position
	if pointer_position ==1:
		pointer.position = Vector2(1481.0,690.0)
	else:
		pointer.position = Vector2(1481.0,790.0)
	text_array_index = Manager.text_array_index
	normal_type = Manager.normal_type
	tween_type = Manager.tween_type
	type_finished= Manager.type_finished
	text_array_index = Manager.text_array_index
	can_move = Manager.can_move
	if text_array_index < text_array.size():
		main_text.text = text_array[text_array_index]
	main_text.visible = false
	if can_move == false:
		fade.modulate = Color(0.0, 0.0, 0.0, 1.0)
		fade.visible = true
		var tween = create_tween()
		tween.tween_property(fade,"modulate",Color(0.0, 0.0, 0.0, 0.0),1.0)
		await tween.finished
		can_move = true
	if Manager.visible_characters != null: 
		main_text.visible_characters = Manager.visible_characters
	fade.queue_free()
	if normal_type:
		typeity_type()
	else:
		main_text.text = text_array[text_array_index-1]
		main_text.show()
		if not ending:
			choices.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
			Manager.next_scene_in_queue = "res://scenes/mainmenu.tscn"
			Manager.next_pause = scene_file_path
			Manager.paused  = true
			#stupid other settings
			if tween_type and tween_type.is_valid():
				Manager.total_type_time = total_type_time - (tween_type.get_total_elapsed_time())
			Manager.visible_characters = main_text.visible_characters
			Manager.pointer_position = pointer_position
			Manager.normal_type = normal_type
			Manager.tween_type = tween_type
			Manager.type_finished = type_finished
			Manager.text_array_index = text_array_index
			Manager.can_move= can_move
			get_tree().change_scene_to_file("res://scenes/loading.tscn")
	if can_move:
		if Input.is_action_just_pressed("enter"):
			if normal_type:
				if not type_finished:
					if tween_type:
						tween_type.kill()
					main_text.visible_characters = main_text.text.length()
					type_finished =true
				else:
					text_array_index += 1
					if text_array_index==3 and self.name == "YesBirdwatching":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣠⣤⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀
	⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
	⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
	⠀⠀⠀⠘⣿⣿⣿⣿⠟⠁⠠⣤⣤⠹⣿⣿⣿⣿⣿⢟⣥⡀⠀⠹⣿⣿⡿⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⢿⣿⡇⢿⣿⣿⣿⣿⢸⣿⣿⡄⠀⢿⣿⣷⠀⠀⠀⠀⠀
	⠀⠀⠀⢠⣿⣿⣿⣷⡀⠀⠀⠉⠉⢀⣿⣿⣿⣿⣿⡈⠉⠉⠀⢀⣾⣿⣿⠀⠀⠀⠀⠀
	⢀⣀⣀⣀⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⣿⣾⣿⣷⣦⣤⣴⣿⣿⣿⣿⣤⠤⢤⣤⡄
	⠈⠉⠉⢉⣙⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣤⣽⣿⣿⣿⣿⣿⣿⣿⣿⣇⣀⣀⣀⡀⠀
	⠐⠚⠋⠉⢀⣬⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣥⣀⡀⠈⠀⠈⠛
	⠀⠀⠴⠚⠉⠀⠀⠀⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠋⠁⠀⠀⠀⠉⠛⠢⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀"
					if text_array_index==1 and self.name == "WorldDominationFun":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠠⣾⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⡿⠟⠛⣿⣿⣧⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣫⣴⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⠋⠁⠀⣖⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠈⠻⣿⣿⣿⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⣿⣿⣿⣿⠃⠀⠀⠀⣷⣿⣿⣿⣿⣿⣿⣿⡟⣷⣿⡇⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⣿⣿⣿⣿⡆⠀⠀⠀⠻⡿⠋⣸⣿⣿⣿⣿⡳⠿⡿⠃⠀⢀⣿⣿⣿⡆⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣯⣹⣿⣷⣤⣾⣿⣿⣿⣿⣿⣿⣃⣀⣀⣀⣀⠀
		⠀⠾⠿⠟⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⡿⣹⣿⣿⣿⣿⣿⣿⡿⠛⠋⠉⠉⠋⠀
		⠠⣤⣤⣶⡶⠿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣘⠻⠋⠀⠘⣋⣴⣿⣿⣿⣿⣿⣿⡿⠛⠛⠛⠛⠷⣶⡄
		⠀⠀⠉⢀⣠⣶⠾⠟⠉⠻⢿⣿⣿⣿⣿⣿⣿⣆⠀⢀⣿⣿⣿⣿⣿⣿⠟⠛⠛⠳⢶⣦⣄⡀⠀⠀
		⠀⠀⠀⠟⠋⠁⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠁⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
		⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀"
					if text_array_index==3 and self.name == "JoinSleep":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⣶⠖⣦⢀⠀⠀⠀⠀⠀⠀⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣵⠟⠁⠀⠈⢷⡀⠄⠀⠀⠀⠀⡄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⣿⢵⣂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡼⡋⠂⠀⠀⠀⠀⠀⠐⢧⡢⠀⠀⢮⠖⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⡿⠉⠉⠻⢷⣤⠀⠀⠀⠀⠀⣀⣀⣠⣠⡤⣤⡦⣖⣦⡶⣯⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢕⡗⢅⢀⢀⣠
⠀⠀⠀⠀⠀⠀⠀⠀⡐⣪⡇⠀⠀⠀⠀⠈⠷⣶⠺⠛⠟⠙⠀⠘⠀⠁⠁⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠗⠋⠃⠁⠁
⠀⠀⠀⠀⠀⠀⠀⠠⢰⢟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠂⣎⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣜⣶⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠰⡷⠳⡺⡜⠫⠫⠷⠁⠁⠀⠀⢨⠃⠀⠀⠀⠀
⠀⠀⠀⢀⡀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⣴⡾⡷⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣶⠀⠀
⠀⠀⠙⢓⠢⣃⡶⣰⠄⠀⠀⠀⠀⡀⣠⣴⡏⡋⠊⠈⠀⠀⠀⠀⠀⠀⠲⠛⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⠀⠀
⠀⠀⠀⠀⠀⠀⣠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⢄⢴⡟⠋⠁⠀⠀⠀
⠀⠀⠀⠀⡀⡷⠁⠀⠀⠀⡶⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠬⠽⠶⠗⠑⠉⠙⠷⣢⡄⢄⠀⠀
⠀⠀⠠⡲⠏⠀⠀⠀⢠⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠫⡻⠤
⠀⢘⠟⠁⠀⠀⠀⠻⡺⢧⣦⣠⣠⣄⡠⣄⣄⣤⡤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠉⠁⠉⣩⡻⣙⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⡱⠎⡁⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⢦⣴⣮⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀
⠀⠀⠀⠀⠀⠀⠀⡿⡬⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⢚⠛⠻⠡
⠀⠀⠀⠀⠀⠀⢘⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⣖⡦⠀
⠀⠀⠀⠀⠀⢀⣸⡇⡇⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⣇⡁
⠀⠀⠀⠀⠀⠀⠻⣭⡷⠇⠻⠋⣎⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠏
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡖⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⢀⣀⣄⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡢⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⠏⠍⠙⠉⠈⣹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢭⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⡻⠁⠀⠀⠀⠀⠨⠉⢗⡑⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
					if text_array_index==3 and self.name == "DecapitatedCatHead":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⣤⣒⣒⡾⢭⡩⠉⢰⢖⣖⠤⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⢷⣫⠤⢲⠄⠀⠀⠧⡵⠀⡛⠉⢂⢄⣀⢻⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⡴⣏⡽⢿⣿⣜⢲⡀⡼⠃⠀⡠⢻⣓⣄⢹⣼⢪⠃⢠⠉⠞⠋⠉⠢⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⠏⠀⢠⠴⢾⡽⣥⡟⡃⢙⡤⢤⡱⣈⠤⡍⣄⣞⠛⣒⣼⣲⠀⠀⠀⠀⠈⢢⡀⠀⠀⠀
⠀⠀⢠⡞⠁⠀⠀⠳⡤⡼⠀⠋⠱⣔⢄⡎⠭⠕⠁⠸⢹⠛⢯⣦⠊⠉⠁⠀⠀⠀⠀⠀⠀⠱⡄⠀⠀
⠀⢠⡟⠀⠀⠀⠀⠀⠛⠀⠀⢤⣶⡸⡼⠸⡀⠀⠀⠸⢸⢠⠈⠃⡠⠤⣲⣄⢀⣗⣷⡄⢷⡀⠘⡄⠀
⠀⣮⠃⠀⠀⠀⠀⠀⢀⡠⠞⠛⠁⠈⠑⡣⠃⠀⠀⢰⢈⠈⡢⠶⠕⠒⣜⡋⣻⣟⢦⠀⠘⠃⠀⢱⡀
⢸⢻⠀⠀⠀⠀⠀⢀⡼⣘⡕⠀⠀⠀⠈⠀⠀⠀⢀⢇⢎⡜⠁⠀⠀⠀⠀⠈⠈⠉⠉⣄⠀⠀⠀⡀⡇
⡟⡎⡄⠀⡖⠒⢲⢣⠌⡎⠀⠀⠀⠀⠀⠀⠀⠀⡜⡜⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣆⠀⢠⠟⣼
⡿⡔⢝⣄⢇⢶⠀⠽⢲⠁⠀⠀⠀⠀⠀⠀⠀⠀⢇⢇⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣶⡇⠀⣿
⣷⠈⠢⣈⠉⡪⣧⡂⠌⠒⠄⠀⠀⠀⠀⠀⠀⠀⠘⢎⠪⡓⠤⠠⠤⠲⡄⠀⠀⠀⠀⠀⠀⣰⢱⢡⢻
⢸⡄⠀⠀⠙⢎⡎⡎⠑⠒⠲⣄⡀⠀⢦⡀⠀⠀⠀⠀⠑⠢⠄⠀⡄⡇⢧⠀⠀⠀⠀⠀⠞⢡⠃⡠⡇
⠈⣷⠀⠀⠀⠘⣇⠇⠀⠀⠀⠀⠹⢂⣂⡀⠉⠲⡄⠀⠀⠀⠀⠀⠁⠀⢸⠀⠀⠀⠀⢸⢀⡹⡀⢱⠁
⠀⠘⣧⠀⠀⢰⢇⢆⠀⠀⠀⠀⠀⠀⠀⠈⡵⡀⡅⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠰⢳⢫⢣⢣⠇⠀
⠀⠀⠘⣧⠀⠀⠳⣗⢳⢤⠀⠀⠀⠀⠀⠸⣰⢱⠁⠀⠀⠀⠀⠀⠀⠀⢹⠀⢀⠜⠁⠓⡣⣣⠏⠀⠀
⠀⠀⠀⠈⢷⣄⠀⠈⢣⢏⡇⠀⠀⠀⡔⣊⢜⡎⠀⠀⠀⠀⠀⠀⢆⠰⣘⣺⠕⣀⠤⢀⡴⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠙⢷⣄⠀⢫⠘⡄⢀⡞⡝⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠁⠒⠒⠊⢁⡴⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠻⢦⣧⡘⢾⣜⠰⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠖⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠳⠿⢤⣌⣀⣀⣀⣀⣀⣠⡤⠤⠖⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
					if text_array_index==2 and self.name == "CrossTheStreet":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠤⠤⠶⠤⠤⠤⠤⠤⠤⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣀⡠⠤⠒⠲⠚⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣈⣉⣲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣠⠖⠋⠁⢀⣠⡤⠶⢶⠖⣲⣶⣶⣦⣄⡀⠀⣀⣠⣤⣴⣶⣾⣿⣭⣍⡁⠈⠙⠦⣝⢦⣀⡄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣜⣇⢀⣴⠟⠈⠙⠲⢤⣼⠠⢸⣿⣿⣿⣿⣿⣆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢶⣬⣷⣿⠷⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⠋⣀⡀⠉⡑⠂⠤⣀⡀⠈⠉⠛⠻⢿⣿⡿⠿⣿⣧⢻⣿⣿⣿⣿⣿⣿⣿⣿⠿⣀⣀⡈⣁⣀⣤⣽⡶⠠⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠘⣾⣿⣿⣆⠀⠀⠀⠀⢌⣑⠢⢄⡀⠀⠺⠷⠶⡾⣿⣧⢻⣿⣿⣿⣿⣽⣿⣿⣿⣿⡿⠿⠟⠛⠉⠁⠀⠀⠀⠈⠑⠢⢄⡀⠀⠀⠀⠀⠀
⠀⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠉⠒⠢⠀⡀⠀⢨⠀⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⢤⡀⠀⠀
⠀⣿⣿⣿⣿⣿⡖⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⡷⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⣄⠀
⠀⠘⢿⣿⣿⣿⣇⡀⠈⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠈⠉⠒⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀
⠀⠀⠀⠙⠛⠛⠛⠛⠒⠤⣀⠀⠉⠒⡄⠀⠀⠀⠀⠀⠀⣠⣶⣶⣶⣄⠀⠉⠒⠤⣤⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣶⠜⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⢤⣈⠀⠈⠁⠀⢠⠀⣿⣿⣿⣿⣿⣷⡄⠀⠀⠙⣿⣿⣿⡿⣿⣿⣦⡀⠀⣴⣾⣿⣿⣿⣿⣿⢿⢠⠇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠒⠤⣀⡈⠀⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠈⠉⠉⠉⠛⠛⠛⠛⠒⢻⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣤⠈⣿⣿⣿⣿⣿⣿⣟⡸⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⡆⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣦⢽⣟⡿⠿⠛⠉⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⠿⠿⠿⠿⠷⠶⠶⠾⠶⠶⠶⠶⠶⠶⠶⠚⠉⠁⠀⠀⠀⠀⠀⠀⠀"
					if text_array_index==2 and self.name == "Assistant":
						cat.text = "⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣠⣤⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⢉⣙⠛⢿⣿⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⢋⠹⢿⣿⣿⣿⣿⣶⣿⣿⣶⣶⣼⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠘⣿⣿⠫⠍⠉⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⠟⠁⠀⠀⠹⣿⣿⡿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⢼⣿⠀⢿⣿⣿⣿⣿⠀⣾⣷⠀⠀⢿⣿⣷⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣷⡀⠀⠀⠈⠋⢀⣿⣿⣿⣿⣿⡀⠙⠋⠀⢀⣾⣿⣿⠀⠀⠀⠀⠀
⢀⣀⣀⣀⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⣿⣾⣿⣷⣦⣤⣴⣿⣿⣿⣿⣤⠤⢤⣤⡄
⠈⠉⠉⢉⣙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣽⣶⣦⣹⣿⣿⣿⣿⣿⣿⣿⣇⣀⣀⣀⡀⠀
⠐⠚⠋⠉⢀⣬⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣥⣀⡀⠈⠀⠈⠛
⠀⠀⠴⠚⠉⠀⠀⠀⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣛⡏⠥⣦⡀⠀⠉⠛⠢⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣯⣿⡆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠧⢾⡇⣏⣿⡅⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢘⢿⣾⣿⣗⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣾⡷⡿⣿⡪⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣿⢿⡏⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣿⣿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀"	
					if text_array_index >= text_array.size():
						print("FULL")
						normal_type = false 	
						if not ending: 
							choices.show()
						return
					main_text.text= text_array[text_array_index]
					typeity_type()
			else:
				#not normal type
				if ending: 
					if  self.name == "RejectSleep":
						get_tree().change_scene_to_file("res://scenes/endings/fight-ending.tscn")
						return
					if  self.name == "Assitant":
						get_tree().change_scene_to_file("res://scenes/endings/worlddominating-assistant.tscn")
						return
					if  self.name == "Who'sGonnaFeedYou":
						get_tree().change_scene_to_file("res://scenes/endings/hungry.tscn")
						return
					if  self.name == "KeepSleeping":
						get_tree().change_scene_to_file("res://scenes/endings/died-bookshelf.tscn")
						return
					if  self.name == "YouFirstLoser":
						get_tree().change_scene_to_file("res://scenes/endings/happy-tree.tscn")
						return
					if  self.name == "YeahIAgree(feedingAlt)":
						get_tree().change_scene_to_file("res://scenes/endings/happy-escape.tscn")
						return
					if  self.name == "i-first":
						get_tree().change_scene_to_file("res://scenes/endings/fell-off-tree.tscn")
						return
					if  self.name == "CrossTheStreet":
						get_tree().change_scene_to_file("res://scenes/endings/car crash.tscn")
						return
					if self.get_parent().name == "endings":
						get_tree().change_scene_to_file("res://scenes/slots.tscn")
						return
				if pointer_position == 1 :
					get_tree().change_scene_to_file(path1)
				if pointer_position == 2:
					get_tree().change_scene_to_file(path2)
		if Input.is_action_just_pressed("down") and normal_type == false:
			if pointer.position == Vector2(1481.0,690.0):
				pointer.position = Vector2(1481.0,790.0)
				pointer_position = 2
			elif pointer.position == Vector2(1481.0,790.0):
				pointer.position = Vector2(1481.0,690.0)
				pointer_position = 1
func typeity_type() -> void: 
	type_finished = false
	if  Manager.visible_characters != null:
		main_text.visible_characters = Manager.visible_characters
		Manager.visible_characters = null
	else:
		main_text.visible_characters = 0
	tween_type = create_tween()
	if Manager.total_type_time != null:
		total_type_time = Manager.total_type_time
		Manager.total_type_time = null
	else:
		total_type_time = main_text.text.length() *0.08
	main_text.visible = true
	tween_type.tween_property(main_text, "visible_characters",main_text.text.length(),total_type_time)
	await tween_type.finished
	type_finished = true
	
