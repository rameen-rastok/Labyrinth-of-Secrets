extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player" and AutoLoad.keys_collected["Key2"] == true:
		AutoLoad.second_room = true
		queue_free()
