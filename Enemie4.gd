extends StaticBody2D

class_name Enemy4

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.6

func _ready():
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 50

func _physics_process(delta):

	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	elif($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

func dano():
	get_node("Collision").queue_free()
	($Anim as AnimationPlayer).play("morte")
