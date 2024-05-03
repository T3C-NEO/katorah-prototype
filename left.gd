extends Node2D

var baby
var work
var games
var curren
var num
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	baby  = get_node("baby changing station")
	work  = get_node("work")
	games = [baby, work]
	num = rng.randi_range(0, 1)
	games[num].visible = true
	curren = num


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if baby.visible == false and work.visible == false:
		while num == curren:
			num = rng.randi_range(0, 1)
		curren = num
		games[num].visible = true
		
