extends CanvasLayer

@export var char_speed = 0.05
@export var blip_every = 2

@onready var rtl : RichTextLabel = $RichTextLabel

var full_text = ""
var is_typing = false
var blip_count = 0
var story_index = 0
var skip = false

var story = [
	{
		"speaker": "Cell phone",
		"color": "gray",
		"text": "[DRIiiIIiiNG]",
	},
	{
		"speaker": "Adrien",
		"color": "gray",
		"text": "Hey bro, come a the bar close to the office, I am with Jules and Marie, we are goind to take a coffe before the weekend, come to join us !",
	},
	{
		"speaker": "Player",
		"color": "gray",
		"text": ". . . I'm tired, so . . ., maybe next time . . .",
	},
	{
		"speaker": "Cell phone",
		"color": "gray",
		"text": "[BIP].",
	},
]

func _ready():
	rtl.bbcode_enabled = true
	start_line() 

func start_line() -> void:
	var line = story[story_index]
	var bb = "[b][color=%s]%s[/color][/b]:\n%s" % [line.color, line.speaker, line.text]
	rtl.bbcode_text = bb
	rtl.visible_characters = 0
	is_typing = true
	blip_count = 0
	type_line()  

func type_line() -> void:
	await type_line_async()
	
func type_line_async() -> void:
	var total := rtl.get_total_character_count()
	for i in range(total + 1):
		if skip:
			skip = false
			return
		rtl.visible_characters = i
		if blip_every > 0 and i % blip_every == 0 and i > 0:
			# $"../Blip".play()
			pass
		await get_tree().create_timer(char_speed).timeout
	is_typing = false  

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if is_typing:
			rtl.visible_characters = -1
			skip = true
			is_typing = false
		else:
			story_index += 1
			if story_index < story.size():
				start_line()
			else:
				get_tree().change_scene_to_file("res://Scenes/Levels/first_act.tscn")
