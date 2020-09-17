extends Area2D

class_name Coin

var taken = false

func _on_Coin_body_entered(body):
	get_node("Collision").queue_free()
	if not taken and body is Player:
		($Anim as AnimationPlayer).play("taken")