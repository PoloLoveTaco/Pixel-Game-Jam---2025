extends Node

@export_range(0, 1, 0.01)
var bw_amount : float = 0.0:
	set(value):
		bw_amount = clamp(value, 0.0, 1.0)
		RenderingServer.global_shader_parameter_set("bw_amount_global", bw_amount)
		
var is_speaking : bool = false

var is_in_cinematic : bool = false

var is_in_mini_game : bool = false

var saved_scene_name : String

var is_new_game : bool = true
