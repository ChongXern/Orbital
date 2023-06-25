extends Control

func _on_try_again_button_pressed():
<<<<<<< HEAD:PlsWork/game_over.gd
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://world.tscn")
=======
	get_parent().get_tree().reload_current_scene()
>>>>>>> 9d7cc9bc8a4921ab438a1ecaa1ed7e1fa88ff028:Campus_Crisis/game_over.gd

func _on_quit_button_pressed():
	get_tree().quit()
