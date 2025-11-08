extends Node2D

@onready var back: Parallax2D = %Back
@onready var ground: Parallax2D = %Ground

var _current_speed := 0.0

func _ready() -> void:
	SignalBus.world_speed_changed.connect(_on_world_speed_changed)


func _process(delta: float) -> void:
	var offset := _current_speed * delta
	back.scroll_offset.x -= offset * .25
	ground.scroll_offset.x -= offset


func _on_world_speed_changed(speed: float) -> void:
	_current_speed = speed
