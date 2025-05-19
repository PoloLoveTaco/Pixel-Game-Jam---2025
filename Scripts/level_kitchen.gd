extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

@onready var fridge: InteractionArea = $Fridge
@onready var furnace: InteractionArea = $Furnace
@onready var bowl: InteractionArea = $Bowl

@onready var mini_game: CanvasLayer = $MiniGame
@onready var animation_player_minigame: AnimationPlayer = $MiniGame/AnimationPlayer

@onready var game_place: Node = $MiniGame/GamePlace

@onready var spawn_cake: Node2D = $SpawnCake

const PLAYER = preload("res://Scenes/player.tscn")
const CAKE = preload("res://Scenes/leave_cake.tscn")

const FRIDGE_GAME = preload("res://Scenes/MiniGames/fridge_game.tscn")
const BOWL_GAME = preload("res://Scenes/MiniGames/bowl_game.tscn")
const FURNACE_GAME = preload("res://Scenes/MiniGames/furnace_game.tscn")

var player_instance
var cake_spawned = false

func _ready() -> void:
	fridge.action_name = "use"
	furnace.action_name = "use"
	fridge.interact = Callable(self, "use_fridge")
	furnace.interact = Callable(self, "use_furnace")
	bowl.interact = Callable(self, "use_bowl")
	
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.NOT_START:
		SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.START
	
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
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.END and not cake_spawned:
		cake_spawned = true
		var cake: Node2D = CAKE.instantiate()
		cake.global_position = spawn_cake.global_position
		add_child(cake)

func use_fridge():
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_FRIDGE and not GlobalVariables.is_in_mini_game:
		launch_mini_game()
		var fg = FRIDGE_GAME.instantiate()
		game_place.add_child(fg)
	elif not GlobalVariables.is_in_mini_game:
		Dialog.launch_dialog(Dialog.NN_FRIDGE)
	
func use_furnace():
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_FURNACE and not GlobalVariables.is_in_mini_game:
		var fg = FURNACE_GAME.instantiate()
		game_place.add_child(fg)
		launch_mini_game()
	elif not GlobalVariables.is_in_mini_game:
		Dialog.launch_dialog(Dialog.NN_FURNACE)

func use_bowl():
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_BOWL and not GlobalVariables.is_in_mini_game:
		var fg = BOWL_GAME.instantiate()
		game_place.add_child(fg)
		launch_mini_game()
	elif not GlobalVariables.is_in_mini_game:
		Dialog.launch_dialog(Dialog.NN_BOWL)
	

func launch_mini_game():
	mini_game.show()
	GlobalVariables.is_in_mini_game = true
	animation_player_minigame.play("launch_mini_game")
	await animation_player_minigame.animation_finished

func quit_mini_game():
	animation_player_minigame.play("quit_mini_game")
	GlobalVariables.is_in_mini_game = false
	await animation_player_minigame.animation_finished
	mini_game.hide()
