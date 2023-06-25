<<<<<<< HEAD
extends Label
#notifies main node that button has been pressed
signal pressed_tag
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_found_ally():
	show_message("found ally!")
	await $MessageTimer.timeout

func _on_message_timer_timeout():
	pass




func _on_pressed_tag():
	show_found_ally()
=======

>>>>>>> origin/testing
