extends Area2D

class_name CoinSilver

var taken = false

func _on_CoinSilver_body_entered(body):
	get_node("Collision").queue_free()
	if not taken and body is Player:
		($Anim as AnimationPlayer).play("taken")