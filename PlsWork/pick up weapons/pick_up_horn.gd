extends Area2D
signal picked_up
var weaponUsed = false

func _ready():
	$"spinning star".play("spinning star thing")

func _on_body_entered(body):
	if not weaponUsed:
		print_debug("horn picked up")
		queue_free()
		weaponUsed = true
		picked_up.emit()
