extends KinematicBody2D

var speed = 40
var gravity  = 15
var move = Vector2()
var Floor = Vector2(0,-1)
var dir = 1

func _physics_process(delta):
	move.x = speed * dir
	$AnimatedSprite.play("run_2")
	move.y = gravity
	move = move_and_slide(move,Floor)
	if is_on_wall():  
		dir = dir * -1
		$RayCast2D.position.x = dir
	
	if $RayCast2D.is_colliding()==false:
		dir = dir * -1
		$RayCast2D.position.x = dir
		
func _on_hitbos_2_body_entered(body):
	if body.is_in_group("player1"):
		queue_free()

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pass # Replace with function body
