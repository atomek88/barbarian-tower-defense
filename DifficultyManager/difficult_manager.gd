extends Node
signal stop_spawning_enemies
@export var game_length := 120.0
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve
@export var enemy_speed_curve: Curve
@export var damage_curve: Curve
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_length)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_enemy_health() -> float:
	return enemy_health_curve.sample(game_progress_ratio())

func get_enemy_speed() -> float:
	return enemy_speed_curve.sample(game_progress_ratio())

func get_damage() -> int:
	return damage_curve.sample(game_progress_ratio())


func _on_timer_timeout() -> void:
	stop_spawning_enemies.emit()
