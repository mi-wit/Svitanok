extends Actor

func _ready() -> void:
	$InteractionHint.visible = false

func _physics_process(delta: float) -> void:
	if is_on_wall():
		velocity *= -1.0
	
	velocity.y += gravity * get_physics_process_delta_time()
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y


func _on_PlayerDetector_body_entered(body: Node) -> void:
	$InteractionHint.visible = true


func _on_PlayerDetector_body_exited(body: Node) -> void:
	$InteractionHint.visible = false

