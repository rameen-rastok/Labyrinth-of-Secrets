extends CharacterBody2D

func _process(delta: float) -> void:
	if AutoLoad.third_room == true:
		queue_free()
