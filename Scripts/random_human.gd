extends CharacterBody2D

@export var speed = 140
@export var dodge_speed = 230
@export var dodge_time = 0.25

@export var dir: Vector2 = Vector2(0.0, -1.0)
var dodge_timer = 0.0
var is_dodging = false

var player: CharacterBody2D
@onready var radar = $Area2D
var player_in_area = false

var anim: AnimationPlayer
var sprite: Sprite2D

var color_possibility: Array[Color] = [
	Color(0.0, 0.937, 0.997),
	Color(0.903, 0.765, 1.0),
	Color(1.0, 0.758, 0.748),
	Color(0.996, 0.803, 0.165),
	Color(0.0, 1.0, 0.118)
]

func _ready() -> void:
	anim = $AnimationPlayer
	sprite = $Sprite2D
	
	var random_index = randi() % 4;
	
	sprite.self_modulate = color_possibility[random_index]
	anim.play("walk_up")

func _physics_process(delta: float) -> void:
	if is_dodging:
		dodge_timer -= delta
		if dodge_timer <= 0.0:
			dir   = Vector2(0, -1)
			speed = 140
			is_dodging = false
			if player_in_area:
				start_dodge()
	velocity = dir * speed
	move_and_slide()
	
	if (position.y < 0):
		queue_free()

func side_is_clear(dir: Vector2, length: float = 32.0) -> bool:
	var space  = get_world_2d().direct_space_state
	var from   = global_position
	var to     = from + dir.normalized() * length
	var query  = PhysicsRayQueryParameters2D.create(from, to)
	query.exclude        = [self.get_rid(), player.get_rid()]
	query.collide_with_areas  = false
	query.collide_with_bodies = true
	return space.intersect_ray(query).is_empty()


func start_dodge():
	var to_player = (player.global_position - global_position).normalized()
	var left_dir = Vector2(-to_player.y,  to_player.x).normalized()
	var right_dir = -left_dir
	
	var left_free  = side_is_clear(left_dir)
	var right_free = side_is_clear(right_dir)
	
	var dodge_dir : Vector2
	if left_free and not right_free:
		dodge_dir = left_dir
	elif right_free and not left_free:
		dodge_dir = right_dir
	elif left_free and right_free:
		if randf() < 0.5:
			dodge_dir = left_dir
		else:
			dodge_dir = right_dir
	else:
		dodge_dir = -to_player
	
	dir         = dodge_dir
	speed       = dodge_speed
	dodge_timer = dodge_time
	is_dodging  = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not is_dodging:
		player = body
		player_in_area = true
		start_dodge()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
