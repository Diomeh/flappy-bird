extends Area2D


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		SignalBus.player_hit.emit()
