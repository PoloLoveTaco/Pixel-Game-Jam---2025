extends Node2D

var background: ColorRect

func _ready() -> void:
	hide()
	background = get_tree().current_scene.get_node("MiniGame/GamePlace/FridgeGame/Background")
	
func _process(delta: float) -> void:
	if self.global_position.y > background.global_position.y:
		show()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("FridgePlayer"):
		get_parent().player_take_food()
		queue_free()
	
func destroy():
	queue_free()
