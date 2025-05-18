extends CharacterBody2D
class_name Wife

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction: InteractionArea = $"Interaction Area"

@export var fade_time : float  = 3.0

var is_fading : bool = false

var quest : Dictionary

func _ready() -> void:
	interaction.interact = Callable(self, "interact")
	#animation_player.play("idle")
	
	if (get_tree().current_scene.name == "LevelBeach"):
		quest = SaveManager.data["quests"]["beach"]
	
		if quest["status"] == SaveManager.beach_status.END:
			queue_free()
		
func interact():
	if (get_tree().current_scene.name == "LevelBeach"):
		beach_quest()

func shell_founded():
	quest["shells_found"] += 1

func _process(delta: float) -> void:
	if get_tree().current_scene.name == "LevelBeach":
		if quest["status"] != SaveManager.beach_status.END:
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
	if get_tree().current_scene.name == "LevelBeach":
		queue_free() 


func beach_quest():
	if quest["status"] == SaveManager.beach_status.START:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_BEFORE_SHELL)
		quest["status"] = SaveManager.beach_status.SEARCH_SHELLS
	elif quest["status"] == SaveManager.beach_status.SEARCH_SHELLS and quest["shells_found"] == 0:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_NO_SHELL)
	elif quest["status"] == SaveManager.beach_status.SEARCH_SHELLS and quest["shells_found"] == 1:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_1_SHELL)
	elif quest["status"] == SaveManager.beach_status.SEARCH_SHELLS and quest["shells_found"] == 2:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_2_SHELL)
	elif quest["status"] == SaveManager.beach_status.SEARCH_SHELLS and quest["shells_found"] == 3:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_HAVE_SHELL)
		SaveManager.data["quests"]["nb_finished"] += 1
		quest["status"] = SaveManager.beach_status.END
