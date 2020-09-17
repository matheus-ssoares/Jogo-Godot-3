extends Label

class_name ScoreValue
var value = 0

func _on_Coin_body_entered(body):
	$Label = value + 1