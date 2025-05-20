extends Node

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var anim: AnimationPlayer = $Bowl/AnimationPlayer

func _ready() -> void:
	anim.play("bowl")
	decrease_progress_bar()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		progress_bar.value += 2


func decrease_progress_bar():
	while 1:
		progress_bar.value -= 1
		await get_tree().create_timer(1).timeout

func _process(delta: float) -> void:
	if progress_bar.value <= 0:
		game_is_loosed()
	elif progress_bar.value >= 100.0:
		game_is_win()

func game_is_win():
	SaveManager.data["quests"]["kitchen"]["bowl"] = true
	SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.GO_FURNACE
	get_tree().current_scene.quit_mini_game()
	queue_free()
	
func game_is_loosed():
	get_tree().current_scene.quit_mini_game()
	queue_free()
