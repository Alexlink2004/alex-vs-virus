extends Node
export (PackedScene) var Roca
var Score
func _ready():
	randomize()
	
	
func nuevo_juego():
	Score = 0
	Global_var.vidas = 3
	$Player.inicio($PosicionDeInicio)
	$InicioTimer.start()
	$UI.mostrar_mensaje("Listo?")
	$UI.update_score(Score)

func game_over():
	Global_var.vidas -= 1
	if Global_var.vidas == 0:
		$ScoreTimer.stop()
		$RocaTimer.stop()
		$UI.game_over()


func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$UI.update_score(Score)



func _on_RocaTimer_timeout():
	#lugar aleatorio roca
	$camino/RocaPosicion.set_offset(randi())
	var R = Roca.instance()
	emit_signal("iniciar_timer")
	add_child(R)
	 
	var d = $camino/RocaPosicion.rotation + PI /2
	
	R.position = $camino/RocaPosicion.position
	
	d += rand_range(-PI /4, PI / 4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.Velocidad_min, R.Velocidad_max), 0).rotated(d))


