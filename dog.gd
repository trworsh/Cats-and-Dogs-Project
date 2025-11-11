extends CharacterBody2D

@export var speed: float = 200.0
@export var gravity: float = 1200.0
@export var jump_force: float = 400.0
@export var coyote_time: float = 0.15        # seconds you can still jump after leaving a platform
@export var jump_buffer_time: float = 0.15   # seconds before landing that jump input still counts
@export var active: bool = false     

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Internal state
var coyote_timer: float = 0.0
var jump_buffer_timer: float = 0.0

func _physics_process(delta: float) -> void:
	# --- Horizontal Movement ---
	var input_dir := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_dir * speed

	# --- Apply Gravity ---
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		coyote_timer = coyote_time   # reset coyote time when on ground

	# --- Handle Coyote Timer ---
	if coyote_timer > 0.0:
		coyote_timer -= delta

	# --- Jump Input ---
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer_timer = jump_buffer_time

	if jump_buffer_timer > 0.0:
		jump_buffer_timer -= delta

	# --- Perform Jump ---
	if jump_buffer_timer > 0.0 and coyote_timer > 0.0:
		velocity.y = -jump_force
		jump_buffer_timer = 0.0
		coyote_timer = 0.0

	# --- Move and Slide ---
	move_and_slide()

# --- Animation and Facing Direction ---
	if not is_on_floor():
		anim_sprite.play("jump")
	else:
		if input_dir != 0:
			anim_sprite.play("walk cycle")
		else:
			anim_sprite.play("idle")

# Flip sprite last so direction is always correct
	if input_dir != 0:
		anim_sprite.flip_h = input_dir > 0


	# --- Reset jump buffer when landing ---
	if is_on_floor():
		jump_buffer_timer = 0.0
