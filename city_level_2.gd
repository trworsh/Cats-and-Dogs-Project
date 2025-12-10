extends Area2D

@onready var pause_menu = $"../PauseMenu"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	if _body.is_in_group("player"):
		get_tree().change_scene_to_file("res://city_level2.tscn")


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if pause_menu.visible:
			pause_menu.hide_pause_menu()
		else:
			pause_menu.show_pause_menu()
