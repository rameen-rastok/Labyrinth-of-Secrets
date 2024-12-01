extends CharacterBody2D

@onready var sawshape = $AnimatedSprite2D

@export var move_speed: int = 150
@export var x_move: int = 0
@export var y_move: int = 0

var initial_x
var initial_y

var count: float = 0

func _ready() -> void:
	initial_x = position.x
	initial_y = position.y

func _physics_process(delta: float) -> void:
	
	count += delta
	if count >= 0.01:
		count = 0
		sawshape.rotate(0.1)
	
	
	if position.x <= initial_x and x_move != 0:
		velocity.x = move_speed
	elif position.x >= (initial_x + x_move) and x_move != 0:
		velocity.x = -move_speed
		
	if position.y <= initial_y and y_move != 0:
		velocity.y = move_speed
	elif position.y >= (initial_y + y_move) and y_move != 0:
		velocity.y = -move_speed
		
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		AutoLoad.health = 0
