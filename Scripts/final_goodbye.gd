extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var let_go_interaction: InteractionArea = $"Let Go Interaction"
@onready var collision_shape_2d: CollisionShape2D = $"Let Go Interaction/CollisionShape2D"

var dialogue_count: int = 0

const PLAYER = preload("res://Scenes/player.tscn")
var player_instance: Player

func _ready() -> void:
	let_go_interaction.hide()
	collision_shape_2d.disabled = true
	
	if SaveManager.data["quests"]["bye"]["status"] == SaveManager.bye_status.END:
		dialogue_count = 2
	
	let_go_interaction.interact = Callable(self, "let_go")
	
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

func _process(delta: float) -> void:
	if dialogue_count == 0 and GlobalVariables.is_speaking == true:
		dialogue_count = 1
	
	if dialogue_count == 1 and GlobalVariables.is_speaking == false:
		dialogue_count = 2
	
	if dialogue_count == 2:
		you_can_let_go()


func you_can_let_go():
	let_go_interaction.show()
	collision_shape_2d.disabled = false


func let_go():
	SceneTransition.change_scene_dissolve("res://Scenes/Levels/lobby_house.tscn")
