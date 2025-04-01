extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	# We'll always move to the right
	#velocity = Vector2.RIGHT * SPEED
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
