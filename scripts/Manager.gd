extends Node
var next_scene_in_queue =  "res://scenes/mainmenu.tscn"
var next_pause =  "res://scenes/mainmenu.tscn"
var paused = false
var from_settings = false
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
var music
#slots
var freedom = false
var squished = false
var safetynet= false
var butterfly= false
var beaten= false
var falldamage= false
var food= false
var soclost= false
var cold= false
var domination= false
var crushed = false
var volume = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music = AudioStreamPlayer.new()
	add_child(music)
	music.autoplay = false
	music.stream = preload("res://peakmusic/outlawcreative-you-call-it-chaos-i-call-it-grace-392666.mp3")
	music.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	music.volume_db = volume
	if music and !music.playing:
		music.play()
	
