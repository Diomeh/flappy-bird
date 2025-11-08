extends Node

@onready var timer: Timer = %Timer

@export var _pipe_pair_scene: PackedScene
@export var _spawn_interval := 2.0
@export var _spanw_offset := 300.0

var _current_speed := 0.0


func _ready() -> void:
	timer.wait_time = _spawn_interval
	timer.start()

	SignalBus.world_speed_changed.connect(_on_world_speed_changed)


func _on_timer_timeout() -> void:
	_spawn()


func _on_world_speed_changed(speed: float) -> void:
	_current_speed = speed


func _spawn() ->void:
	if not _pipe_pair_scene:
		push_error("No pipe_pair_scene assigned!")
		return;

	# Instantiate scene
	var scene = _pipe_pair_scene.instantiate()
	add_child(scene)

	# Offset pipe
	scene.position.y = 256
	scene.position.x = 144 + _spanw_offset

	# Add pipe pair gap
	scene.reposition()

	# Make pipe pair move
	scene.current_speed = _current_speed
