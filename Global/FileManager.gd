extends Node

var yads_output: ConfigFile = ConfigFile.new()

func save_line_to_file(_index_int: int, _speaker_text: String, _dialogue_text: String):
	var index_string = str(_index_int) # idk, just for convenience ig
	print("SAVING LINES FROM INDEX " + index_string)
	
	yads_output.set_value(index_string, "speaker", _speaker_text)
	yads_output.set_value(index_string, "line", _dialogue_text)
	
	if yads_output.save(GlobalManager.working_file_path) == OK:
		print("SUCCESSFULLY SAVED LINES FROM INDEX " + index_string)
	else:
		print("FUCK ME! SAVING LINES FROM INDEX " + index_string + " HAS FAILED!")
