extends Node2D

@onready var parallax_2d: Parallax2D = %Parallax2D
@onready var parallax_2d_2: Parallax2D = %Parallax2D2
@onready var parallax_2d_3: Parallax2D = %Parallax2D3

@export var _speed := 100.0

func _ready() -> void:
	SignalBus.player_hit.connect(_on_player_hit)

	self._set_parallax(self._speed)


func _set_parallax(speed: float) -> void:
	parallax_2d.autoscroll.x = speed * -1 * .5
	parallax_2d_2.autoscroll.x = speed * -1 * .75
	parallax_2d_3.autoscroll.x = speed * -1


func _on_player_hit() -> void:
	self._set_parallax(0)
