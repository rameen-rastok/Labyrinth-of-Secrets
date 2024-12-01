extends TextureButton



func _on_pressed() -> void:
	AutoLoad.health = 100
	AutoLoad.keys_collected = {"Key1": false, "Key2": false, "Key3": false}
	AutoLoad.change_scene.emit("res://Scenes/main_menu.tscn")
