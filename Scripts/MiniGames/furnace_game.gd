extends Node

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var slider: HSlider = $HSlider

@onready var anim: AnimationPlayer = $Furnace/AnimationPlayer

var in_the_zone: bool = false
var can_loose: bool = false

func _ready() -> void:
	anim.play("furnace")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		slider.value += 1
	else:
		slider.value -= 1
		
	if slider.value > 35.0 and slider.value < 65.0:
		in_the_zone = true
		can_loose = true
	else:
		in_the_zone = false
		
	if in_the_zone:
		progress_bar.value += 0.5
	else:
		progress_bar.value -= 1
		
	if progress_bar.value >= 100.0:
		game_is_win()
	elif progress_bar.value <= 0.0 and can_loose:
		game_is_loosed()

func game_is_win():
	SaveManager.data["quests"]["kitchen"]["furnace"] = true
	SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.END_FURNACE
	get_tree().current_scene.quit_mini_game()
	queue_free()
	
func game_is_loosed():
	get_tree().current_scene.quit_mini_game()
	queue_free()
