extends Node2D
@onready var text_edit: TextEdit = $TextEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		Manager.next_scene_in_queue = "res://scenes/mainmenu.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
func _on_option_button_item_selected(index: int) -> void:
	if index == 0: 
		Manager.music.stream = load("res://peakmusic/outlawcreative-you-call-it-chaos-i-call-it-grace-392666.mp3")
	if index == 1: 
		Manager.music.stream = load("res://peakmusic/alex-morgan-rock-rock-music-545492.mp3")
	if index == 2: 
		Manager.music.stream = load("res://peakmusic/purrplecat-cat-nap-lofi-hiphop-beats-199252.mp3")
	if index == 3: 
		Manager.music.stream = load("res://peakmusic/the_mountain-dramatic-dramatic-music-508006.mp3")


func _on_button_pressed() -> void:
	Manager.from_settings = true
	get_tree().change_scene_to_file("res://scenes/slots.tscn")

#submit name
func _on_button_2_pressed() -> void:
	Manager.urname = text_edit.text


func _on_h_slider_value_changed(value: float) -> void:
	Manager.volume = value
