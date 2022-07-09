extends Node2D

func _on_GooseHouse_body_entered(body: Node) -> void:
	if body.name == "Goose4":
		print("Load next level")
	body.queue_free()
