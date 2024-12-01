extends Sprite2D

func _ready() -> void:
	visible = false
	AutoLoad.dashing.connect(dashing_time)
	
func dashing_time():
	position.x = AutoLoad.px
	position.y = AutoLoad.py
	visible = true
	var timered = Timer.new()
	add_child(timered)
	timered.wait_time = 0.5
	timered.one_shot = true
	timered.start()
	await timered.timeout
	timered.queue_free()
	visible = false
