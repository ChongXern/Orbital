extends Area2D
signal picked_up

func _on_body_entered(body):
	print_debug("spray picked up")
	picked_up.emit()
