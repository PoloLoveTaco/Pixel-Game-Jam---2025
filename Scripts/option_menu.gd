extends CanvasLayer

@onready var global_volume: HSlider = $"Global Volume"
@onready var music_volume: HSlider = $"Music Volume"
@onready var sfx_volume: HSlider = $"SFX Volume"

@onready var all_buttons: BoxContainer = $AllButtons
@onready var save_button: Button = $AllButtons/SaveButton
@onready var main_menu: Button = $AllButtons/GoToMainButton
@onready var quit_button: Button = $AllButtons/QuitButton
@onready var back_button: Button = $BackButton

@onready var js_ok: bool = Engine.has_singleton("JavaScriptBridge")

var bus_index_1: int
var bus_index_2: int
var bus_index_3: int

func _ready() -> void:
	self.hide()
	if (get_tree().current_scene.name == "MainMenu"):
		all_buttons.hide()
	else:
		back_button.hide()
	bus_index_1 = AudioServer.get_bus_index("Master")
	bus_index_2 = AudioServer.get_bus_index("Music")
	bus_index_3 = AudioServer.get_bus_index("Sound Effect")
	
	global_volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index_1))
	music_volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index_2))
	sfx_volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index_3))



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if self.visible:
			self.hide()
		elif !self.visible:
			self.show()


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_global_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index_1, linear_to_db(value))

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index_2, linear_to_db(value))


func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index_3, linear_to_db(value))

func _on_back_button_pressed() -> void:
	self.hide()

func _on_go_to_main_button_pressed() -> void:
	SaveManager.save_game()
	SceneTransition.change_scene_dissolve("res://Scenes/Menus/main_menu.tscn")

func _on_save_button_pressed() -> void:
	SaveManager.save_game()

func _on_quit_button_pressed() -> void:
	SaveManager.save_game()
	get_tree().quit()
	if js_ok:
		JavaScriptBridge.eval("""
			(function () {
				try {
					if (window.close && window.self === window.top)
						window.close();
				} catch(e) { /* ignore */ }
				if (document.referrer)
					window.top.location.href = document.referrer;
				else
					window.top.location.href = 'https://itch.io';
			})();
		""")
