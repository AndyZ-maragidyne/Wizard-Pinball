extends Node2D

@onready var damageLabel = $DamageLabel
@onready var ballLabel = $BallLabel
@export var balls = 3
var damage = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	damageLabel.text = "Damage:\n" + str(damage) 
	ballLabel.text = "Balls:\n" + str(balls)
	pass

func increaseDamage(amount):
	damage += amount

func generateNewBall():
	if balls > 0:
		var ball_scene = preload("res://Ball.tscn")  # Update path to your Ball scene
		var new_ball = ball_scene.instantiate()  # Create a new instance
		get_parent().add_child(new_ball)  # Add it to the scene
		new_ball.global_position = Vector2(160, -540)
		balls -= 1
	pass



func _on_deadzone_body_entered(body: RigidBody2D) -> void:
	print("Entered")
	generateNewBall()
	pass # Replace with function body.
