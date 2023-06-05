extends CanvasLayer
signal pressed_tag

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _on_message_timer_timeout():
	pass

func _on_tag_button_pressed():
	show_message("found ally!")
	await $MessageTimer.timeout
