extends Node2D

func _ready() -> void:
	$CanvasLayer/VideoPlayer.play()


func _on_VideoPlayer_finished() -> void:
	$CanvasLayer.queue_free()
