extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$opened.visible = false
	$closed.visible = true

func _on_KinematicBody2D_chest_opened():
	$opened.visible = true
	$closed.visible = false
