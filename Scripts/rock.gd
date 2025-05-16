extends RigidBody2D
class_name Rock

@onready var push_up_ia: InteractionArea = $PushUp
@onready var push_down_ia: InteractionArea = $PushDown
@onready var push_left_ia: InteractionArea = $PushLeft
@onready var push_right_ia: InteractionArea = $PushRight

@export var push_distance_in_pixel = 32
@export var push_time : float = 0.45

func _ready() -> void:
	push_up_ia.interact = Callable(self, "push_up")
	push_down_ia.interact = Callable(self, "push_down")
	push_left_ia.interact = Callable(self, "push_left")
	push_right_ia.interact = Callable(self, "push_right")
	sleeping = true
	
func push(dir : Vector2) -> void:
	if get_tree().paused:
		return
	var target = global_position + dir * push_distance_in_pixel
	sleeping = true
	var tween: Tween = create_tween()
	tween.tween_property(self, "global_position", target, push_time
	).set_trans(Tween.TRANS_QUAD
	).set_ease(Tween.EASE_OUT)
	tween.connect("finished", Callable(self, "on_tween_finished"))
	
func on_tween_finished():
	sleeping = false

func push_up() -> void: push(Vector2.UP)
func push_down() -> void: push(Vector2.DOWN)
func push_left() -> void: push(Vector2.LEFT)
func push_right() -> void: push(Vector2.RIGHT)
