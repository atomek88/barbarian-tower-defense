extends MarginContainer
@onready var label: Label = $Label
@onready var time_label: Label = $TimeLabel
@onready var difficult_manager: Node = $"../DifficultManager"

@export var starting_gold := 130
var gold: int:
	set(gold_in):
		gold = max(gold_in, 0)
		label.set_text("Gold: "+ str(gold))

@export var starting_time := 120.0
var time: float:
	set(time_in):
		time = round(time_in)
		time_label.set_text("Time: "+ str(time))

func _ready() -> void:
	gold = starting_gold
	time = starting_time

func _process(_delta: float) -> void:
	time = difficult_manager.timer.time_left
