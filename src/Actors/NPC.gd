extends Actor

# Dialogs texts
export var firstInteraction = [
	"Hello, child",
	"Go get the gooses",
	"The storm is comming."
] 

func _ready() -> void:
	$InteractionHint.visible = false
	$dymek.visible = false
	$dymek/Label.text = firstInteraction.pop_front()

func _process(delta: float) -> void:
	
	if $InteractionHint.visible and Input.is_action_just_pressed("interaction"):
		$dymek.visible = true
		$dymek/DialogTimeOut.start()

func _physics_process(delta: float) -> void:
	if is_on_wall():
		velocity *= -1.0
	
	velocity.y += gravity * get_physics_process_delta_time()
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y


func _on_PlayerDetector_body_entered(body: Node) -> void:
	$InteractionHint.visible = true


func _on_PlayerDetector_body_exited(body: Node) -> void:
	$InteractionHint.visible = false


func _on_DialogTimeOut_timeout() -> void:
	$dymek.visible = false
	var nextDialog = firstInteraction.pop_front()
	if nextDialog:
		$dymek/NextSentenceTimer.start()
		$dymek/Label.text = nextDialog

func _on_NextSentenceTimer_timeout() -> void:
	$dymek.visible = true
	$dymek/DialogTimeOut.start()
