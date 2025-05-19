extends CharacterBody2D

@export var speed: float = 300
@onready var anim: AnimationPlayer = $AnimationPlayer
var last_direction: String = "down"

func _ready() -> void:
	pass

func get_input() -> void:
	var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	input_direction.y = 0
	velocity = input_direction * speed
	
	if velocity.x > 0:
		anim.play("walk_right")
		last_direction = "right"
	elif velocity.x < 0:
		anim.play("walk_left")
		last_direction = "left"
	elif velocity.x == 0 and velocity.y == 0:
		anim.play("idle_down")
		

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
