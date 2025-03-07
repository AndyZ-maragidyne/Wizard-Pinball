extends RigidBody2D

@export var speed: float = 500
var velocity;
var isDropped = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !isDropped:
		var direction = 0;
		if Input.is_action_pressed("ui_right"):
			direction = 1
			pass;
		if Input.is_action_pressed("ui_left"):
			direction = -1
			pass;
		if Input.is_action_pressed("Drop"):
			isDropped = true
			gravity_scale = 1
		linear_velocity.x = direction * speed
	
	pass
