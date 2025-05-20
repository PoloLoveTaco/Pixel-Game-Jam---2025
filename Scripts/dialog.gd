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
	WIFE,
	
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
			"color": "orange",
			"text": "Hey bro !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "orange",
			"text": "Come at the usual bar close to the office.",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "orange",
			"text": "I am with Jules and Marie.",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker": "Adrien",
			"color": "orange",
			"text": "Our usual Friday Coffee !",
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
			"color": "orange",
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
			"text" : "I prefer to stay here",
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
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "The weather is very nice...",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "...isn't it ?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I remember this place, this weather, even the smell of the sand like it was yesterday.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "There is still so many pretty shells . . . I remember you offered me to search for every single one of them and gift them to me.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Do you think you can find [color=cyan]3 shells[/color] for me?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_NO_SHELL : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Did you find them ?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "The [color=cyan]3 shells[/color]?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Maybe search under the rocks !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_1_SHELL : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Oh [color=cyan]1 shell[/color]!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Just 2 more . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		}
	],
	BEACH_WIFE_2_SHELL : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Oh [color=cyan]2 shells[/color]!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
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
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Oh my love ! Thank you so much !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "They are so beautiful ! I will keep them forever !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Thank you again !",
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
			"text" : "It seems someone already opened it . . . and closed it again.",
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
			"text" : "No, I should stay here.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I have to go to the coffee shop.",
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
			"text" : "I have to go to the coffee shop.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "The café is on the other side of the road.",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	SECOND_OFFICE : [
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Mr.Ector seems to really like the office.",
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
			"text" : "The coffee shop. . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "They are probably waiting for me.",
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
			"text" : "Just a bit further south . . .",
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
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Do you remenber?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Our first cake in our kitchen.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "We had a lot of fun.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I wish I had the chance to . . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "to make one last cake.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Can you [color=orange]make a cake[/color] my love ?",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_FRIDGE : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "To [color=orange]make a cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Start by getting what you need in the [color=blue]fridge[/color]",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_BOWL : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Now to make the [color=orange]cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "use the [color=brown]bowl[/color] on the table.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_FURNACE : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Now to cook the [color=orange]cake[/color], ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "use the [color=red]furnace[/color].",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	KITCHEN_WIFE_HAVE_CAKE : [
		{
			"speaker" : "System",
			"color" : "green",
			"text" : "You give the [color=orange]cake[/color] to your wife.",
			"voice_path" : "res://Assets/Music/SE_bop_wife_old.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Oh!",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Thank you my love !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "That was our last cake together. It was delicious, I will remember it forever.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Good bye [color=red]<3[/color]",
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
			"text" : "I should not use it now.",
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
			"text" : "I should not use it now.",
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
			"text" : "I should not use it now.",
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
			"text": "911, what's your emergency ?",
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
			"text": "We are on a boat !",
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
			"text": "SHE FELL OVER THE EDGE !!",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker": "Emergencies",
			"color": "red",
			"text": "Please, give us your location. We'll be here right away !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
	],
	
	FINAL_GOODBYE : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Nemo. . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "My love. . .",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "We wrote a beautiful story.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Surely with up and downs, but a beautiful one.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I will never stop loving you. ",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I will have to stay here for a while.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Go meet people, live your life and be happy.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "That's all I want, your happiness...",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "Honey I-",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Nemo !",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I will always be with you.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Nemo",
			"color" : "gray",
			"text" : "I love you. . .",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "I know.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	],
	
	CAFFEE_1 : [
		{
			"speaker" : "Adrien",
			"color" : "orange",
			"text" : "Nemo ??",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
		},
		{
			"speaker" : "Adrien",
			"color" : "orange",
			"text" : "Come here !",
			"voice_path" : "res://Assets/Music/SE_bop_adrien.wav"
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
			"text" : "Grab a drink and join us !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Marie",
			"color" : "blue",
			"text" : "We were watching Mr.Ector's video, he designed a new building !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		},
		{
			"speaker" : "Marie",
			"color" : "blue",
			"text" : "Pretty funny, come on ! Watch with us !",
			"voice_path" : "res://Assets/Music/SE_bop.wav"
		}
	],
	WIFE : [
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "Try checking the objects in the house,",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
		{
			"speaker" : "Vanessa",
			"color" : "pink",
			"text" : "you might remember something.",
			"voice_path" : "res://Assets/Music/SE_bop_wife.wav"
		},
	]
}

func launch_dialog(index):
	var dialog_system: DialogSystem = dialog_system_scene.instantiate()
	dialog_system.set_text(dialogs[index])
	get_tree().current_scene.add_child(dialog_system)
	dialog_system.start()
