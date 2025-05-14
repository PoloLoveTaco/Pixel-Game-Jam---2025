extends Node

@onready var dialog_system_scene: PackedScene = load("res://Scenes/dialog_system.tscn")

enum {
	INTRO = 0,
	FIRST_ACT_OFFICE = 1,
	CANT_LEAVE_HOUSE = 2,
	
}

# dialog template
	#"speaker" : "Speaker Name",
	#"color" : "gray",
	#"text" : "Text text text text",
	#"voice_path" : "res://Assets/Music/Path",
	#"start_sfx" : "res://Assets/Music/Path",
	#"end_sfx" : "res://Assets/Music/Path",

var dialogs = {
	INTRO : [
		{
			"speaker": "Cell phone",
			"color": "gray",
			"text": "[DRIiiIIiiNG].",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Adrien",
			"color": "gray",
			"text": "Hey bro, come a the bar close to the office, I am with Jules and Marie, we are goin to take a coffe before the weekend, come to join us !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Player",
			"color": "gray",
			"text": ". . . I'm tired, so . . ., maybe next time . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Cell phone",
			"color": "gray",
			"text": "[BIP].",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
	],
	FIRST_ACT_OFFICE : [
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "The office is close.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "I have to go home . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "Alone . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	CANT_LEAVE_HOUSE : [
		{
		"speaker" : "Player",
		"color" : "gray",
		"text" : "Mmmhhhh . . .",
		"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "I prefer stay here",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : ". . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	]
}

func launch_dialog(index):
	var dialog_system: DialogSystem = dialog_system_scene.instantiate()
	dialog_system.set_text(dialogs[index])
	get_tree().current_scene.add_child(dialog_system)
	dialog_system.start()
