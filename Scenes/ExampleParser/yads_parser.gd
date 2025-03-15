extends Control

@onready var root: Node = $".."

# just like unity! ...ewnity 3:
@export_node_path("Label") var speaker_label
@export_node_path("Label") var dialogue_label

var current_dialogue_index: int = 0

func _on_next_button_pressed() -> void:
	speaker_label.text = root.speaker_lines[current_dialogue_index]
	dialogue_label.text = root.dialogue_lines[current_dialogue_index]
	
	current_dialogue_index += 1
