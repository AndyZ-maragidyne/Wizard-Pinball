extends RigidBody2D

@export var speed: float = 500
@export var rotation_speed: float = 2.0
var velocity;
var isDropped = false
var isRotated = false
var launchDirection: Vector2 = Vector2(0, 1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var isAiming = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if !isRotated:
		var direction = 0;
		if Input.is_action_pressed("ui_right"):
			direction = 1
			pass;
		if Input.is_action_pressed("ui_left"):
			direction = -1
			pass;
		
			
		if Input.is_action_pressed("Drop"):
			isRotated = true
			gravity_scale = 1
			linear_velocity = launchDirection * speed
			$Line2D.hide()
			return
		linear_velocity.x = direction * speed
		if Input.is_action_pressed("rotate_right"):
			launchDirection = launchDirection.rotated(-rotation_speed * delta)
			pass;
		if Input.is_action_pressed("rotate_left"):
			launchDirection = launchDirection.rotated(rotation_speed * delta)
			pass;
		$Line2D.points[1] = launchDirection * 50
		
		pass
	pass
