extends Node2D

export var next_scene: PackedScene

func _on_GooseHouse_body_entered(body: Node) -> void:
	if body.name == "Goose4":
		get_tree().change_scene_to(next_scene)
	body.queue_free()
