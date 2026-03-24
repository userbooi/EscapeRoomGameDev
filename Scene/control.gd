extends Control

func _ready() -> void:
	visible=false
	
func _process(delta: float) -> void:
	position = get_parent().get_node("Player").position
	
