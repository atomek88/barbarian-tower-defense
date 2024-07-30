extends Node3D

@onready var label_3d: Label3D = $Label3D

@export var max_health: int = 10
var current_health: int:
	set(health_in):
		current_health = health_in
		label_3d.set_text(str(current_health) + "/" + str(max_health))
		label_3d.modulate = lerp_colors(float(current_health) / float(max_health))
		if current_health < 1:
			get_tree().reload_current_scene()


func lerp_colors(change: float) -> Color:
	var red = Color.RED
	var white = Color.GHOST_WHITE
	var blended = red.lerp(white, change)
	return blended

func _ready() -> void:
	current_health = max_health
	# manipulate this to make whole game run faster
	#Engine.time_scale = 2


func take_damage() -> void:
	current_health -=  1


