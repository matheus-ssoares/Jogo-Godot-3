extends Area2D



func _on_dano_body_entered(body):
	.get_tree().change_scene("res://EndGame.tscn")