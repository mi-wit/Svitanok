extends "res://src/Objects/Task.gd"


var is_picking_potatoes = false
var potatoes: Array = []

func _on_interaction_started() -> void:
	potatoes = $Potatoes.get_children()
	print(potatoes)
	is_picking_potatoes = true
	
func _process(delta: float) -> void:
	if !potatoes.empty() and is_picking_potatoes and Input.is_action_just_pressed("interaction"):
		potatoes.pop_back().queue_free()
		if potatoes.empty():
			emit_signal("task_completed")
