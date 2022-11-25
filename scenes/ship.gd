extends Area2D

const Enemyexplode = preload("res://scenes/explosioneffect.tscn")
const Bullet = preload("res://scenes/bullet.tscn")
export(int) var speed = 100

signal death

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		move(0,-speed,delta)
	if Input.is_action_pressed("ui_down"):
		move(0,speed,delta)
	if Input.is_action_pressed("ui_left"):
		move(-speed,0,delta)
	if Input.is_action_pressed("ui_right"):
		move(speed,0,delta)
	#if Input.is_action_just_pressed("ui_accept"):
	#	fire_bullet()
	if Input.is_action_pressed("ui_accept"):
		fire_bullet()

func move(xspeed,yspeed,delta):
	position.x +=xspeed * delta
	position.y +=yspeed * delta

func fire_bullet():
	var bullet = Bullet.instance()			 #instance the bullet
	var main = get_tree().current_scene		 #get the rood node and select the current scene
	main.add_child(bullet)					 #add the bullet as a child 
	bullet.global_position = global_position #make it globally follow the ship



func _on_ship_area_entered(area):
	area.queue_free() #enemy also dies
	queue_free() # u hit enemy u die

func _exit_tree():
		var main = get_tree().current_scene
		var enemyexplode = Enemyexplode.instance()
		main.add_child(enemyexplode)
		enemyexplode.global_position =  global_position
		emit_signal("death")
