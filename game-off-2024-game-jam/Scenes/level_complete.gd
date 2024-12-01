extends Node2D

@onready var Level_name: String = AutoLoad.current_level
@onready var Level_Time: String = AutoLoad.final_time

@onready var level = $Background/LevelName
@onready var timing = $Background/Time

func _ready() -> void:
	
	level.text = Level_name + " Completed!"
	timing.text = "Time: " + Level_Time
