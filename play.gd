extends Control



func _on_play_pressed():
	get_tree().change_scene("res://world.tscn")
	
	
	


func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	get_tree().change_scene("res://settings.tscn")
