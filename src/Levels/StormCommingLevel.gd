extends Node2D

func _ready() -> void:
	$CanvasLayer/VideoPlayer.play()


func _on_VideoPlayer_finished() -> void:
	$CanvasLayer.queue_free()
	$Thunder.play()


func _on_Timer_timeout() -> void:
	$Thunder.play()
	$Thunder/Timer.wait_time = rand_range(3, 15)
	$Thunder/Timer.start()
