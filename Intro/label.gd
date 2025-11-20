extends Label

@onready var timer = $LetterTimer

var full_text := ""
var index := 0

func start_typewriter(text_to_show: String):
	full_text = text_to_show
	index = 0
	text = ""
	timer.start()


func _on_letter_timer_timeout() -> void:
	if index < full_text.length():
		text += full_text[index]
		index += 1
	else:
		timer.stop()
