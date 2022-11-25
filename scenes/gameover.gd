extends Node

onready var highscorelabel = $highscorelabel 

func _ready():
	set_highscore_label()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/world.tscn")
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene("res://scenes/menu.tscn")


func set_highscore_label():
	var save_data = Saveandload.load_data_from_file()
	highscorelabel.text = "Highscore : " + str(save_data.highscore)
