extends Node2D
signal hit
signal exit
signal ally_tagged(tagged: bool)
@export var speed = 400

func _ready():
	pass

func _process(delta):
	$AnimatedSprite2D.play()
	#ally moves along the path

	get_parent().set_progress(get_parent().get_progress() + speed * delta)

func _on_body_entered(body):
	Global.check = true
	hit.emit()
	ally_tagged.emit(true)
	print_debug("hit.emit()")


func _on_body_exited(body):
	exit.emit()
	print_debug("exit.emit()")
	
