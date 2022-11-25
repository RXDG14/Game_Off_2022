extends Node

var score = 0 setget set_score

onready var scorelabel = $Scorelabel

func set_score(value):
	score = value
	update_score_label()

func update_score_label():
	scorelabel.text = "Score = " + str(score)

func update_save_data():
	var save_data = Saveandload.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		Saveandload.save_data_to_file(save_data)

func _on_ship_death():
	update_save_data()
	yield(get_tree().create_timer(1),"timeout")		#use yield otherwise wont hear the effects
	get_tree().change_scene("res://scenes/gameover.tscn")
