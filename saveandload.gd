extends Node

const save_data_path = "res://save_data.json"
var default_save_data = {
	highscore = 0
}

func save_data_to_file(save_data):
	var json_string = to_json(save_data)		#takes our save data and converts it into a json string
	var save_file = File.new()
	save_file.open(save_data_path, File.WRITE)		#open the file and write to it
	save_file.store_line(json_string)				#store into json string
	save_file.close()								#close the file

func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(save_data_path):		#if no save file then return default
		return default_save_data
	save_file.open(save_data_path, File.READ)				#open and read the data
	var save_data = parse_json(save_file.get_as_text())		#convert json to text 
	save_file.close()
	return save_data
