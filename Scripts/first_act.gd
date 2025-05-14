extends Node2D

@onready var rain = $Rain
@onready var cam: Camera2D
@onready var office_door: InteractionArea = $OfficeDoor
@onready var house_door: InteractionArea = $HouseDoor
@onready var spawn_point: Node2D = $SpawnPoint

@onready var animation_background: CanvasLayer = $Animation
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var se_rain: AudioStreamPlayer = $SFX/Rain
@onready var se_street: AudioStreamPlayer = $SFX/Street

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	animation_background.show()
	if GlobalVariables.is_new_game:
		# Create the player when new game
		var player_instance = PLAYER.instantiate()
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
		add_child(player_instance)
	
	while not has_node("Player"):
		await get_tree().process_frame
	
	cam = get_node("Player").get_node("Camera2D")
	
	office_door.interact = Callable(self, "launch_dialog_1")
	house_door.interact = Callable(self, "go_home")
	
	if GlobalVariables.is_new_game:
		GlobalVariables.is_in_cinematic = true
		animation_player.play("intro")
		await animation_player.animation_finished
		GlobalVariables.is_in_cinematic = false
	else:
		animation_background.hide()
		se_rain.play()
		se_street.play()
	


func _process(delta: float) -> void:
	if has_node("Player"):
		rain.global_position = cam.get_canvas_transform().affine_inverse() * Vector2.ZERO
		rain.global_position.y -= 32;


func launch_dialog_1():
	Dialog.launch_dialog(Dialog.FIRST_ACT_OFFICE)


func go_home():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")
