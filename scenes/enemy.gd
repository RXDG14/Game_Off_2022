extends Area2D

const Enemyexplode = preload("res://scenes/explosioneffect.tscn")

export(int) var speed =20
export(int) var health =3

signal score_up

func _process(delta):
	position.x -= speed * delta

func _on_enemy_body_entered(body):
	body.create_hit_effect()
	body.queue_free() #bullet vanish
	health -= 1
	if health <= 0:
		add_to_score()
		create_explosion()
		queue_free()	#enemy vanish

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func add_to_score():
	var main = get_tree().current_scene		#score update 3 lines
	if main.is_in_group("world"):
		main.score +=1

func create_explosion():
		var main = get_tree().current_scene
		var enemyexplode = Enemyexplode.instance()
		main.add_child(enemyexplode)
		enemyexplode.global_position =  global_position

