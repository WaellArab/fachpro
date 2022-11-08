extends KinematicBody2D


var motion = Vector2()

func _process(delta):
	motion = move_and_slide(motion,Vector2.UP)

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 120
		$Sprite.flip_h = false
		if is_on_floor():
			$AnimationPlayer.play("move")
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$AnimationPlayer.play("move")
		motion.x = -120
	else:
		motion.x = 0
		if is_on_floor():
			$AnimationPlayer.play("idel")
		
		
	if is_on_floor() == false:
		motion.y += 10
		if motion.y > 10:
			$AnimationPlayer.play("fall")
			if motion.y < 10:
				$AnimationPlayer.play("jump")
				if Input.is_action_just_pressed("jump") and is_on_floor():
					motion.y = -340
					$AudioStreamPlayer.play()
				
	if is_on_floor() == true && Input.is_action_pressed("ui_up") == true:
		motion.y = -340
		 


func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().reload_current_scene()
