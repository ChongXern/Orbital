extends Area2D
signal hit
signal exit
@export var speed = 400

func _ready():
	pass

func _physics_process(delta):
	$AnimatedSprite2D.play()
	Global.check = false
	#npc moves along the path
	get_parent().set_progress(get_parent().get_progress() + speed * delta)

func _on_body_entered(body):
	hit.emit()


func _on_body_exited(body):
	exit.emit()
