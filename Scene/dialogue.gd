extends Control

func _ready() -> void:
	visible=true
	
func _process(delta: float) -> void:
	var player_position = get_parent().get_node("Player").position
	position = Vector2(player_position.x - 1158, player_position.y-662)
	
