extends Node

var yads_file: ConfigFile = ConfigFile.new()

func save_line_to_file(_index_int: int, _speaker_text: String, _dialogue_text: String, _spec_func: String) -> void:
	var index_string: String = str(_index_int) # idk, just for convenience ig
	print("SAVING LINES FROM INDEX " + index_string)
	
	yads_file.set_value(index_string, "speaker", _speaker_text)
	yads_file.set_value(index_string, "line", _dialogue_text)
	yads_file.set_value(index_string, "spec_func", _spec_func)
	
	if yads_file.save(GlobalManager.working_file_path) == OK:
		print("SUCCESSFULLY SAVED LINES FROM INDEX " + index_string)
	else:
		printerr("FUCK ME! SAVING LINES FROM INDEX " + index_string + " HAS FAILED!")

func save_vars_to_file(_var_names: Array, _var_values: Array):
	print("SAVING VARS TO FILE")
	
	yads_file.set_value("variables", "var_names", _var_names)
	yads_file.set_value("variables", "var_values", _var_values)
	
	if yads_file.save(GlobalManager.working_file_path) == OK:
		print("SUCCESSFULLY SAVED VARIABLES")
	else:
		printerr("AW SHUCKS! SAVING VARIABLES HAS FAILED!")

func load_speaker_lines_from_file(_file_path: String = GlobalManager.working_file_path) -> Array[String]:
	#var _file_path: String = GlobalManager.working_file_path
	var speaker_lines: Array[String]
	
	if yads_file.load(_file_path) == OK:
		print("LOADING SPEAKER LINES FROM " + _file_path)
	else:
		printerr("MOTHER FUCKER! LOADING SPEAKER LINES FROM " + _file_path + " HAS FAILED!")
	
	for speaker_index in yads_file.get_sections():
		speaker_lines.append(yads_file.get_value(speaker_index, "speaker"))
	
	print("SPEAKER LINES: " + str(speaker_lines))
	
	return speaker_lines

func load_dialogue_lines_from_file(_file_path: String = GlobalManager.working_file_path) -> Array[String]:
	#var _file_path: String = GlobalManager.working_file_path
	var dialogue_lines: Array[String]
	
	if yads_file.load(_file_path) == OK:
		print("LOADING DIALOGUE LINES FROM " + _file_path)
	else:
		printerr("SON OF A BITCH! LOADING DIALOGUE LINES FROM " + _file_path + " HAS FAILED!")
	
	for dialogue_index in yads_file.get_sections():
		dialogue_lines.append(yads_file.get_value(dialogue_index, "line"))
	
	print("DIALOGUE LINES: " + str(dialogue_lines))
	
	return dialogue_lines

func load_specfuncs_from_file(_file_path: String = GlobalManager.working_file_path) -> Array[String]:
	var specfunc_lines: Array[String]
	
	if yads_file.load(_file_path) == OK:
		print("LOADING SPECIAL FUNCTIONS FROM " + _file_path)
	else:
		printerr("SHIT ON MY DICK! LOADING SPEC FUNCS FROM " + _file_path + " HAS FAILED!")
	
	for specfunc_index in yads_file.get_sections():
		specfunc_lines.append(yads_file.get_value(specfunc_index, "spec_func"))
	
	print("SPECIAL FUNCTIONS: " + str(specfunc_lines))
	
	return specfunc_lines

func load_var_names_from_file(_file_path: String = GlobalManager.working_file_path) -> Array:
	var var_names: Array
	
	if yads_file.load(_file_path) == OK:
		print("LOADING VARIABLE NAMES FROM " + _file_path)
	else:
		printerr("DOLPHIN DICKS! LOADING VARIALBE NAMES FROM " + _file_path + " HAS FAILED!")
	
	var_names = yads_file.get_value("variables", "var_names")
	
	return var_names

func load_var_values_from_file(_file_path: String = GlobalManager.working_file_path) -> Array:
	var var_values: Array
	
	if yads_file.load(_file_path) == OK:
		print("LOADING VARIABLE VALUES FROM " + _file_path)
	else:
		printerr("BISCUITS! LOADING VARIABLE VALUES FROM " + _file_path + " HAS FAILED!")
	
	var_values = yads_file.get_value("variables", "var_values")
	
	return var_values
