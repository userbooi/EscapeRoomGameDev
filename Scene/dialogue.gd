extends Control

var name_to_text = {"six seven":"The Hostage Mouth is Shut",
					 "Bed":"It's a Bed",
					 "plant":"It's a Healthy Plant",
					 "table":"I Used to Eat at this Table"}

var special_text = ["The Hostage mumbles something about a plant",
					"This plant smells peculiar, there is a whiff of tables",
					"This table is not as it seems... the wood is rotten, turning soft, not so differnt to a mattress",
					"The softness of the bed reminds you of home. The hostages start singing, and you are lifted from this place"]

func _ready() -> void:
	visible=false
	
func _process(delta: float) -> void:
	var player_position = get_parent().get_node("Player").position
	position = Vector2(player_position.x - 1158, player_position.y-662)
	
	position.x = max(-1664, position.x)
	position.x = min(-519, position.x)
	
	position.y = max(-1405, position.y)
	position.y = min(231, position.y)

func set_text(name, specific_name, found, special_text_number):
	if found == false:
		if name == "TileMapLayer":
			if "table" in specific_name:
				$message.text = name_to_text["table"]
			elif "Bed" in specific_name:
				$message.text = name_to_text["Bed"]
			elif "plant" in specific_name:
				$message.text = name_to_text["plant"]
		else:
			$message.text = name_to_text["six seven"]
	else:
		$message.text = special_text[special_text_number-1]

func _on_button_pressed() -> void:
	visible=false
	get_parent().get_node("Player").movable=true
	get_parent().get_node("Player").found=false
