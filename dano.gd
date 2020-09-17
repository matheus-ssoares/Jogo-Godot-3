extends Area2D

class_name RecebeDano


func _on_dano_body_entered(body):
	if(Mundo.life > 0):
		($Anim as AnimationPlayer).play("dano")
