extends CharacterBody2D

@onready var key_1 = $KEY1
@onready var key_2 = $KEY2
@onready var key_3 = $KEY3
@onready var speedrun_box = $TextureRect
@onready var speedrun_text = $RichTextLabel
@onready var anim = $AnimatedSprite2D

@export var DASHSPEED: int = 2
@export var BASESPEED: int = 300
var dash_duration: float = 0
var dash_cooldown: float = 0.0
var dash_available: bool = true
var horizontal_move :bool
var vertical_move :bool
var dash_active: bool = false

var hour = 0
var minute = 0
var second = 0
var seconds = 0
var text_time: String

func _ready() -> void:
	AutoLoad.dashing.connect(dashing_time)
	AutoLoad.player_health.connect(damage)
	AutoLoad.checkingpoint.connect(player_pos)
	
	key_1.visible = false
	key_2.visible = false
	key_3.visible = false
	
	speedrun_box.visible = true
	speedrun_text.visible = true

func player_pos():
	AutoLoad.player_position_x = position.x
	AutoLoad.player_position_y = position.y

func dashing_time():
	AutoLoad.px = position.x
	AutoLoad.py = position.y
	if dash_available == true:
		dash_active = true
		dash_cooldown = 0.6
		dash_available = false
		dash_duration = 0.35

func _physics_process(delta: float) -> void:
	
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("dir_up"):
		velocity.y = -BASESPEED
		#if dash_active == true:
		#	velocity.y = -DASHSPEED

	if Input.is_action_pressed("dir_down"):
		velocity.y = BASESPEED
		#if dash_active == true:
		#	velocity.y = DASHSPEED

	if Input.is_action_pressed("dir_left"):
		velocity.x = -BASESPEED
		#if dash_active == true:
		#	velocity.x = -DASHSPEED

	if Input.is_action_pressed("dir_right"):
		velocity.x = BASESPEED
		#if dash_active == true:
		#	velocity.x = DASHSPEED
	
	if dash_active:
		velocity.x = velocity.x * DASHSPEED
		velocity.y = velocity.y * DASHSPEED
	
	if AutoLoad.health > 0:
		if velocity.x == 0 and velocity.y == 0:
			anim.play("default")
		if velocity.x == 0 and velocity.y != 0:
			anim.play("walk_up")
		if velocity.x > 0:
			anim.play("walk_right")
			if anim.flip_h == true:
				anim.flip_h = false
		if velocity.x < 0:
			anim.play("walk_right")
			if anim.flip_h == false:
				anim.flip_h = true
	
	if dash_duration > 0:
		dash_duration -= delta
	
	if dash_duration <= 0:
		dash_active = false
	
	if dash_duration <= 0 and dash_cooldown > 0:
		dash_cooldown -= delta
	
	if dash_cooldown <= 0:
		dash_available = true
	
	move_and_slide()

	if AutoLoad.keys_collected["Key1"] == true:
		key_1.visible = true
	else:
		key_1.visible = false

	if AutoLoad.keys_collected["Key2"] == true:
		key_2.visible = true
	else:
		key_2.visible = false
	
	if AutoLoad.keys_collected["Key3"] == true:
		key_3.visible = true
	else:
		key_3.visible = false
	
	second += delta
	if second >= 60:
		second = 0
		minute += 1
	if minute >= 60:
		hour +=1
	
	seconds = "%0.2f" % second 
	text_time = str(hour) + "." + str(minute) + "." + str(seconds)
	speedrun_text.text = text_time
	AutoLoad.final_time = text_time

func damage(hp):
	if hp <= 0:
		anim.play("death")
		var timered = Timer.new()
		add_child(timered)
		timered.wait_time = 1
		timered.one_shot = true
		timered.start()
		await timered.timeout
		timered.queue_free()
		position.x = AutoLoad.player_position_x
		position.y = AutoLoad.player_position_y
		velocity.x = 0
		velocity.y = 0
		AutoLoad.health = 100


func _process(_delta: float) -> void:
	pass
