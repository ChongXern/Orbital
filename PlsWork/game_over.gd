extends Control

func _on_try_again_button_pressed():
	#get_parent().get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
