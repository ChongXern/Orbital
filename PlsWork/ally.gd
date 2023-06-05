extends RigidBody2D
signal hit
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vector = Vector2.ZERO
	#restrict within frame
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_area_2d_body_entered(body):
	hit.emit()
