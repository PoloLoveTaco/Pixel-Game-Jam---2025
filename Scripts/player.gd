extends CharacterBody2D

@export var speed = 150

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cam: Camera2D = $Camera2D
@onready var stats_canva: CanvasLayer = $StatsCanva

var is_stats_open = false
var world
var tilemap

func _ready() -> void:
	stats_canva.hide()
	
	world = get_parent();
	tilemap = world.get_node("Layers/CameraLockLayer")
	set_camera_limits();
	
func get_half_viewport() -> Vector2:
	var px_size = get_viewport().get_visible_rect().size
	return px_size * 0.5 * cam.zoom

func get_input():
	if Input.is_action_just_pressed("display stats"):
		if is_stats_open == false:
			display_stats_canva()
		else:
			hide_stats_canva()
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	var half = get_half_viewport()
	global_position.x = clamp(global_position.x, cam.limit_left, cam.limit_right)
	global_position.y = clamp(global_position.y, cam.limit_top, cam.limit_bottom)
	
	if velocity.x > 0:
		animation_player.play("walk_right")
	elif velocity.x < 0:
		animation_player.play("walk_left")
	elif velocity.y > 0:
		animation_player.play("walk_down")
	elif velocity.y < 0:
		animation_player.play("walk_up")
	elif velocity.x == 0 and velocity.y == 0:
		animation_player.play("idle")

func _physics_process(delta):
	if (GlobalVariables.is_speaking): return
	get_input()
	move_and_slide()
	
func set_camera_limits():
	var used = tilemap.get_used_rect()
	var size = tilemap.tile_set.tile_size

	cam.limit_left = used.position.x * size.x
	cam.limit_top = used.position.y * size.y
	cam.limit_right = used.end.x * size.x
	cam.limit_bottom = used.end.y * size.y

func display_stats_canva():
	is_stats_open = true
	stats_canva.show()

func hide_stats_canva():
	is_stats_open = false
	stats_canva.hide()
