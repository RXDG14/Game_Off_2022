extends RigidBody2D

const Hiteffect = preload("res://scenes/hiteffect.tscn")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func create_hit_effect():
	var main = get_tree().current_scene
	var hiteffect = Hiteffect.instance()
	main.add_child(hiteffect)
	hiteffect.global_position = global_position
