extends Control

@onready var current_index_label: Node = $ColorRect/IndexLabel
@onready var speaker_edit: Node = $ColorRect/SpeakerEdit/SpeakerEdit
@onready var dialogue_edit: Node = $ColorRect/Dialogue/DialogueEdit

var current_index: int

func initialize_index(_index: int):
	current_index = _index
	current_index_label.text = "Index: " + str(current_index)
	print("INITIALIZED LINE EDITOR WITH INDEX " + str(current_index))

func initialize_text(_speaker_text: String = "", _dialogue_text: String = ""):
	var _index_string: String = str(get_current_index())
	
	# we only really need to initialize them if the arguments were actually filled in and used
	if _speaker_text != "":
		print("INITIALIZING INDEX " + _index_string + " WITH SPEAKER TEXT: " + _speaker_text)
		speaker_edit.text = _speaker_text
	if _dialogue_text != "":
		print("INITIALIZING INDEX " + _index_string + " WITH DIALOGUE TEXT: " + _dialogue_text)
		dialogue_edit.text = _dialogue_text

func get_current_index() -> int:
	return current_index

func get_speaker_text() -> String:
	print("Index " + str(get_current_index()) + ": Speaker Text=" + speaker_edit.text)
	return speaker_edit.text

func get_dialogue_text() -> String:
	print("Index " + str(get_current_index()) + ": Dialogue Text=" + dialogue_edit.text)
	return dialogue_edit.text
