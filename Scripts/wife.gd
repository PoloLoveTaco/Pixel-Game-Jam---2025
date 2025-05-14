extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction: InteractionArea = $"Interaction Area"

enum {
	START,
	SEARCH_SHELL,
	HAVE_SHELL
}

var quest_status = START

func _ready() -> void:
	interaction.interact = Callable(self, "interact")
	animation_player.play("idle")
	
func interact():
	if (get_tree().current_scene.name == "LevelBeach"):
		beach_quest()

func beach_quest():
	if quest_status == START:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_BEFORE_SHELL)
		quest_status = SEARCH_SHELL
	elif quest_status == SEARCH_SHELL:
		Dialog.launch_dialog(Dialog.BEACH_WIFE_NO_SHELL)
	
