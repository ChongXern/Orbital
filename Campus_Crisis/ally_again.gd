extends Node2D
signal hit
signal exit
@export var speed = 300

func _ready():
	pass

func _process(delta):
	$AnimatedSprite2D.play()
	#ally moves along the path

	get_parent().set_progress(get_parent().get_progress() + speed * delta)

func _on_body_entered(body):
	Global.check = true
	hit.emit()
	print_debug("hit.emit()")


func _on_body_exited(body):
	exit.emit()
	print_debug("exit.emit()")
	
