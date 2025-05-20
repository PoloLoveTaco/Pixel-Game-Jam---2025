extends Node

@onready var player: CharacterBody2D = $FridgePlayer

@onready var sp_left: Node2D = $SpawnLeft
@onready var sp_right: Node2D = $SpawnRight

@onready var foods_label: RichTextLabel = $FoodsLabel

const FOOD: PackedScene = preload("res://Scenes/MiniGames/food.tscn")
const TOTAL_FOOD : int = 20
const SPAWN_DELAY : float = 1.2

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var current_player_food: int = 0

func _ready() -> void:
	randomize()
	spawn_foods()

func spawn_foods() -> void:
	for _i in TOTAL_FOOD:
		var food = FOOD.instantiate()
		
		var t = randf()
		food.global_position = sp_left.global_position.lerp(sp_right.global_position, t)
		add_child(food)
		
		await get_tree().create_timer(SPAWN_DELAY).timeout

func player_take_food():
	current_player_food += 1
	audio.play()
	foods_label.text = str(current_player_food) + " / " + str(TOTAL_FOOD)
	if current_player_food >= TOTAL_FOOD:
		game_is_win()
	
func game_is_win():
	SaveManager.data["quests"]["kitchen"]["fridge"] = true
	SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.GO_BOWL
	get_tree().current_scene.quit_mini_game()
	queue_free()
	

func game_is_loosed():
	get_tree().current_scene.quit_mini_game()
	queue_free()


func _on_destroy_food_area_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Food"):
		area.get_parent().destroy()
		game_is_loosed()
