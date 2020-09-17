extends StaticBody2D

class_name Batcena2

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.6

func _ready():
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 125

# warning-ignore:unused_argument
func _physics_process(delta):
	($Anim as AnimationPlayer).play("Fly")
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
	velocidade = 0
	($morte as AnimationPlayer).play("morte")
	get_node("Collision").queue_free()
