extends StaticBody2D

signal in_loot_range(chest_name)
signal out_loot_range

var opened = false
var content = {}
var chest_name

func _ready():
	chest_name = get_name()
	for i in get_tree().get_nodes_in_group("player"):
		i.connect('open_chest', self, "_open")
	$opened.visible = false
	$closed.visible = true

func _open(chest_name):
	if get_name() == chest_name:
		$opened.visible = true
		$closed.visible = false
		opened = true

func _on_Area2D_body_entered(body):
	emit_signal("in_loot_range", chest_name)

func _on_Area2D_body_exited(body):
	emit_signal("out_loot_range", chest_name)
