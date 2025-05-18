extends Node2D

@onready var office_door: InteractionArea = $OfficeDoor
@onready var house_door: InteractionArea = $HouseDoor
const PLAYER = preload("res://Scenes/player.tscn")
@onready var spawn_point: Node2D = $SpawnPoint
@onready var se_street: AudioStreamPlayer = $SFX/Street

@onready var bw_detector_1 : Node2D = $BwDetectors/BwDetector
@onready var bw_detector_2 : Node2D = $BwDetectors/BwDetector2
@onready var bw_detector_3 : Node2D = $BwDetectors/BwDetector3
@onready var bw_detector_4 : Node2D = $BwDetectors/BwDetector4
@onready var bw_detector_5 : Node2D = $BwDetectors/BwDetector5
@onready var bw_detector_6 : Node2D = $BwDetectors/BwDetector6

var player_instance

func _ready() -> void:
	office_door.interact = Callable(self, "launch_dialog_office_end_act")
	house_door.interact = Callable(self, "launch_dialog_house_end_act")
	se_street.play()
	
	if not get_tree().root.has_node("Player"):
		player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position

func _process(delta: float) -> void:
	if not player_instance: return
	
	var player_y = player_instance.global_position.y
	var bw1_y = bw_detector_1.global_position.y
	var bw2_y = bw_detector_2.global_position.y
	var bw3_y = bw_detector_3.global_position.y
	var bw4_y = bw_detector_4.global_position.y
	var bw5_y = bw_detector_5.global_position.y
	var bw6_y = bw_detector_6.global_position.y
	
	if player_y > bw1_y:
		GlobalVariables.bw_amount = 1.0
	elif player_y < bw1_y and player_y > bw2_y:
		GlobalVariables.bw_amount = 0.90
	elif player_y < bw2_y and player_y > bw3_y:
		GlobalVariables.bw_amount = 0.80
	elif player_y < bw3_y and player_y > bw4_y:
		GlobalVariables.bw_amount = 0.70
	elif player_y < bw4_y and player_y > bw5_y:
		GlobalVariables.bw_amount = 0.60
	elif player_y < bw6_y:
		GlobalVariables.bw_amount = 0.0

func launch_dialog_office_end_act():
	Dialog.launch_dialog(Dialog.OFFICE_END_ACT)

func launch_dialog_house_end_act():
	Dialog.launch_dialog(Dialog.HOUSE_END_ACT)
