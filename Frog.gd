extends CharacterBody2D

const SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	# Gravity of the frog
	velocity.y += gravity * delta
	
	if chase == true:
		# Otherwise this would overwrite the death animation
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
		var direction = (%Player.global_position - 
					self.global_position).normalized()
		
		if direction.x  > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
	
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
	
	# Update the Frog on every frame
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		chase = false
		get_node("AnimatedSprite2D").play("Death")
		await get_node("AnimatedSprite2D").animation_finished
		queue_free()

