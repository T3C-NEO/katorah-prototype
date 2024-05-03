extends Node2D

var brown1
var brown2
var brown3
var brown4
var rng = RandomNumberGenerator.new()
var fills 
var num
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	brown1 = get_node("Brown")
	brown2 = get_node("Brown2")
	brown3 = get_node("Brown3")
	brown4 = get_node("Brown4")
	fills = [brown1, brown2, brown3, brown4]
	num = rng.randi_range(0, 3)
	for n in num:
		fills[n].visible = true
	num-=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	num+=1
	if num < fills.size():
		fills[num].visible = true
	else:
		get_node("Lose").visible = true


func _on_done_pressed() -> void:
	if num == 3:
		visible = false
		brown1.visible = false
		brown2.visible = false
		brown3.visible = false
		brown4.visible = false
		num = rng.randi_range(0, 3)
		for n in num:
			fills[n].visible = true
		num-=1
	else:
		get_node("Lose").visible = true
