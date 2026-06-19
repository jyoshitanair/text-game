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
@onready var final: Label = $final
var found = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Manager.from_settings:
		label_4.text = "Return"
	if Manager.freedom == true:
		found +=1
		freedom.text = "ENDING: freedom but at what cost?"
	else:
		freedom.text = "???"
	if Manager.squished == true:
		found +=1
		squished.text = "ENDING: squished!"
	else:
		squished.text = "???"
		
	if Manager.safetynet == true:
		found +=1
		safetynet.text = "ENDING: a safety net?"
	else:
		safetynet.text = "???"
	if Manager.butterfly == true:
		found +=1
		butterfly.text = "ENDING: butterflies"
	else:
		butterfly.text = "???"
	if Manager.falldamage == true:
		found +=1
		falldamage.text = "ENDING: died from fall damage"
	else:
		falldamage.text = "???"
	if Manager.food == true:
		found +=1
		food.text = "ENDING: bonding over food :3"
	else:
		food.text = "???"
	if Manager.soclost == true:
		found +=1
		soclost.text = "ENDING: so close yet so far"
	else:
		soclost.text = "???"
	if Manager.cold == true:
		found +=1
		cold.text = "ENDING: the cold shoulder"
	else:
		cold.text = "???"
	if Manager.domination == true:
		found +=1
		domination.text = "ENDING: world domination"
	else:
		domination.text = "???"
	if Manager.beaten == true:
		found +=1
		beaten.text = "ENDING: beaten and bruised"
	else:
		beaten.text = "???"
	if Manager.crushed == true:
		found +=1
		crushed.text = "Ending: crushed dreams"
	else:
		crushed.text = "???"
	if found != 11:
		final.text = "Found: %d/11 Endings! Meow!"%found
	else:
		final.text = "You've got to be kitten-me! You got them all!"
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
