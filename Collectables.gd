extends Node2D

var Cherry = preload("res://Collectables/Cherry.tscn")

func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var randInt = randi_range(150, 400)
	cherryTemp.position = Vector2(randInt, 420)
	add_child(cherryTemp)
