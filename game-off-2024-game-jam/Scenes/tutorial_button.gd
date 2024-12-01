extends TextureButton


func _on_pressed() -> void:
	
	AutoLoad.current_level = "Tutorial"
	AutoLoad.change_scene.emit("res://Scenes/Level_test.tscn")
