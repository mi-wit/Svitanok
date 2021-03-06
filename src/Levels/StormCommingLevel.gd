extends Node2D

export var next_scene: PackedScene

func _ready() -> void:
#	$CanvasLayer/VideoPlayer.visible = true
	$CanvasLayer/VideoPlayer.play()
	$Second_plan_background/PotatoesTask/Area2D.connect("task_completed", $".", "play_succes_audio")
	$Second_plan_background/LaundryTask/Area2D.connect("task_completed", $".", "play_succes_audio")
	$Second_plan_background/RoofTask/Area2D.connect("task_completed", $".", "play_succes_audio")
	
	
func play_succes_audio() -> void:
	print("playings")
	$Succes.play()

func _on_VideoPlayer_finished() -> void:
	$CanvasLayer.queue_free()
	$Thunder.play()


func _on_Timer_timeout() -> void:
	$Thunder.play()
	$Thunder/Timer.wait_time = rand_range(3, 15)
	$Thunder/Timer.start()


func _on_Area2D_body_entered(body: Node) -> void:
	print("entered")
	get_tree().change_scene_to(next_scene)


