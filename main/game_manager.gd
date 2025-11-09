extends Node

@export var _speed_scale := 1.0
@export var _world_speed := 100.0


func _ready() -> void:
	SignalBus.player_hit.connect(_on_player_hit)
	SignalBus.world_speed_changed.emit(get_effective_speed())


func speed_up(amount: float) -> void:
	_world_speed += amount
	SignalBus.world_speed_changed.emit(get_effective_speed())


func set_speed(amount: float) -> void:
	_world_speed = amount
	SignalBus.world_speed_changed.emit(get_effective_speed())


func get_effective_speed() -> float:
	return _world_speed * _speed_scale


func _on_player_hit() -> void:
	pass
