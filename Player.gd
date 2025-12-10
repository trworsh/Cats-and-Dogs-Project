extends Node


func _input(event):
	if event.is_action_pressed("ui_cancel"): # usually ESC
		var pm = $PauseMenu
		if pm.visible:
			pm.hide_pause_menu()
		else:
			pm.show_pause_menu()
