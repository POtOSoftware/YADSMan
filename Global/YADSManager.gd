extends Node

var yads_dictionary: Dictionary

func load_yads_file_to_dictionary(_file_path: String = GlobalManager.working_file_path):
	var _speaker_lines: Array[String] = FileManager.load_speaker_lines_from_file(_file_path)
	var _dialogue_lines: Array[String] = FileManager.load_dialogue_lines_from_file(_file_path)
	var _spec_funcs: Array[String] = FileManager.load_specfuncs_from_file(_file_path)
	var _var_names: Array = FileManager.load_var_names_from_file(_file_path)
	var _var_values: Array = FileManager.load_var_values_from_file(_file_path)
	
	print("LOADING " + _file_path + " INTO DICTIONARY")
	
	# check if speaker lines, dialogue lines, and spec func array sizes are all the same
	# throw a fit if not
	if _speaker_lines.size() == _dialogue_lines.size() and _spec_funcs.size():
		print("SIZE SANITY CHECK PASSED")
		var _current_index: int = 0
		
		for _line in range(_speaker_lines.size()):
			yads_dictionary.set(_current_index, {
				"speaker": _speaker_lines[_current_index],
				"line": _dialogue_lines[_current_index],
				"spec_func": _spec_funcs[_current_index]
			})
			_current_index += 1
	else:
		printerr("WHAT THE FUCK! ARRAY SIZES AREN'T THE FUCKING SAME?! WHY?!")
	
	print(yads_dictionary)
