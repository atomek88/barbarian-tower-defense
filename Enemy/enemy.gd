extends PathFollow3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var base = get_tree().get_first_node_in_group('base')
@onready var bank = get_tree().get_first_node_in_group('bank')

@export var gold_value := 10
@export var speed: float = 5.0
@export var max_health: int = 50
var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play('take_damage')
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_value
			queue_free()

func _ready() -> void:
	current_health = max_health
	# manipulate this to make whole game run faster
	#Engine.time_scale = 3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
		queue_free()

