extends Node

@export var player1_scene: PackedScene
@export var player2_scene: PackedScene

var current_player: CharacterBody2D = null
var current_player_index: int = 0

func _ready() -> void:
	# Spawn Player 1 by default
	_spawn_player(player1_scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_character"):
		_switch_player()

func _spawn_player(scene: PackedScene) -> void:
	if current_player:
		current_player.queue_free()

	current_player = scene.instantiate()
	add_child(current_player)
	current_player.global_position = Vector2(200, 200)  # Set a start position
	current_player_index = player1_scene if scene == player1_scene else player2_scene

func _switch_player() -> void:
	var next_scene = player1_scene if current_player_index == player2_scene else player2_scene
	_spawn_player(next_scene)
