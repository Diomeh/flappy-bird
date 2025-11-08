extends Node2D

@onready var _pipe_up: Node2D = %PipeUp
@onready var _pipe_down: Node2D = %PipeDown

@export var _min_height := 30.0
@export var _max_height := 240.0

var _height := 0.0
var current_speed := 0.0


func _process(delta: float) -> void:
	position.x -= current_speed * delta
	if position.x < -300:
		queue_free()


func reposition() -> void:
	# Pick a random height between pipe pairs
	_height = RandomNumberGenerator.new().randf_range(_min_height, _max_height)

	# Split height evenly
	_height /= 2

	# Offset each pipe by height
	_move_pipe(_pipe_up, true)
	_move_pipe(_pipe_down, false)


func _move_pipe(pipe: Node2D, up: bool) -> void:
	var target = Vector2(pipe.position)
	if up:
		target.y -= _height
	else:
		target.y += _height
	pipe.translate(target)
