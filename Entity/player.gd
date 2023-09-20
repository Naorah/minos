extends KinematicBody2D

var velocity = 200

var life
var max_life = 20

var inventory = {}

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	life = max_life
	pass # Replace with function body.

func get_input(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_down"):
		direction = Vector2.DOWN
	if Input.is_action_pressed("ui_up"):
		direction = Vector2.UP
	if Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	move_and_collide(direction * velocity * delta)

func _physics_process(delta):
	get_input(delta)
	
