extends StaticBody2D

signal Door_opened

var keyNehmen = false
var in_Door_zone = false



func _on_Area2D_body_entered(body : PhysicsBody2D):
	if keyNehmen == false:
		keyNehmen = true
		$Sprite.queue_free()
func _process(delta):
	if keyNehmen == true :
		if in_Door_zone == true:
			if Input.is_action_just_pressed("ui_accept"):
				print("Door_opened")
			
