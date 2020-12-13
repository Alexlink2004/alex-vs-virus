extends RigidBody2D

export (int) var Velocidad_min
export (int) var Velocidad_max
var tipo_roca = ["grande", "chica"]
signal iniciar_timer
func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	
	if $AnimatedSprite.animation == "grande":
		$CollisionShape2D.scale.x = 2.5
		$CollisionShape2D.scale.y = 2.5

func _on_visibilidad_screen_exited():
	queue_free()
