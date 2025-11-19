extends Label

@export var text_to_display: String = "Hey, I'm heading out! You two get along!"
@export var letter_delay := 0.03

var current_index := 0

func start_typewriter():
	text = ""
	current_index = 0
	call_deferred("_type_letter")

func _type_letter():
	if current_index < text_to_display.length():
		text += text_to_display[current_index]
		current_index += 1
		await get_tree().create_timer(letter_delay).timeout
		_type_letter()
