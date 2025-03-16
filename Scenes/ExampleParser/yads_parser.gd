extends Control

@onready var root: Node = $".."

# just like unity! ...ewnity 3:
@export var speaker_label: Node
@export var dialogue_label: Node

var current_dialogue_index: int = 0

func _on_next_button_pressed() -> void:
	parse_variables_in_line(current_dialogue_index)
	
	speaker_label.text = root.speaker_lines[current_dialogue_index]
	dialogue_label.text = root.dialogue_lines[current_dialogue_index]
	
	if root.specfunc_lines[current_dialogue_index] != "":
		print("CALLING SPECIAL FUNCTION: " + root.specfunc_lines[current_dialogue_index])
		root.call(root.specfunc_lines[current_dialogue_index])
	
	current_dialogue_index += 1

func parse_variables_in_line(_current_line_index: int) -> void:
	var _current_var_names: Array = root.variable_names
	var _current_var_values: Array = root.variable_values
	
	#print(root.dialogue_lines[_current_line_index])
	
	for _var in range(_current_var_names.size()):
		print(_current_var_names[_var])
		# this is some horse shitty long line but it works
		# and its gonna get reworked anyways, cause we going
		# dicktionaries instead of stinky stinky fuck ass arrays
		root.dialogue_lines[_current_line_index] = root.dialogue_lines[_current_line_index].replace("$" + _current_var_names[_var] + "$", _current_var_values[_var])
