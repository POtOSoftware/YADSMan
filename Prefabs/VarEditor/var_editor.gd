extends Control

@onready var var_name_edit = $ColorRect/VarNameEdit
@onready var var_value_edit = $ColorRect/VarValueEdit

func initialize_variable(_var_name: String, _var_value: String):
	print("INITIALIZING VARIABLE " + _var_name + " WITH VALUE " + _var_value)
	var_name_edit.text = _var_name
	var_value_edit.text = _var_value

func get_variable_name() -> String:
	print("VARIABLE NAME: " + var_name_edit.text)
	return var_name_edit.text

func get_variable_value() -> String:
	print("VARIABLE VALUE: " + var_value_edit.text)
	return var_value_edit.text
