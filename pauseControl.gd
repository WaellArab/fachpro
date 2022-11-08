extends Node

func _ready():
  set_visible(false)
  pass 

func _input(event):
	if event.is_action_pressed("ui_cancel"):
	 set_visible(!get_tree().paused)
	 get_tree().paused=!get_tree().paused  
func set_visible(is_visible):
	for node in get_children():
		node.visible=is_visible
  

func _on_Button_pressed():
	get_tree().paused=false
	set_visible(false)
	


func _on_Button2_pressed():
	get_tree().quite()
	pass # Replace with function body.
