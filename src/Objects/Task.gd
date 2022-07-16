extends Area2D

signal interaction_started
var is_interactable = true

func _ready() -> void:
	$dymek2.visible = false

func _process(delta: float) -> void:
	if $dymek2.visible && Input.is_action_just_pressed("interaction"):
		emit_signal("interaction_started")
		is_interactable = false
		$dymek2.visible = is_interactable

func _on_Area2D_body_entered(body: Node) -> void:
	$dymek2.visible = is_interactable
	
func _on_Area2D_body_exited(body: Node) -> void:
	$dymek2.visible = false
