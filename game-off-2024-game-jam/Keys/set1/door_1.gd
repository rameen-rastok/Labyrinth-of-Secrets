extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player" and AutoLoad.keys_collected["Key1"] == true:
		
		AutoLoad.change_scene.emit("res://Scenes/level_complete.tscn")
