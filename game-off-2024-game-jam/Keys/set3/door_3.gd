extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player" and AutoLoad.keys_collected["Key3"] == true:
		
		AutoLoad.third_room = true
		queue_free()
