extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func change_scene_dissolve(target: String):
	animation_player.play("dissolve")
	await animation_player.animation_finished
	change_to(target)
	animation_player.play_backwards("dissolve")


func change_scene_slide(target: String):
	animation_player.play("slide")
	await animation_player.animation_finished
	change_to(target)
	animation_player.play("slide 2")

func load_scene_from_save(target: String):
	get_tree().change_scene_to_file(target)
	SaveManager.charge_saved_scene(target)
	animation_player.play("slide 2")

func change_scene_slide_only_exit(target: String):
	change_to(target)
	animation_player.play("slide 2")


func change_scene_very_low_fade_in(target: String):
	animation_player.play("very_low_fade_in")
	await animation_player.animation_finished
	change_to(target)
	animation_player.play("RESET")
	
func change_to(path: String) -> void:
	var current = get_tree().current_scene
	if current:
		await SaveManager.on_change_scene(current)
	get_tree().change_scene_to_file(path)
	SaveManager.charge_saved_scene(path)
