extends Node

var current_total_indexes: int = 0
var working_file_path: String = "res://testing.yads"

# do not ask why rmpp used a different prefab variable formatting, im very indecisive teehee :3c
var prefab_line_editor: PackedScene = preload("res://Prefabs/LineEditor/LineEditor.tscn")
var prefab_var_editor: PackedScene = preload("res://Prefabs/VarEditor/VarEditor.tscn")

var line_editor_container: Node = null
var variable_container: Node = null

func create_line_editor_item(_index: int, _speaker_text: String = "", _dialogue_text: String = "", _specfunc_text: String = "") -> void:
	var instance_line_editor: Node = prefab_line_editor.instantiate()
	
	line_editor_container.add_child(instance_line_editor)
	instance_line_editor.initialize_index(_index)
	instance_line_editor.initialize_text(_speaker_text, _dialogue_text, _specfunc_text)
	
	current_total_indexes += 1

func create_var_edit_item(_var_name: String = "", _var_value: String = ""):
	print("CREATING VARIABLE EDITOR")
	var instance_var_editor: Node = prefab_var_editor.instantiate()
	
	variable_container.add_child(instance_var_editor)
	instance_var_editor.initialize_variable(_var_name, _var_value)
