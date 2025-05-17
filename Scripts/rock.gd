extends RigidBody2D
class_name Rock

@onready var push_up_ia: InteractionArea = $PushUp
@onready var push_down_ia: InteractionArea = $PushDown
@onready var push_left_ia: InteractionArea = $PushLeft
@onready var push_right_ia: InteractionArea = $PushRight

@export var push_distance_in_pixel = 32
@export var push_time : float = 1

@onready var wife: Wife = $"../../Wife"

@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

@export var uid: String = "Rock_01"

var is_mooving: bool = false

func _ready() -> void:
	push_up_ia.interact = Callable(self, "push_up")
	push_down_ia.interact = Callable(self, "push_down")
	push_left_ia.interact = Callable(self, "push_left")
	push_right_ia.interact = Callable(self, "push_right")
	sleeping = true
	
func push(dir : Vector2) -> void:
	if is_mooving:
		return
	if wife.quest_status == Wife.beach.START:
		Dialog.launch_dialog(Dialog.LAZY_ROCK)
		return
	if get_tree().paused:
		return
	var target = global_position + dir * push_distance_in_pixel
	is_mooving = true
	sleeping = true
	sound.play()
	var tween: Tween = create_tween()
	tween.tween_property(self, "global_position", target, push_time
	).set_trans(Tween.TRANS_QUAD
	).set_ease(Tween.EASE_OUT)
	tween.connect("finished", Callable(self, "on_tween_finished"))
	
func on_tween_finished():
	sleeping = false
	is_mooving = false

func push_up() -> void: push(Vector2.UP)
func push_down() -> void: push(Vector2.DOWN)
func push_left() -> void: push(Vector2.LEFT)
func push_right() -> void: push(Vector2.RIGHT)

func _save() -> Dictionary:
	return {
		"scene_path" : get_tree().current_scene.scene_file_path,
		"id"      : uid,
		"file_path"  : get_scene_file_path(),
		"pos"     : [global_position.x, global_position.y],
	}

func _load(data: Dictionary) -> void:
	global_position = Vector2(data["pos"][0], data["pos"][1])
