extends Area3D


var direction := Vector3.FORWARD

@export var speed := 35.0
@export var damage := 25
# process vs physics_process functions - differ by logic vs physical simulation in game

func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group('enemy_area'):
		var enemy = area.get_parent()
		enemy.current_health -= damage
		queue_free()
