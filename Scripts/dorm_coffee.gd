extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var music: AudioStreamPlayer = $Music
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_nemo: AnimationPlayer = $Nemo/AnimationPlayer


func _ready() -> void:
	music.play()
	cinematic()


func cinematic():
	animation_player.play("ending_1")
	await animation_player.animation_finished
	
	Dialog.launch_dialog(Dialog.CAFFEE_1)
	animation_nemo.play("idle_up")
	while GlobalVariables.is_speaking:
		await get_tree().process_frame
	animation_nemo.stop()
	
	animation_player.play("ending_2")
	await animation_player.animation_finished
	
	animation_nemo.play("idle_right")
	Dialog.launch_dialog(Dialog.CAFFEE_2)
	while GlobalVariables.is_speaking:
		await get_tree().process_frame
	animation_nemo.stop()
	
	animation_player.play("ending_3")
	await animation_player.animation_finished
	
	SceneTransition.change_without_animation_or_saving("res://Scenes/end_credits.tscn")
