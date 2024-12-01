extends TextureButton


func _on_pressed() -> void:
	AutoLoad.current_level = "Main Level"
	AutoLoad.change_scene.emit("res://Scenes/main_level.tscn")
