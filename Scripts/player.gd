extends CharacterBody2D

@export var speed = 400
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.y > 0:
		animation_player.play("walk_down")
	elif velocity.x == 0:
		animation_player.stop()

func _physics_process(delta):
	get_input()
	move_and_slide()
