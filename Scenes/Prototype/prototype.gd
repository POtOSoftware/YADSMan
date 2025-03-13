extends Control

@onready var speaker_line_edit: Node = $VBoxContainer/SpeakerEdit/SpeakerEdit
@onready var dialogue_line_edit: Node = $VBoxContainer/Dialogue/DialogueEdit

func save_to_yads_file(_current_index: int = 0) -> void:
	print("ATTEMPTING TO SAVE YADS FILE AT INDEX " + str(_current_index))
	var yads_output = ConfigFile.new()
	
	yads_output.set_value(str(_current_index), "speaker", store_speaker_line())
	yads_output.set_value(str(_current_index), "line", store_dialogue_line())
	
	if yads_output.save("res://Test.yads") == OK:
		print("SUCCESSFULLY SAVED YADS FILE AT INDEX " + str(_current_index))
	else:
		print("FUCK!")

func load_from_yads_file(_file_path: String = "res://Test.yads") -> void:
	print("ATTEMPTING TO LOAD YADS FILE FROM " + _file_path)
	var yads_input = ConfigFile.new()
	if yads_input.load(_file_path) == OK:
		print("LOADED YADS FILE " + _file_path + ", GRABBING LINES")
	else:
		print("HOLY FUCK!")
	
	for dialogue_index in yads_input.get_sections():
		load_speaker_line(yads_input.get_value(dialogue_index, "speaker"))
		load_dialogue_line(yads_input.get_value(dialogue_index, "line"))

func store_speaker_line() -> String:
	var _stored_speaker_line: String = speaker_line_edit.text
	print("STORING SPEAKER LINE: " + _stored_speaker_line)
	
	return _stored_speaker_line

func store_dialogue_line() -> String:
	var _stored_dialogue_line: String = dialogue_line_edit.text
	print("STORING DIALOGUE LINE: " + _stored_dialogue_line)
	
	return _stored_dialogue_line

func load_speaker_line(_input_line: String) -> void:
	print("LOADING SPEAKER LINE: " + _input_line)
	speaker_line_edit.text = _input_line

func load_dialogue_line(_input_line: String) -> void:
	print("LOADING DIALOGUE LINE: " + _input_line)
	dialogue_line_edit.text = _input_line

func _on_save_button_pressed() -> void:
	save_to_yads_file(0)

func _on_load_button_pressed() -> void:
	load_from_yads_file("res://Test.yads")
