extends CanvasLayer
signal iniciar_juego



func _process(delta):
	$vidas.text = str(Global_var.vidas)
	if $vidas.text < ("1"):
		$vidas.text = ("0")

func mostrar_mensaje(texto):
	$mensaje.text = texto
	$mensaje.show()
	$TimerMensaje.start()



func game_over():
	mostrar_mensaje("Te viruleaste xD")
	yield($TimerMensaje, "timeout")
	$Button.show()
	$mensaje.text = "Volver a jugar?"
	$mensaje.show()
	$Credits.show()
	$Node2D.hide()
	
func update_score(puntos):
	$ScoreLabel.text = str(puntos)
	

func _on_TimerMensaje_timeout():
	$mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
	$musica1.play()
	$Credits.hide()
	$Node2D.show()
