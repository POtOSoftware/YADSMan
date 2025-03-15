extends Control

@onready var root: Node = $".."

# just like unity! ...ewnity 3:
@export var speaker_label: Node
@export var dialogue_label: Node

var current_dialogue_index: int = 0

func _on_next_button_pressed() -> void:
	speaker_label.text = root.speaker_lines[current_dialogue_index]
	dialogue_label.text = root.dialogue_lines[current_dialogue_index]
	
	current_dialogue_index += 1
