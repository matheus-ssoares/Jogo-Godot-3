extends Control

func _ready():
	var LabelNode = get_node("Score/VBoxContainer/Score/Label2")
	LabelNode.text = str(Mundo.score)
	print(Mundo.score)
	var GoldNode = get_node("Score/VBoxContainer/Gold/Label2")
	GoldNode.text = str(Mundo.GOLD)
	var SilverNode = get_node("Score/VBoxContainer/Silver/Label2")
	SilverNode.text = str(Mundo.SILVER)


func _on_Restart_pressed():
	.get_tree().change_scene("res://World.tscn")
	Mundo.life = 3
	Mundo.GOLD = 0
	Mundo.SILVER = 0
	Mundo.score = 0

func _on_Quit_pressed():
	get_tree().quit()



