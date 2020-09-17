extends Node

export var score = 0
export var life = 3
export var SILVER = 0  
export var GOLD = 0

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
