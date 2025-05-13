extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer =$AnimationPlayer2
@onready var all_buttons: HBoxContainer = $AllButtons
@onready var option_menu: CanvasLayer = $"Option Menu"
@onready var audio_stream_player: AudioStreamPlayer = $"AudioStreamPlayer"


func _ready() -> void:
	audio_stream_player.play()
	animation_player.play("idle")
	animation_player_2.play("idle")
	GlobalVariables.bw_amount = 1.0

func _process(delta: float) -> void:
	if option_menu.visible:
		all_buttons.hide()
	else:
		all_buttons.show()


func _on_continue_button_pressed() -> void:
	audio_stream_player.stop()
	SaveManager.load_game()


func _on_new_game_button_pressed() -> void:
	audio_stream_player.stop()
	SceneTransition.change_scene_dissolve("res://Scenes/intro_first_act.tscn")


func _on_option_button_pressed() -> void:
	option_menu.show()
	all_buttons.hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
