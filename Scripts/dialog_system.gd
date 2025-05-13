extends CanvasLayer
class_name DialogSystem

@export var char_speed = 0.05
@export var blip_every = 2

var speaker_label : RichTextLabel
var text_label : RichTextLabel
@onready var bk: ColorRect = $Background


var blip_count = 0
var story_index = 0
var skip = false
var is_typing = false

var story = []

func set_text(tab) -> void:
	story = tab
	
func start() -> void:
	speaker_label = $Background/SpeakerLabel
	text_label = $Background/TextLabel
	GlobalVariables.is_speaking = true
	start_line()
	
func start_line() -> void:
	var line = story[story_index]
	var bb_speaker = "[b][color=%s]%s[/color][/b]" % [line.color, line.speaker]
	var bb_text = "%s" % [line.text]
	
	speaker_label.bbcode_text = bb_speaker
	text_label.bbcode_text = bb_text
	speaker_label.visible_characters = -1
	text_label.visible_characters = 0
	is_typing = true
	blip_count = 0
	type_line()  

func type_line() -> void:
	await type_line_async()
	
func type_line_async() -> void:
	var total := text_label.get_total_character_count()
	for i in range(total + 1):
		if skip:
			skip = false
			return
		text_label.visible_characters = i
		
		if blip_every > 0 and i % blip_every == 0 and i > 0:
			$Bop.play()
			pass
		await get_tree().create_timer(char_speed).timeout
	is_typing = false  

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if is_typing:
			text_label.visible_characters = -1
			skip = true
			is_typing = false
		else:
			story_index += 1
			if story_index < story.size():
				start_line()
			else:
				GlobalVariables.is_speaking = false
				queue_free()
