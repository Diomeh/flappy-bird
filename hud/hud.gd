extends CanvasLayer

@onready var _score_container: HBoxContainer = %ScoreContainer
@onready var _get_read_sprite: TextureRect = %GetReadSprite
@onready var _game_over_sprite: TextureRect = %GameOverSprite
@onready var _start_button: Button = %StartButton
@onready var _restart_button: Button = %RestartButton

var _score := 0
var _digit_textures = {}


func _ready() -> void:
	SignalBus.player_scored.connect(_on_player_scored)

	# Load digit sprites
	for i in range(10):
		_digit_textures[str(i)] = load("res://assets/sprites/%d.png" % i)
	_show_start_screen()


# -------- State Control ---------
func _show_start_screen() -> void:
	_clear_score()
	_score_container.hide()
	_get_read_sprite.hide()
	_game_over_sprite.hide()
	_start_button.show()
	_restart_button.hide()


func _show_gameplay() -> void:
	_score_container.show()
	_get_read_sprite.show()
	_game_over_sprite.hide()
	_start_button.hide()
	_restart_button.hide()


func _show_game_over() -> void:
	_score_container.show()
	_get_read_sprite.hide()
	_game_over_sprite.show()
	_start_button.hide()
	_restart_button.show()


# -------- Score Management ---------
func _increment_score() -> void:
	_score += 1
	_update_score_display()


func _reset_score() -> void:
	_score = 0
	_update_score_display()


func _clear_score() -> void:
	for c in _score_container.get_children():
		c.queue_free()


func _update_score_display() -> void:
	_clear_score()

	for c in str(_score):
		var digit = Sprite2D.new()
		digit.texture = _digit_textures[c]
		_score_container.add_child(digit)


# -------- Signals ---------
func _on_start_button_pressed() -> void:
	SignalBus.game_started.emit()


func _on_restart_button_pressed() -> void:
	_clear_score()
	SignalBus.game_started.emit()


func _on_player_scored() -> void:
	_increment_score()


func _on_player_hit() -> void:
	_show_game_over()
