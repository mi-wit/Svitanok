extends "res://src/Objects/Task.gd"

func _ready() -> void:
	$fixed_roof.visible = false
	

func _on_interaction_started() -> void:
	$fixed_roof.visible = true
	$hammer_wood.visible = false
	emit_signal("task_completed")
