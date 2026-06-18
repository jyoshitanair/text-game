extends Node2D
var total_Delta = 0 
var passed_time = 0 
var random_array = [
	"Recalculating escape",
	"Snoozing for 18 hours",
	"Ruining the Furniture",
	"Hissing at the Cucumber",
	"moeow meeEEOW MEOW",
	"Busy World Dominating",
	"Knocking Glass Over",
]
@onready var label: Label = $Label
@onready var dot1: Label = $Label3
@onready var dot2: Label = $Label4
@onready var dot3: Label = $Label5
@onready var random: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var index = randi_range(0,6)
	random.text = random_array[index]
	var tween = create_tween().set_parallel(true)
	tween.tween_property(label,"rotation",deg_to_rad(360),2)
	tween.tween_property(label,"label_settings:font_size",1,2)	
	await get_tree().create_timer(0.2).timeout
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	total_Delta += delta
	if total_Delta >= 2.7:
		get_tree().change_scene_to_file(Manager.next_scene_in_queue)
	if passed_time >= 0.35:
		passed_time = 0
		if dot3.visible == false and dot2.visible == false and dot1.visible == false:
			dot1.visible = true
			return
		if dot3.visible == true:
			dot1.visible = false
			dot2.visible = false
			dot3.visible = false
			return
		if dot2.visible == true:
			dot3.visible = true
			return
		if dot1.visible == true:
			dot2.visible = true
			return
	else:
		passed_time += delta
