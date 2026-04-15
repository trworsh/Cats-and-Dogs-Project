extends CanvasLayer

@onready var resume_button = $VBoxContainer/ResumeButton
@onready var main_menu_button = $VBoxContainer/MainMenuButton

func _ready():
	visible = false
	resume_button.pressed.connect(_on_resume_button_pressed)
	main_menu_button.pressed.connect(_on_main_menu_button_pressed)


func show_pause_menu():
	visible = true
	get_tree().paused = true


func hide_pause_menu():
	get_tree().paused = false
	visible = false


func _on_resume_button_pressed() -> void:
	$Click_UI.play()
	hide_pause_menu()


func _on_main_menu_button_pressed() -> void:
	$Click_UI.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_resume_button_mouse_entered() -> void:
	$Hover_UI.play()


func _on_main_menu_button_mouse_entered() -> void:
	$Hover_UI.play()
