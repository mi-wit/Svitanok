extends Actor

var audio_position

# Dialogs texts
export var firstInteraction = [
	"Hello, child",
	"Go get the gooses",
	"The storm is comming."
] 

func _ready() -> void:
	$dymek2.visible = false
	$dymek.visible = false
	$dymek/Label.text = firstInteraction.pop_front()

func _process(delta: float) -> void:
	
	if $dymek2.visible and Input.is_action_just_pressed("interaction"):
		$dymek2.visible = false
		$dymek.visible = true
		$AudioStreamPlayer2D.play()
		$dymek/DialogTimeOut.start()

func _physics_process(delta: float) -> void:
#	if is_on_wall():
#		velocity *= -1.0
#
#	velocity.y += gravity * get_physics_process_delta_time()
#	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	pass

func _on_PlayerDetector_body_entered(body: Node) -> void:
	$dymek2.visible = true


func _on_PlayerDetector_body_exited(body: Node) -> void:
	$dymek2.visible = false


func _on_DialogTimeOut_timeout() -> void:
	$dymek.visible = false
	audio_position = $AudioStreamPlayer2D.get_playback_position()
	$AudioStreamPlayer2D.stop()
	var nextDialog = firstInteraction.pop_front()
	if nextDialog:
		$dymek/NextSentenceTimer.start()
		$dymek/Label.text = nextDialog

func _on_NextSentenceTimer_timeout() -> void:
	$dymek.visible = true
	$AudioStreamPlayer2D.seek(rand_range(0, 8))
	$AudioStreamPlayer2D.play(audio_position)
	$dymek/DialogTimeOut.start()
