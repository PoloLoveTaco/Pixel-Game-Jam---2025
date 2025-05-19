extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

@onready var fridge: InteractionArea = $Fridge
@onready var furnace: InteractionArea = $Furnace
@onready var bowl: InteractionArea = $Bowl

const PLAYER = preload("res://Scenes/player.tscn")

var quest : Dictionary

var player_instance

func _ready() -> void:
	quest = SaveManager.data["quests"]["kitchen"]
	
	fridge.action_name = "use"
	furnace.action_name = "use"
	fridge.interact = Callable(self, "use_fridge")
	furnace.interact = Callable(self, "use_furnace")
	bowl.interact = Callable(self, "use_bowl")
	
	if quest["status"] == SaveManager.kitchen_status.NOT_START:
		quest["status"] = SaveManager.kitchen_status.START
	
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

func use_fridge():
	Dialog.launch_dialog(Dialog.NN_FRIDGE)
	
func use_furnace():
	Dialog.launch_dialog(Dialog.NN_FURNACE)

func use_bowl():
	Dialog.launch_dialog(Dialog.NN_BOWL)
