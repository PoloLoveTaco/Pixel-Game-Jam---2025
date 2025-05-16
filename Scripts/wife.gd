extends CharacterBody2D
class_name Wife

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction: InteractionArea = $"Interaction Area"

enum {
	START,
	SEARCH_SHELLS,
	HAVE_SHELLS,
	TMP
}

var shells_found = 0

var quest_status = START

func _ready() -> void:
	interaction.interact = Callable(self, "interact")
	animation_player.play("idle")
	
func interact():
	if (get_tree().current_scene.name == "LevelBeach"):
		beach_quest()

func shell_founded():
	print("Shell founded")
	shells_found += 1
		
func beach_quest():
	if quest_status == START:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_BEFORE_SHELL)
		quest_status = SEARCH_SHELLS
	elif quest_status == SEARCH_SHELLS and shells_found == 0:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_NO_SHELL)
	elif quest_status == SEARCH_SHELLS and shells_found == 1:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_1_SHELL)
	elif quest_status == SEARCH_SHELLS and shells_found == 2:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_2_SHELL)
	elif quest_status == SEARCH_SHELLS and shells_found == 3:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_HAVE_SHELL)
		quest_status = HAVE_SHELLS
	
