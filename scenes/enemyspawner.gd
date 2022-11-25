extends Node2D

const Enemy = preload("res://scenes/enemy.tscn")

onready var spawnpoints = $spawnpoints

func get_spawn_position():
	var points = spawnpoints.get_children()		#get all children of spawnpositions
	points.shuffle()							#shuffle them
	return points[0].global_position			#choose the first one after shuffling as it would be random

func spawn_enemy():
	var spawn_position = get_spawn_position()
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_position


func _on_Timer_timeout():
	spawn_enemy()
