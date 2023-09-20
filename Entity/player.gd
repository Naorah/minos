extends KinematicBody2D

signal open_chest(chest_name)

var velocity = 200
var life
var max_life = 20
var inventory = {}

var chest
var in_chest_range
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_tree().get_nodes_in_group("lootChests"):
		i.connect('in_loot_range', self, "_in_chest_range")
		i.connect('out_loot_range', self, "_out_chest_range")
		print('linked')
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
	if in_chest_range == true and Input.is_action_pressed("ui_interract"):
		emit_signal("open_chest", chest)
	move_and_collide(direction * velocity * delta)

func _physics_process(delta):
	get_input(delta)

func _in_chest_range(chest_name):
	chest = chest_name
	in_chest_range = true
	
func _out_chest_range(chest_name):
	chest = ""
	in_chest_range = false
