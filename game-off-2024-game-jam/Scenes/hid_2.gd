extends TileMapLayer
var alpha = 1
var count = 0
var die = false
var die_now = false
func _physics_process(delta: float) -> void:
	if die == true:
		modulate.a = alpha
		alpha -= 0.08
	if alpha <=0:
		die_now = true
	if die_now == true:
		queue_free()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		die = true
