extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label

func _ready() -> void:
	ending_credits()


func ending_credits():
	animation_player.play("classic")
	await animation_player.animation_finished
	label.text = "Thank you for playing"
	animation_player.play("classic")
	await animation_player.animation_finished
	SceneTransition.change_without_animation_or_saving("res://Scenes/Menus/main_menu.tscn")
