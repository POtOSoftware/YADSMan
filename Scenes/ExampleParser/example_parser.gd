extends Control

@onready var file_load_string: Node = $FileLoadEdit

var speaker_lines: Array[String]
var dialogue_lines: Array[String]
var specfunc_lines: Array[String]

func _on_load_button_pressed() -> void:
	speaker_lines = FileManager.load_speaker_lines_from_file(file_load_string.text)
	dialogue_lines = FileManager.load_dialogue_lines_from_file(file_load_string.text)
	specfunc_lines = FileManager.load_specfuncs_from_file(file_load_string.text)
