extends Actor


# To jest plik gołębia

export var is_computer_steering: = false; 
var number_of_jumps: = 2
onready var anim_player: AnimatedSprite = $AnimatedSprite


func _ready() -> void:
	anim_player.play()

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: bool = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction = Vector2.DOWN if is_computer_steering else calculate_direction()
	
	if not is_computer_steering:
		if direction.x > 0 and is_on_floor():
			anim_player.animation = "walk"
			anim_player.flip_h = false
		elif direction.x < 0 and is_on_floor(): 
			anim_player.flip_h = true
			anim_player.animation = "walk"
		elif direction.x == 0 and is_on_floor(): 
			anim_player.animation = "idle"
		elif direction.y != 0:
			anim_player.animation = "jump"
		
	velocity = calculate_linear_velocity(velocity, direction, speed, is_jump_interrupted) 
	velocity = move_and_slide(velocity, FLOOR_NORMAL)

func calculate_direction() -> Vector2:
	if is_on_floor():
		number_of_jumps = 2
	var direction = 0.0
	if Input.is_action_just_pressed("jump") and number_of_jumps > 0:
		direction = -1.0
		number_of_jumps -= 1
	else:
		direction = 1.0
	return Vector2(
		Input.get_action_strength("ui_right") - 
		Input.get_action_strength("ui_left"),
		direction)
		
func calculate_linear_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0.0
	return new_velocity

func set_animation(name: String) -> void:
	print(name)
	anim_player.animation = name
