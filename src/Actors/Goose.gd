extends Actor

var is_moving_right: bool = false
var is_moving_left: bool = false

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		float(is_moving_right) - float(is_moving_left),
		1.0)
		
	velocity = calculate_linear_velocity(velocity, direction, speed) 
	velocity = move_and_slide(velocity, FLOOR_NORMAL)


func calculate_linear_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2
) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	return new_velocity


func _on_PlayerDetector_body_entered(body: Node) -> void:
	if $runningAwayTimer.is_stopped():
		$runningAwayTimer.start()
		is_moving_right = true
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.play()

func _on_runningAwayTimer_timeout() -> void:
	is_moving_left = false
	is_moving_right = false
	$AnimatedSprite.animation = "idle"
