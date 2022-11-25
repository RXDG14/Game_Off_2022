extends Node



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/world.tscn")


func _on_exit_pressed():
	get_tree().quit()
