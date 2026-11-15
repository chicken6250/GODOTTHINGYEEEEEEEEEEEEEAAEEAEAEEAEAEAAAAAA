extends CharacterBody2D


const SPEED = 1200
const JUMP_VELOCITY = -900
@export var jumps = 1
var e=1

func _physics_process(delta: float) -> void:
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Handle jump.
    if Input.is_action_just_pressed("jump") and not jumps == e:
        velocity.y = JUMP_VELOCITY
        $jumpthing.play()
        e=e+1
    if is_on_floor():
        e=1


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
    
