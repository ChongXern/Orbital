extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$hud/TagButton.hide() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_ally_hit():
	$hud/TagButton.show()
	

func _on_hud_pressed_tag():
	$hud._on_tagged_button_pressed()



