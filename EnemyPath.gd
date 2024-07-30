extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node
@export var victory_layer: CanvasLayer
@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.max_health = difficulty_manager.get_enemy_health()
	enemy.speed = difficulty_manager.get_enemy_speed()
	add_child(enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()
	enemy.tree_exited.connect(enemy_defeated)


func _on_difficult_manager_stop_spawning_enemies() -> void:
	# timer responsible for spawning enemies
	timer.stop()

func enemy_defeated() -> void:
	if timer.is_stopped():
		for child in get_children():
			if child is PathFollow3D:
				return
		victory_layer.victory()
