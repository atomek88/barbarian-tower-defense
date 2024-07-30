extends Node3D
@export var enemy_path: Path3D
@export var difficulty_manager: Node
@export var turret: PackedScene

func build_turret(position: Vector3) -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.damage = difficulty_manager.get_damage()
	new_turret.enemy_path = enemy_path
	new_turret.global_position = position
