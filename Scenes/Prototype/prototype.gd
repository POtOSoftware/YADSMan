extends Control

@onready var speaker_line_edit: Node = $VBoxContainer/SpeakerEdit/SpeakerEdit
@onready var dialogue_line_edit: Node = $VBoxContainer/Dialogue/DialogueEdit
@onready var dialogue_index_container: Node = $ScrollContainer/VBoxContainer

func _ready() -> void:
	# give the global manager script the scenes vbox container so it can add children to it
	GlobalManager.line_editor_container = self.dialogue_index_container

func _exit_tree() -> void:
	GlobalManager.line_editor_container = null

#func save_to_yads_file(_current_index: int = 0) -> void:
#	print("ATTEMPTING TO SAVE YADS FILE AT INDEX " + str(_current_index))
#	var yads_output = ConfigFile.new()
#	
#	yads_output.set_value(str(_current_index), "speaker", store_speaker_line())
#	yads_output.set_value(str(_current_index), "line", store_dialogue_line())
#	
#	if yads_output.save("res://Test.yads") == OK:
#		print("SUCCESSFULLY SAVED YADS FILE AT INDEX " + str(_current_index))
#	else:
#		print("FUCK!")

#func load_from_yads_file(_file_path: String = "res://Test.yads") -> void:
#	print("ATTEMPTING TO LOAD YADS FILE FROM " + _file_path)
#	var yads_input = ConfigFile.new()
#	if yads_input.load(_file_path) == OK:
#		print("LOADED YADS FILE " + _file_path + ", GRABBING LINES")
#	else:
#		print("HOLY FUCK!")
#	
#	for dialogue_index in yads_input.get_sections():
#		load_speaker_line(yads_input.get_value(dialogue_index, "speaker"))
#		load_dialogue_line(yads_input.get_value(dialogue_index, "line"))

#func store_speaker_line() -> String:
#	var _stored_speaker_line: String = speaker_line_edit.text
#	print("STORING SPEAKER LINE: " + _stored_speaker_line)
#	
#	return _stored_speaker_line

#func store_dialogue_line() -> String:
#	var _stored_dialogue_line: String = dialogue_line_edit.text
#	print("STORING DIALOGUE LINE: " + _stored_dialogue_line)
#	
#	return _stored_dialogue_line

#func load_speaker_line(_input_line: String) -> void:
#	print("LOADING SPEAKER LINE: " + _input_line)
#	speaker_line_edit.text = _input_line

#func load_dialogue_line(_input_line: String) -> void:
#	print("LOADING DIALOGUE LINE: " + _input_line)
#	dialogue_line_edit.text = _input_line

func _on_save_button_pressed() -> void:
	print("SAVING ALL LINES TO FILE")
	var _line_edits: Array[Node] = get_tree().get_nodes_in_group("line_editor")
	
	for line_edit in _line_edits:
		var _current_index: int = _line_edits[line_edit.get_index()].get_current_index()
		var _current_speaker: String = _line_edits[line_edit.get_index()].get_speaker_text()
		var _current_dialogue: String = _line_edits[line_edit.get_index()].get_dialogue_text()
		var _current_specfunc: String = _line_edits[line_edit.get_index()].get_specfunc()
		
		FileManager.save_line_to_file(_current_index, _current_speaker, _current_dialogue, _current_specfunc)

func _on_load_button_pressed() -> void:
	var _speaker_lines: Array[String] = FileManager.load_speaker_lines_from_file()
	var _dialogue_lines: Array[String] = FileManager.load_dialogue_lines_from_file()
	var _specfunc_lines: Array[String] = FileManager.load_specfuncs_from_file()
	
	# potential bug ahead! this all depends on the speaker and dialogue line array being the same size
	# they *should* be, but for now ill just throw a fit if the sizes are different
	
	if _speaker_lines.size() == _dialogue_lines.size():
		for _current_line in range(_speaker_lines.size()):
			GlobalManager.create_line_editor_item(GlobalManager.current_total_indexes, 
			_speaker_lines[_current_line], _dialogue_lines[_current_line], _specfunc_lines[_current_line])
	else:
		printerr("FUCK ME TO TEARS! SPEAKER AND DIALOGUE ARRAY SIZES AREN'T EQUAL!")

func _on_new_index_pressed() -> void:
	GlobalManager.create_line_editor_item(GlobalManager.current_total_indexes)
