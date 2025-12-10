extends Node2D


func _process(_delta: float) -> void:
	if !$"Forest Background Music".playing:
		$"Forest Background Music".play()


@onready var pause_menu = $PauseMenu

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if pause_menu.visible:
			pause_menu.hide_pause_menu()
		else:
			pause_menu.show_pause_menu()
