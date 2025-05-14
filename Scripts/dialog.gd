extends Node

@onready var dialog_system_scene: PackedScene = load("res://Scenes/dialog_system.tscn")

enum {
	WORK_IN_PROGRESS = 10000,
	INTRO = 0,
	FIRST_ACT_OFFICE = 1,
	CANT_LEAVE_HOUSE = 2,
	BEACH_WIFE_BEFORE_SHELL = 3,
	BEACH_WIFE_NO_SHELL = 4,
	BEACH_WIFE_HAVE_SHELL = 5,
	BEAUTIFULL_SHELL = 6
}

# dialog template
	#"speaker" : "Speaker Name",
	#"color" : "gray",
	#"text" : "Text text text text",
	#"voice_path" : "res://Assets/Music/Path",
	#"start_sfx" : "res://Assets/Music/Path",
	#"end_sfx" : "res://Assets/Music/Path",

var dialogs = {
	WORK_IN_PROGRESS : [
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "Work in progress . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "Francois le petit coquain",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "Ehhhh",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "Tu me fais rougir",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "MOUUUAH !",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker": "SYSTEM",
			"color": "green",
			"text": "[KISS] sur le bou",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		}
	],
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
			"text": "Hey bro !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "gray",
			"text": "Come a the bar close to the office.",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "gray",
			"text": "I am with Jules and Marie.",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "gray",
			"text": "Friday coffee !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Player",
			"color": "gray",
			"text": ". . . I'm tired, so . . ., maybe next time . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Adrien",
			"color": "gray",
			"text": "Come on man . . .",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Player",
			"color": "gray",
			"text": "Maybe next week.",
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
			"text" : "The office is closed.",
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
	],
	BEACH_WIFE_BEFORE_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "The weather is nice.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Don't you think so?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I remember it like it was yesterday.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "This pretty shell . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Do you think you can find the same one for me?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_NO_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Do you found it ?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Oh noo . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_HAVE_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Oh my love !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "It's so beautifull!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Thank you !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEAUTIFULL_SHELL : [
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "It's beautifull",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Player",
			"color" : "gray",
			"text" : "That's remain me something",
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
