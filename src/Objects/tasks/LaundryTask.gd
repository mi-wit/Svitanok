extends "res://src/Objects/Task.gd"

func _ready() -> void:
	$Basket/basket_empty.visible = true
	$Basket/basket_full.visible = false
	
	$Laundry/laundry_string.visible = true
	$Laundry/laundry.visible = true

func _on_interaction_started() -> void:
	$Basket/basket_empty.visible = false
	$Basket/basket_full.visible = true

	$Laundry/laundry.visible = false
	emit_signal("task_completed")
