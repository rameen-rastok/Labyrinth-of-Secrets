extends Node

signal change_scene(path_to_scene)
signal dashing
signal checkingpoint

signal player_health

var health: int = 100

var player_position_x = 464.055
var player_position_y = 206.59

var px
var py

var second_room = false
var third_room = false

var final_time = ""
var current_level = ""

var keys_collected = {"Key1": false, "Key2": false, "Key3": false}

var checker = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dash_action"):
		dashing.emit()

func _physics_process(delta: float) -> void:
	
	if health <= 0:
		player_health.emit(health)
		
	if checker == true:
		checkingpoint.emit()
		checker = false
	
