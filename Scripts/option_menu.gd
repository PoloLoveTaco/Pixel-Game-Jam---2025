extends CanvasLayer

@onready var global_volume: HSlider = $"Global Volume"
@onready var music_volume: HSlider = $"Music Volume"
@onready var sfx_volume: HSlider = $"SFX Volume"

var bus_index_1: int
var bus_index_2: int
var bus_index_3: int

func _ready() -> void:
	self.hide()
	bus_index_1 = AudioServer.get_bus_index("Master")
	bus_index_2 = AudioServer.get_bus_index("Music")
	bus_index_3 = AudioServer.get_bus_index("VFX")
	
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
