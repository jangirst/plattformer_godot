extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		# Increase the players gold
		Game.Gold += 5
		
		# Tween helps to create an animation
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		
		# Move the Cherry a little up
		tween.tween_property(self, "position", position - Vector2(0, 35), 0.35)
		
		# The animations start one after the other, so 
		# Make the Cherry invisible
		tween1.tween_property(self, "modulate:a", 0, 0.25)
		
		# Delete the Cherry from the Scene
		tween.tween_callback(queue_free)
