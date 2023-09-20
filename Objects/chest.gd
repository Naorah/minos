extends StaticBody2D

func _ready():
	$opened.visible = false
	$closed.visible = true

func _on_KinematicBody2D_chest_opened():
	$opened.visible = true
	$closed.visible = false
