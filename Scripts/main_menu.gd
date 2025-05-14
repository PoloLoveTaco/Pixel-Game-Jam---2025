extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer =$AnimationPlayer2
@onready var all_buttons: HBoxContainer = $AllButtons
@onready var option_menu: CanvasLayer = $"Option Menu"
@onready var audio_stream_player: AudioStreamPlayer = $"AudioStreamPlayer"

@onready var continue_button: Button = $AllButtons/ContinueButton

var fade_anim_is_active = false

func _ready() -> void:
	if not FileAccess.file_exists("res://Saves/savegame.save"):
		continue_button.hide()
	audio_stream_player.play()
	animation_player.play("idle")
	animation_player_2.play("idle")
	#GlobalVariables.bw_amount = 1.0

func _process(delta: float) -> void:
	if option_menu.visible or fade_anim_is_active:
		all_buttons.hide()
	else:
		all_buttons.show()


func _on_continue_button_pressed() -> void:
	audio_stream_player.stop()
	GlobalVariables.is_new_game = false
	SaveManager.load_game()


func _on_new_game_button_pressed() -> void:
	audio_stream_player.stop()
	GlobalVariables.is_new_game = true
	fade_anim_is_active = true
	SceneTransition.change_scene_very_low_fade_in("res://Scenes/intro_first_act.tscn")


func _on_option_button_pressed() -> void:
	option_menu.show()
	all_buttons.hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
