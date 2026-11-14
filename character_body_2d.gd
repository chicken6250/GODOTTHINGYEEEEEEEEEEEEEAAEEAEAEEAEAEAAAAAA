extends CharacterBody2D


const SPEED = 1200
const JUMP_VELOCITY = -900


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jumpthing.play()
		
		await get_tree().create_timer(1.9).timeout
		velocity.y = JUMP_VELOCITY + 300
		await get_tree().create_timer(1.3).timeout
		velocity.y = JUMP_VELOCITY + 600


	if Input.is_action_just_pressed("fart"):
		$fart.play()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
