extends CharacterBody2D
class_name Player

@export var speed: float = 150

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cam: Camera2D = $Camera2D

@onready var sprite: Sprite2D = $Sprite2D
var level_textures : Dictionary = {
	"LevelBeach": preload("res://Assets/Nemo_beach.png"),
}

var is_stats_open: bool = false
var world
var tilemap
var last_direction: String = "down"

func _ready() -> void:	
	world = get_parent();
	tilemap = world.get_node("Layers/CameraLockLayer")
	set_camera_limits();
	update_texture(get_tree().current_scene.name)

func update_texture(level_name: String) -> void:
	if level_textures.has(level_name):
		sprite.texture = level_textures[level_name]

func get_half_viewport() -> Vector2:
	var px_size : Vector2 = get_viewport().get_visible_rect().size
	return px_size * 0.5 * cam.zoom

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	var half = get_half_viewport()
	global_position.x = clamp(global_position.x, cam.limit_left, cam.limit_right)
	global_position.y = clamp(global_position.y, cam.limit_top, cam.limit_bottom)
	
	if velocity.x > 0:
		animation_player.play("walk_right")
		last_direction = "right"
	elif velocity.x < 0:
		animation_player.play("walk_left")
		last_direction = "left"
	elif velocity.y > 0:
		animation_player.play("walk_down")
		last_direction = "down"
	elif velocity.y < 0:
		animation_player.play("walk_up")
		last_direction = "up"
	elif velocity.x == 0 and velocity.y == 0:
		animation_player.play("idle_"+last_direction)
	
	if Input.is_action_just_pressed("more_bw"):
		if GlobalVariables.bw_amount > 0:
			GlobalVariables.bw_amount = GlobalVariables.bw_amount - 0.25
	
	if Input.is_action_just_pressed("less_bw"):
		if GlobalVariables.bw_amount < 1:
			GlobalVariables.bw_amount = GlobalVariables.bw_amount + 0.25

func _physics_process(delta):
	if (GlobalVariables.is_speaking or GlobalVariables.is_in_cinematic or GlobalVariables.is_in_mini_game): return
	get_input()
	move_and_slide()
	
func set_camera_limits():
	var used = tilemap.get_used_rect()
	var size = tilemap.tile_set.tile_size

	cam.limit_left = used.position.x * size.x
	cam.limit_top = used.position.y * size.y
	cam.limit_right = used.end.x * size.x
	cam.limit_bottom = used.end.y * size.y


func _save() -> Dictionary:
	return {
		"scene_path" : get_tree().current_scene.scene_file_path,
		"id"         : "Player",
		"node_path" : get_path_to(self),
		"file_path"  : get_scene_file_path(),
		"pos"        : [global_position.x, global_position.y],
	}

func _load(data: Dictionary) -> void:
	global_position = Vector2(data["pos"][0], data["pos"][1])

#func save():
	#var save_dict = {
		#"scene" : get_tree().current_scene.scene_file_path,
		#"filename" : get_scene_file_path(),
		#"parent" : get_parent().get_path(),
		#"pos_x" : position.x,
		#"pos_y" : position.y,
	#}
	#return save_dict
