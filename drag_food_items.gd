extends Sprite2D

var can_grab : bool;
var holding : bool;
var moving : bool;
var can_drop : bool;

var start_pos : Vector2;
var basket_pos : Vector2;


func _ready() -> void:
	start_pos = position; 


func _process(delta: float) -> void:
	#print(holding);
	controls();
	grab();

func grab():
	if(can_grab == true && holding == true && !Game.holding_item):
		moving = true;
		Game.holding_item = true;
	
	if(moving && Input.is_action_just_released("mouse_left")):
		moving = false;
		Game.holding_item = false;
		
	if(moving):
		position = get_global_mouse_position();
		
	if(can_drop && Input.is_action_just_released("mouse_left")):
		position = basket_pos;
	elif(!can_drop && Input.is_action_just_released("mouse_left")):
		position = start_pos; 
	
	boundaries();

func controls():
	if Input.is_action_pressed("mouse_left"):
		holding = true
	if Input.is_action_just_released("mouse_left"):
		holding = false

func boundaries():
	if(position.x < 620):
		position.x = 620; 
	
	if(position.x > 1100):
		position.x = 1100;
		
	if(position.y < 55):
		position.y = 55;
	
	if(position.y > 600):
		position.y = 600;



func _on_food_detection_mouse_entered() -> void:
	can_grab = true;


func _on_food_detection_mouse_exited() -> void:
	can_grab = false;


func _on_food_detection_area_entered(area: Area2D) -> void:
	if(area.name == "basket_detection"):
		can_drop = true;


func _on_food_detection_area_exited(area: Area2D) -> void:
	if(area.name == "basket_detection"):
		can_drop = false;
