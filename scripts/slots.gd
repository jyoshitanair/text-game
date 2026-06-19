extends Node2D
@onready var freedom: Label = $freedom
@onready var squished: Label = $squished
@onready var safetynet: Label = $safetynet
@onready var butterfly: Label = $butterfly
@onready var beaten: Label = $beaten
@onready var falldamage: Label = $falldamage
@onready var food: Label = $food
@onready var soclost: Label = $soclost
@onready var cold: Label = $cold
@onready var domination: Label = $domination
@onready var crushed: Label = $crushed
@onready var label_4: Label = $Label4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Manager.from_settings:
		label_4.text = "Return"
	if Manager.freedom == true:
		freedom.text = "ENDING: freedom but at what cost?"
	else:
		freedom.text = "???"
		
	if Manager.squished == true:
		squished.text = "ENDING: squished!"
	else:
		squished.text = "???"
		
	if Manager.safetynet == true:
		safetynet.text = "ENDING: a safety net?"
	else:
		safetynet.text = "???"
	
	if Manager.butterfly == true:
		butterfly.text = "ENDING: butterflies"
	else:
		butterfly.text = "???"
	if Manager.falldamage == true:
		falldamage.text = "ENDING: died from fall damage"
	else:
		falldamage.text = "???"
	if Manager.food == true:
		food.text = "ENDING: bonding over food :3"
	else:
		food.text = "???"
	if Manager.soclost == true:
		soclost.text = "ENDING: so close yet so far"
	else:
		soclost.text = "???"
	if Manager.cold == true:
		cold.text = "ENDING: the cold shoulder"
	else:
		cold.text = "???"
	if Manager.domination == true:
		domination.text = "ENDING: world domination"
	else:
		domination.text = "???"
	if Manager.beaten == true:
		beaten.text = "ENDING: beaten and bruised"
	else:
		beaten.text = "???"
	if Manager.crushed == true:
		crushed.text = "Ending: crushed dreams"
	else:
		crushed.text = "???"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		if Manager.from_settings ==false:
			Manager.next_scene_in_queue = "res://scenes/mainmenu.tscn"
			Manager.next_pause =  "res://scenes/mainmenu.tscn"
			Manager.paused = false
			#stupid other stuff
			Manager.pointer_position = 1
			Manager.normal_type = true
			Manager.tween_type = null
			Manager.type_finished = null
			Manager.text_array_index = 0
			Manager.can_move= false
			Manager.visible_characters = null 
			Manager.total_type_time = null 
		else:
			Manager.next_scene_in_queue = "res://scenes/settings.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
