extends CharacterBody2D


const SPEED = 700
const JUMP_VELOCITY = -800
@export var jumps =1
var e=0
var o=0
var p=0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and not jumps == e+1:
		velocity.y = JUMP_VELOCITY
		$jumpthing.play()
		e=e+1
		await get_tree().create_timer(0.3).timeout
		o=1

		velocity.y= JUMP_VELOCITY/1.4
		
	if is_on_floor():
		e=0
		if o == 1:
			velocity.y= JUMP_VELOCITY/1.4
			e=-1
			o=0
			p=1

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
	
