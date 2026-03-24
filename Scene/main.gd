extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	check_interact()
	
func check_interact():
	if len($Player/interactArea.get_overlapping_bodies()) > 2:
		$Control.visible=true
	elif len($Player/interactArea.get_overlapping_bodies()) == 2:
		if $Player/interactArea.get_overlapping_bodies()[1].name == "Wall":
			$Control.visible=false
		else:
			$Control.visible=true
	else:
		$Control.visible=false
