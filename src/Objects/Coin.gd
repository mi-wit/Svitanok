extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	$dymek2.visible = false
	
func _process(delta: float) -> void:
	if $dymek2/InterractionInfo.visible and Input.is_action_just_pressed("interaction"):
		anim_player.play("fadeOut")

func _on_body_entered(body: Node) -> void:
	$dymek2.visible = true


func _on_Coin_body_exited(body: Node) -> void:
	$dymek2.visible = false
