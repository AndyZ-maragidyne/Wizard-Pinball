extends Node2D

@onready var damageLabel = $DamageLabel
@onready var ballLabel = $BallLabel
@onready var moneyLabel = $MoneyLabel
@export var balls = 3
@export var coins = 0
var damage = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	damageLabel.text = "Damage:\n" + str(damage) 
	ballLabel.text = "Balls:\n" + str(balls)
	moneyLabel.text = "$" + str(coins)
	pass

func increaseDamage(amount):
	damage += amount

func increaseCoins(amount):
	coins += amount

func generateNewBall():
	if balls > 0:
		var ball_scene = preload("res://Ball.tscn")  # Update path to your Ball scene
		var new_ball = ball_scene.instantiate()  # Create a new instance
		get_parent().add_child(new_ball)  # Add it to the scene
		new_ball.global_position = Vector2(1250, 70)
		balls -= 1
	pass



func _on_deadzone_body_entered(body: RigidBody2D) -> void:
	print("Entered")
	generateNewBall()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	if coins >= 1:
		coins = coins - 1
		balls = balls + 1
	get_viewport().set_input_as_handled()
	$BallButton.release_focus()
	pass # Replace with function body.
