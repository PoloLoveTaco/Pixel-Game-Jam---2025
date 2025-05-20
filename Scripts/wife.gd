extends CharacterBody2D
class_name Wife

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction: InteractionArea = $"Interaction Area"

@export var fade_time : float  = 3.0

var last_direction: String = "down"

var is_fading : bool = false

func _ready() -> void:
	interaction.interact = Callable(self, "interact")
	
	if (get_tree().current_scene.name == "LevelBeach"):	
		if SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.END:
			queue_free()
	
	elif (get_tree().current_scene.name == "Level_kitchen"):
		
		if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.END:
			queue_free()


func interact():
	if (get_tree().current_scene.name == "LobbyHouse"):
		house()
	elif (get_tree().current_scene.name == "LevelBeach"):
		beach_quest()
	elif (get_tree().current_scene.name == "Level_kitchen"):
		kitchen_quest()
	elif (get_tree().current_scene.name == "Final goodbye"):
		final_goodbye_interact()



func shell_founded():
	SaveManager.data["quests"]["beach"]["shells_found"] += 1


func _process(delta: float) -> void:
	if velocity.x > 0:
		animation_player.play("walk_right")
		last_direction = "right"
	elif velocity.x < 0:
		animation_player.play("walk_left")
		last_direction = "left"
	elif velocity.y > 0:
		animation_player.play("walk_down")
		last_direction = "down"
	elif velocity.y < 0:
		animation_player.play("walk_up")
		last_direction = "up"
	elif velocity.x == 0 and velocity.y == 0:
		animation_player.play("idle_"+last_direction)
	
	if get_tree().current_scene.name == "LevelBeach":
		if SaveManager.data["quests"]["beach"]["status"] != SaveManager.beach_status.END:
			return
		
		if get_tree().current_scene.get_node_or_null("DialogSystem") == null and not is_fading:
			start_fade_and_exit()
	elif get_tree().current_scene.name == "Level_kitchen":
		if SaveManager.data["quests"]["kitchen"]["status"] != SaveManager.kitchen_status.END:
			return
		
		if get_tree().current_scene.get_node_or_null("DialogSystem") == null and not is_fading:
			start_fade_and_exit()


func start_fade_and_exit() -> void:
	is_fading = true
	var tween : Tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, fade_time
	).set_trans(Tween.TRANS_QUAD
	).set_ease(Tween.EASE_OUT)
	tween.connect("finished", Callable(self, "on_fade_finished"))


func on_fade_finished() -> void:
	queue_free() 


func lobby_house_interact():
	print("meow")


func beach_quest():
	if SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.START:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_BEFORE_SHELL)
		SaveManager.data["quests"]["beach"]["status"] = SaveManager.beach_status.SEARCH_SHELLS
	elif SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.SEARCH_SHELLS and SaveManager.data["quests"]["beach"]["shells_found"] == 0:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_NO_SHELL)
	elif SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.SEARCH_SHELLS and SaveManager.data["quests"]["beach"]["shells_found"] == 1:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_1_SHELL)
	elif SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.SEARCH_SHELLS and SaveManager.data["quests"]["beach"]["shells_found"] == 2:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_2_SHELL)
	elif SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.SEARCH_SHELLS and SaveManager.data["quests"]["beach"]["shells_found"] == 3:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_HAVE_SHELL)
		SaveManager.data["quests"]["beach"]["finished"] = true
		SaveManager.data["quests"]["beach"]["status"] = SaveManager.beach_status.END


func kitchen_quest():
	if SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.START:
		Dialog.launch_dialog(Dialog.KITCHEN_WIFE_ASK_CAKE)
		SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.GO_FRIDGE
	elif SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_FRIDGE:
		Dialog.launch_dialog(Dialog.KITCHEN_WIFE_FRIDGE)
	elif SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_BOWL:
		Dialog.launch_dialog(Dialog.KITCHEN_WIFE_BOWL)
	elif SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.GO_FURNACE:
		Dialog.launch_dialog(Dialog.KITCHEN_WIFE_FURNACE)
	elif SaveManager.data["quests"]["kitchen"]["status"] == SaveManager.kitchen_status.END_FURNACE:
		Dialog.launch_dialog(Dialog.KITCHEN_WIFE_HAVE_CAKE)
		SaveManager.data["quests"]["kitchen"]["finished"] = true
		SaveManager.data["quests"]["kitchen"]["status"] = SaveManager.kitchen_status.END


func house():
	Dialog.launch_dialog(Dialog.WIFE);

func final_goodbye_interact():
	Dialog.launch_dialog(Dialog.FINAL_GOODBYE)
	SaveManager.data["quests"]["bye"]["finished"] = true
	SaveManager.data["quests"]["bye"]["status"] = SaveManager.bye_status.END
