extends CharacterBody2D

@export var white_type: bool = false

@onready var anim = $AnimatedSprite2D

var player_dashing_var: bool = false
var count: float =  0.0

func _ready() -> void:
	AutoLoad.dashing.connect(change_dash_state)

func change_dash_state():
	player_dashing_var = true
	count = 0.95

func _physics_process(delta: float) -> void:
	
	if white_type == true:
		anim.animation = "whited"
	
	if player_dashing_var == true:
		count -= delta
	if count <= 0:
		player_dashing_var = false

func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and player_dashing_var == true:
		queue_free()
