extends Node

@onready var dialog_system_scene: PackedScene = load("res://Scenes/dialog_system.tscn")

enum {
	# City
	INTRO,
	FIRST_ACT_OFFICE,
	HOUSE_END_ACT,
	OFFICE_END_ACT,
	SECOND_OFFICE,
	COFFEE_FIRST_ACT,
	HECTOR_HOUSE,
	
	# Beach
	BEACH_WIFE_BEFORE_SHELL,
	BEACH_WIFE_NO_SHELL,
	BEACH_WIFE_1_SHELL,
	BEACH_WIFE_2_SHELL,
	BEACH_WIFE_HAVE_SHELL,
	LAZY_ROCK,
	
	# House
	BABY_BOX,
	CANT_LEAVE_HOUSE,
	PHONE,
	
	# Kitchen
	KITCHEN_WIFE_ASK_CAKE,
	KITCHEN_WIFE_FRIDGE,
	KITCHEN_WIFE_BOWL,
	KITCHEN_WIFE_FURNACE,
	KITCHEN_WIFE_HAVE_CAKE,
	NN_FURNACE,
	NN_FRIDGE,
	NN_BOWL,
	
	#END
	FINAL_GOODBYE,
	
	#CAFFEE
	CAFFEE_1,
	CAFFEE_2
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
			"speaker": "Nemo",
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
			"speaker": "Nemo",
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
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The office is closed.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I have to go home . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Alone . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	CANT_LEAVE_HOUSE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Mmmhhhh . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I prefer stay here",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
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
			"text" : "There pretty shells . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Do you think you can find  [color=cyan]3 shells[/color] for me?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_NO_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Do you found them ?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "The [color=cyan]3 shells[/color]?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Maybe search under the rocks.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_1_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Oh [color=cyan]1 shell[/color]!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Just 2 more . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_2_SHELL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Oh [color=cyan]2 shells[/color]!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Just 1 more . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_HAVE_SHELL : [
		{
			"speaker" : "System",
			"color" : "green",
			"text" : "You give the [color=cyan]3 shells[/color].",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
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
	LAZY_ROCK : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "A rock . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I could push it . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "But I'm lazy . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	BABY_BOX : [
		{
			"speaker" : "System",
			"color" : "green",
			"text" : "This is the box for a baby bed.",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker" : "System",
			"color" : "green",
			"text" : "It seems someone has already opened it . . . and closed it.",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : ". . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	HOUSE_END_ACT : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "No, I must not go back.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I have to go to the coffe.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	OFFICE_END_ACT : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The office is closed.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I have to go to the coffe.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "It is on the other side of the road.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	SECOND_OFFICE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Mr.Ector seems to really like the office",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "He built the exact same one. . . but in yellow.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
	],
	COFFEE_FIRST_ACT : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The coffee . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "They probably wait for me",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : ". . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I will go to my house.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Just under . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	HECTOR_HOUSE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Oh, Mr.Ector's house.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "These shapes remind me of something. . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
	],
	KITCHEN_WIFE_ASK_CAKE : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Do you remenber?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Our first cake in our kitchen.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "We had a lot of fun.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I wish I had the chance to . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "to make one last cake.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Can you [color=orange]make a cake[/color] my love?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_FRIDGE : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "To [color=orange]make a cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Start by get what you need in the [color=blue]fridge[/color]",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_BOWL : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Now to make the [color=orange]cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "use the [color=brown]bowl[/color] on the table.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_FURNACE : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Now to cook the [color=orange]cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "use the [color=red]furnace[/color].",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_HAVE_CAKE : [
		{
			"speaker" : "System",
			"color" : "green",
			"text" : "You give the [color=orange]cake[/color].",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Oh!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Thank you my love!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "That was our last cake together.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "bye [color=red]<3[/color]",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	NN_FRIDGE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The fridge, ",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Not for the moment.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	NN_FURNACE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The furnace, ",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Not for the moment.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	NN_BOWL : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "A bowl, ",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Not for the moment.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	PHONE : [
		{
			"speaker": "Nemo",
			"color": "gray",
			"text": "Please, please, please, . . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Emergencies",
			"color": "red",
			"text": "Here, I listen to the emergency services?",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Nemo",
			"color": "gray",
			"text": "It's my wife !!!",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Nemo",
			"color": "gray",
			"text": "We were on the boat !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Nemo",
			"color": "gray",
			"text": "There is a storm !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Nemo",
			"color": "gray",
			"text": "She fell over the edge !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Emergencies",
			"color": "red",
			"text": "Give us your location, we'll be right there!",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
	],
	
	FINAL_GOODBYE : [
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Nemo. . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "My love. . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "We write a beautiful story.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Surely with down and up, but a beatiful one.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I never stop loving you.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I will stay here for a while.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Go meet people, live your life and be happy.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "That's all i want.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Honey I-",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "Nemo !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I will allways be with you.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I love you. . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Wife",
			"color" : "pink",
			"text" : "I know.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	
	CAFFEE_1 : [
		{
			"speaker" : "Adrien",
			"color" : "pink",
			"text" : "Nemo ??",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Adrien",
			"color" : "pink",
			"text" : "Come here !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	CAFFEE_2 : [
		{
			"speaker" : "Jules",
			"color" : "green",
			"text" : "Good to see you man.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Jules",
			"color" : "green",
			"text" : "Grab a drink and join us.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Marie",
			"color" : "blue",
			"text" : "We was watching Mr.Ector video when he design the new building.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Marie",
			"color" : "blue",
			"text" : "Pretty funny.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
}

func launch_dialog(index):
	var dialog_system: DialogSystem = dialog_system_scene.instantiate()
	dialog_system.set_text(dialogs[index])
	get_tree().current_scene.add_child(dialog_system)
	dialog_system.start()
