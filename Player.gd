extends KinematicBody2D

class_name Player 

const UP = Vector2(0, -1)
var GRAVITY = 20
var SPEED = 200
var JUMP_HEIGHT = -550
var motion = Vector2()
var scorePlayer = 0
var lifePlayer = 3
var SILVER = 0
var GOLD = 0
var termina = 1

func _ready():
	lifePlayer = Mundo.life
	scorePlayer = Mundo.score
	SILVER = Mundo.SILVER
	GOLD = Mundo.GOLD
	var SilverNode = get_parent().get_node("SILVER/CanvasLayer/Control/Label")
	SilverNode.text = str(Mundo.SILVER)
	
	var GoldNode = get_parent().get_node("GOLD/CanvasLayer/Control/Label")
	GoldNode.text = str(Mundo.GOLD)

# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)
	
	if (lifePlayer == 0):
		SPEED = 0
		JUMP_HEIGHT = 0
		get_node("Shape").queue_free()
		($Anim as AnimationPlayer).play("Morte")
# warning-ignore:return_value_discarded
		.get_tree().change_scene("res://gameover.tscn")	

	
# warning-ignore:unused_argument
func _on_Coin_body_entered(body):
	scorePlayer += 3
	GOLD +=1
	Mundo.GOLD = GOLD
	Mundo.score = scorePlayer
	
	var GoldNode = get_parent().get_node("GOLD/CanvasLayer/Control/Label")
	GoldNode.text = str(Mundo.GOLD)


# warning-ignore:unused_argument
func _on_CoinSilver_body_entered(body):
	SILVER +=1
	scorePlayer += 1
	Mundo.score = scorePlayer
	Mundo.SILVER = SILVER
	
	var SilverNode = get_parent().get_node("SILVER/CanvasLayer/Control/Label")
	SilverNode.text = str(Mundo.SILVER)
	
func _on_Pes_body_entered(body):
	motion.y = JUMP_HEIGHT
	scorePlayer +=3
	Mundo.score = scorePlayer
	body.dano()

# warning-ignore:unused_argument
func _on_dano_body_entered(body):
	print(lifePlayer)
	if(lifePlayer > 1):
		motion.y -= 150
	lifePlayer -= 1
	Mundo.life = lifePlayer

# warning-ignore:unused_argument
func _on_die_body_entered(body):
# warning-ignore:return_value_discarded
	.get_tree().change_scene("res://gameover.tscn")


func _on_Portal_body_entered(body):
	.get_tree().change_scene("res://EndGame.tscn")
	

func _on_AudioStreamPlayer2D_finished():
	pass
