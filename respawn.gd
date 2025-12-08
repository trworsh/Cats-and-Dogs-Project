extends Area2D

@export var spawn_point_path: NodePath   # We will assign the level's spawn point

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		var spawn_point = get_node(spawn_point_path)
		body.global_position = spawn_point.global_position
		# Reset velocity if Player is a CharacterBody2D
		if "velocity" in body:
			body.velocity = Vector2.ZERO
