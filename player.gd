extends CharacterBody2D


@export var _speed = 300.0
@export var _jump_velocity = -400.0


func _ready() -> void:
	# We'll always move to the right
	velocity = Vector2.RIGHT * _speed


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = _jump_velocity

	move_and_slide()
