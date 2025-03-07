extends StaticBody2D

@onready var manager = get_node("/root/Node2D/Manager")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body) -> void:
	if body is RigidBody2D:
		manager.increaseDamage(10)
		queue_free()
	pass # Replace with function body.
