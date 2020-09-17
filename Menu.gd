extends Control

func _on_Start_pressed():
	($Anim as AnimationPlayer).play("Start")
	get_tree().change_scene("res://World.tscn")


func _on_Quit_pressed():
	($Anim as AnimationPlayer).play("Quit")
	get_tree().quit()


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
