extends Node2D

@onready var sounds = $AudioStreamPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		AutoLoad.keys_collected["Key1"] = true
		sounds.play()
		var timered = Timer.new()
		add_child(timered)
		timered.wait_time = 1.1
		timered.one_shot = true
		timered.start()
		await timered.timeout
		timered.queue_free()
	
	queue_free()
