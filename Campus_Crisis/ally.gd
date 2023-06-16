extends CharacterBody2D
signal hit
signal exit
@export var speed = 400


func _ready():
	pass

func _physics_process(delta):
	$AnimatedSprite2D.play()
	#ally moves along the path
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	


func _on_area_2d_body_entered(body):
	Global.check = true
	hit.emit()



func _on_area_2d_body_exited(body):
	exit.emit()
