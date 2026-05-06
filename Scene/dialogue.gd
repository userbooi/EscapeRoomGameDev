extends Control

var name_to_text = {"six seven":"The Hostage Mouth is Shut",
					 "Bed":"It's a Bed",
					 "plant":"It's a Healthy Plant",
					 "table":"I Used to Eat at this Table"}



func _ready() -> void:
	visible=false
	
func _process(delta: float) -> void:
	var player_position = get_parent().get_node("Player").position
	position = Vector2(player_position.x - 1158, player_position.y-662)
	
	position.x = max(-1664, position.x)
	position.x = min(-519, position.x)
	
	position.y = max(-1405, position.y)
	position.y = min(231, position.y)

func set_text(name, specific_name):
	if name == "TileMapLayer":
		if "table" in specific_name:
			$message.text = name_to_text["table"]
		elif "Bed" in specific_name:
			$message.text = name_to_text["Bed"]
		elif "plant" in specific_name:
			$message.text = name_to_text["plant"]
	else:
		$message.text = name_to_text["six seven"]

func _on_button_pressed() -> void:
	visible=false
	get_parent().get_node("Player").movable=true
