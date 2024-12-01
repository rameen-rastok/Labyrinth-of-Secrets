extends CharacterBody2D

func _process(delta: float) -> void:
	if AutoLoad.second_room == true:
		queue_free()
