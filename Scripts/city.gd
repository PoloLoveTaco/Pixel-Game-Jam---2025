extends Node2D

@onready var rain = $Rain
@onready var cam: Camera2D

@onready var bw_detector_1 : Node2D = $BwDetectors/BwDetector
@onready var bw_detector_2 : Node2D = $BwDetectors/BwDetector2
@onready var bw_detector_3 : Node2D = $BwDetectors/BwDetector3
@onready var bw_detector_4 : Node2D = $BwDetectors/BwDetector4
@onready var bw_detector_5 : Node2D = $BwDetectors/BwDetector5
@onready var bw_detector_6 : Node2D = $BwDetectors/BwDetector6

@onready var office_door: InteractionArea = $OfficeDoor
@onready var second_office_door: InteractionArea = $SecondOfficeDoor
@onready var house_door: InteractionArea = $HouseDoor
@onready var coffee_door: InteractionArea = $CoffeeDoor

@onready var spawn_point_office: Node2D = $SpawnPointOffice
@onready var spawn_point_house: Node2D = $SpawnPointHouse

@onready var animation_background: CanvasLayer = $Animation
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var se_rain: AudioStreamPlayer = $SFX/Rain
@onready var se_street: AudioStreamPlayer = $SFX/Street

const PLAYER = preload("res://Scenes/player.tscn")

var player_instance

var quest : Dictionary

var is_first_act: bool

func _ready() -> void:
	quest = SaveManager.data["quests"]
	
	if SaveManager.get_nb_quest_finished() == 0:
		is_first_act = true
	else: 
		is_first_act = false
	
	office_door.interact = Callable(self, "go_to_office")
	second_office_door.interact = Callable(self, "second_office_interact")
	house_door.interact = Callable(self, "go_to_house")
	coffee_door.interact = Callable(self, "go_to_coffee")
	
	var spawn_point: Node2D
	if is_first_act:
		animation_background.show()
		spawn_point = spawn_point_office
	else:
		spawn_point = spawn_point_house
	
	if not get_tree().root.has_node("Player"):
		player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
	
	while not has_node("Player"):
		await get_tree().process_frame
	
	if is_first_act:
		cam = get_node("Player").get_node("Camera2D")
	
		if GlobalVariables.is_new_game:
			GlobalVariables.is_in_cinematic = true
			animation_player.play("intro")
			await animation_player.animation_finished
			GlobalVariables.is_in_cinematic = false
		else:
			animation_background.hide()
			se_rain.play()
			se_street.play()
	else:
		rain.hide()
		se_street.play()

func _process(delta: float) -> void:
	if not player_instance: return
	
	if is_first_act:
		rain.global_position = cam.get_canvas_transform().affine_inverse() * Vector2.ZERO
		rain.global_position.y -= 32;
	else:
		var top_y = bw_detector_1.global_position.y
		var bottom_y = bw_detector_6.global_position.y
		
		if top_y == bottom_y:
			GlobalVariables.bw_amount = 0.0
			return
		
		var player_y = player_instance.global_position.y
		
		var t = clamp((player_y - top_y) / (bottom_y - top_y), 0.0, 1.0)
		
		GlobalVariables.bw_amount = lerp(1.0, 0.0, t)

func go_to_office():
	if is_first_act:
		Dialog.launch_dialog(Dialog.FIRST_ACT_OFFICE)
	else:
		Dialog.launch_dialog(Dialog.OFFICE_END_ACT)

func second_office_interact():
	Dialog.launch_dialog(Dialog.SECOND_OFFICE)

func go_to_house():
	if is_first_act:
		SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")
	else:
		Dialog.launch_dialog(Dialog.HOUSE_END_ACT)
	
func go_to_coffee():
	if is_first_act:
		Dialog.launch_dialog(Dialog.COFFEE_FIRST_ACT)
	else:
		SceneTransition.change_scene_slide("res://Scenes/Levels/dorm_coffee.tscn")
	
	
