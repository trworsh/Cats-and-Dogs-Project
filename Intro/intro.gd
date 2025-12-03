extends Node2D



func go_to_menu():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
