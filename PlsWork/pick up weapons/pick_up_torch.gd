extends Area2D
signal picked_up
var weaponUsed = false

func _on_body_entered(body):
	if not weaponUsed:
		print_debug("torch picked up")
		var collision_shape = $CollisionShape2D
		collision_shape.set_disabled(false)
		weaponUsed = true
		picked_up.emit()
