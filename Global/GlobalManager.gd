extends Node

var current_total_indexes: int = 0
var working_file_path: String = "res://testing.yads"

# do not ask why rmpp used a different prefab variable formatting, im very indecisive teehee :3c
var prefab_line_editor: PackedScene = preload("res://Prefabs/LineEditor/LineEditor.tscn")

var line_editor_container: Node = null

func create_line_editor_item(_index: int, _speaker_text: String = "", _dialogue_text: String = "", _specfunc_text: String = "") -> void:
	var instance_line_editor: Node = prefab_line_editor.instantiate()
	
	line_editor_container.add_child(instance_line_editor)
	instance_line_editor.initialize_index(_index)
	instance_line_editor.initialize_text(_speaker_text, _dialogue_text, _specfunc_text)
	
	current_total_indexes += 1
