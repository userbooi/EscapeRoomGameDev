extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.stop()
	else:
		$AnimatedSprite2D.play("Walking")
		
		if velocity.y == 0:
			if velocity.x > 0:
				rotation = -PI/2
			else:
				rotation = PI/2
		else:
			if velocity.y > 0:
				rotation = 0
			else:
				rotation = PI
		
		
		

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down") 
	
	if directionx:
		velocity.x = directionx
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directiony:
		velocity.y = directiony
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	velocity = velocity.normalized() * SPEED
	move_and_slide()
