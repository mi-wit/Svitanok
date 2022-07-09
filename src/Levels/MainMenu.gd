extends Node2D

export var next_scene: PackedScene
onready var animPlayer: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction"):
		teleport()

func teleport() -> void:
	animPlayer.play("fade_out")
	yield(animPlayer, "animation_finished")
	get_tree().change_scene_to(next_scene)
