	extends Area2D
export (int) var Velocidad = 400
var Movimiento = Vector2()
var limite
signal golpe
var direccion 

onready var joystick = get_parent().get_node("/root/Mundo/")







func _ready():
	limite = get_viewport_rect().size
	hide()
	
	
	


func _process(delta):
	
	
	
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right") :
		Movimiento.x += 1
		if Global_var.vidas == 2:
			$Sprite.play("walk")
		elif Global_var.vidas == 1: 
			$Sprite.play("walk")
		elif Global_var.vidas == 3:
			$Sprite.play("walk_power")
		$Sprite.flip_h = true
		direccion = + 700
	elif Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
		$Sprite.flip_h = false
		if Global_var.vidas == 2:

			$Sprite.play("walk")
		elif Global_var.vidas == 1: 
			$Sprite.play("walk")
		elif Global_var.vidas == 3:
			$Sprite.play("walk_power")
		direccion = - 700
	elif Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
		if Global_var.vidas == 2:
			$Sprite.play("walk front")
		elif Global_var.vidas == 1: 
			$Sprite.play("walk front")
		elif Global_var.vidas == 3:
			$Sprite.play("front power")
		direccion = + 700
	elif Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
		direccion = - 700
		if Global_var.vidas == 2:
			$Sprite.play("walk back")
		elif Global_var.vidas == 3:
			$Sprite.play("back_power")
		elif Global_var.vidas == 1:
			$Sprite.play("walk back")
	else:
		Movimiento.x= 0
		Movimiento.y= 0
		#player vidas settiing
		if Global_var.vidas == 2:
			$Sprite.play("static")
		elif Global_var.vidas == 1: 
			$Sprite.play("golpe")
		elif Global_var.vidas == 3:
			$Sprite.play("power")
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	
	
	
		
	position += Movimiento * delta #reiniciar movimientos
	position.x = clamp(position.x,0, limite.x)
	position.y = clamp(position.y,0, limite.y)
	

func _on_Player_body_entered(body):
	emit_signal("golpe")
	Movimiento.x += 54
	emit_signal("ui_right")
	if Global_var.vidas == 0:
		hide()
		$CollisionShape2D.disabled = true
func inicio(pos):
	
	show()
	$CollisionShape2D.disabled = false
	





func _on_SwipeDetector_swiped(direction):
	
	pass # Replace with function body.
