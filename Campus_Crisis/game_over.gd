extends Control

func _on_try_again_button_pressed():
	get_parent().get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
