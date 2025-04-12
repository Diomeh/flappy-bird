extends CharacterBody2D

@onready var _animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

@export var _jump_velocity = 200.0

var _state = States.ALIVE
enum States {
	ALIVE,
	DYING,
	DEAD,
}

func _ready() -> void:
	SignalBus.player_hit.connect(_on_player_hit)
	_animated_sprite_2d.animation_finished.connect(_on_animation_finished)


func _physics_process(delta: float) -> void:
	match _state:
		States.DYING:
			_die(delta)
		States.DEAD:
			return
		_:
			pass

	# Add the gravity.
	velocity += get_gravity() * delta

	# Handle jump.
	var jump_strength := Input.get_action_strength(&"jump")
	if (jump_strength):
		velocity.y = _jump_velocity * -1

	move_and_slide()


func _on_player_hit() -> void:
	_state = States.DYING


func _on_animation_finished() -> void:
	if _animated_sprite_2d.animation == "die":
		_state = States.DEAD


func _die(delta: float) -> void:
	if not _animated_sprite_2d.animation == "die":
		_animated_sprite_2d.animation = "die"

	var target_y := 90.0
	var distance := target_y - global_position.y
	var lerp_speed := 0.1

	velocity.y = lerp(velocity.y, distance / delta, lerp_speed)
