extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func change_scene_dissolve(target: String):
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target)
	animation_player.play_backwards("dissolve")

func change_scene_slide(target: String):
	animation_player.play("slide")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target)
	animation_player.play("slide 2")
