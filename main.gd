extends Node2D

func _ready():
	pass
	#Util.saveGame()
	#Util.loadGame()


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	Util.newGame()
	get_tree().change_scene_to_file("res://world.tscn")


func _on_load_pressed():
	Util.loadGame()
	get_tree().change_scene_to_file("res://world.tscn")
	#get_tree().change_scene_to_file("res://load.tscn")


