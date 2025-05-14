extends CanvasLayer

@export var char_speed = 0.04
@export var blip_every = 2

@onready var rtl : RichTextLabel = $RichTextLabel
@onready var voice: AudioStreamPlayer = $Voice

var full_text = ""
var is_typing = false
var blip_count = 0
var story_index = 0
var skip = false

var story = Dialog.dialogs[Dialog.INTRO]

func _ready():
	rtl.bbcode_enabled = true
	start_line() 

func start_line() -> void:
	var line = story[story_index]
	var bb = "[b][color=%s]%s[/color][/b]:\n%s" % [line.color, line.speaker, line.text]
	
	if line["voice_path"]:
		var sfx : AudioStream = load(line["voice_path"])
		voice.stream = sfx
	
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
			$Voice.play()
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
