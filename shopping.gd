extends Node2D

@onready var food = $groceries;
@onready var food2 = $groceries2;
@onready var food3 = $groceries3;
@onready var food4 = $groceries4;
@onready var food5 = $groceries5;
@onready var food6 = $groceries6;
@onready var food7 = $groceries7;


func _ready() -> void:
	food.basket_pos = $basket.position;
	food2.basket_pos = $basket.position;
	food3.basket_pos = $basket.position;
	food4.basket_pos = $basket.position;
	food5.basket_pos = $basket.position;
	food6.basket_pos = $basket.position;
	food7.basket_pos = $basket.position;


func _process(delta: float) -> void:
	pass
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "food_detection"):
		pass


func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.name == "food_detection"):
		pass


func _on_button_pressed() -> void:
	visible = false;
