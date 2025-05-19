extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

@onready var fridge: InteractionArea = $Fridge
@onready var furnace: InteractionArea = $Furnace
@onready var bowl: InteractionArea = $Bowl

@onready var mini_game: CanvasLayer = $MiniGame
@onready var animation_player_minigame: AnimationPlayer = $MiniGame/AnimationPlayer

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
	
	mini_game.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("display stats"):
		if mini_game.visible == false:
			launch_mini_game()
		else:
			quit_mini_game()

func use_fridge():
	Dialog.launch_dialog(Dialog.NN_FRIDGE)
	
func use_furnace():
	Dialog.launch_dialog(Dialog.NN_FURNACE)

func use_bowl():
	Dialog.launch_dialog(Dialog.NN_BOWL)

func launch_mini_game():
	mini_game.show()
	animation_player_minigame.play("launch_mini_game")
	await animation_player_minigame.animation_finished

func quit_mini_game():
	animation_player_minigame.play("quit_mini_game")
	await animation_player_minigame.animation_finished
	mini_game.hide()
