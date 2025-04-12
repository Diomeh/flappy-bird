extends Area2D

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


func _on_body_entered(_body: Node2D) -> void:
	# Replay signal through signal bus
	SignalBus.player_hit.emit()
