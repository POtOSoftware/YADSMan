extends Control

@onready var file_load_string: Node = $FileLoadEdit

var speaker_lines: Array[String]
var dialogue_lines: Array[String]
var specfunc_lines: Array[String]
var variable_names: Array
var variable_values: Array

func _on_load_button_pressed() -> void:
	YadsManager.load_yads_file_to_dictionary()
	
	speaker_lines = FileManager.load_speaker_lines_from_file(file_load_string.text)
	dialogue_lines = FileManager.load_dialogue_lines_from_file(file_load_string.text)
	specfunc_lines = FileManager.load_specfuncs_from_file(file_load_string.text)
	
	variable_names = FileManager.load_var_names_from_file(file_load_string.text)
	variable_values = FileManager.load_var_values_from_file(file_load_string.text)

func test_func() -> void:
	print("the test function has been called and executed :3")

func func_exit() -> void:
	get_tree().quit()
