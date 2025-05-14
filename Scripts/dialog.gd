extends Node

@onready var dialog_system_scene: PackedScene = load("res://Scenes/dialog_system.tscn")

enum {
	FIRST_ACT_OFFICE = 0,
	CANT_LEAVE_HOUSE = 1,
}

var dialogs = {
	FIRST_ACT_OFFICE : [
		{
		"speaker" : "Player",
		"color" : "gray",
		"text" : "The office is close."
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "I have to go home..."
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "Alone..."
		}
	],
	CANT_LEAVE_HOUSE : [
		{
		"speaker" : "Player",
		"color" : "gray",
		"text" : "Mmmhhhh..."
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "I prefer stay here"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "....."
		}
	]
}

func launch_dialog(index):
	var dialog_system: DialogSystem = dialog_system_scene.instantiate()
	dialog_system.set_text(dialogs[index])
	get_tree().current_scene.add_child(dialog_system)
	dialog_system.start()
