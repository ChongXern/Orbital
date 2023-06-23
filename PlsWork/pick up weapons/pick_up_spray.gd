extends Area2D
signal picked_up
var weaponUsed = false

func _on_body_entered(body):
	if not weaponUsed:
		print_debug("spray picked up")
		$CollisionShape2D.set_disabled(false)
		picked_up.emit()
		weaponUsed = true
