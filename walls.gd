extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		
		var ball = body as RigidBody2D
		var direction = (ball.global_transform.origin - global_transform.origin).normalized()
		var force = 100

		ball.apply_impulse(direction * force)
	pass # Replace with function body.
