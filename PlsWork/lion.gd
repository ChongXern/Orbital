extends CharacterBody2D
@export var speed = 125;
var player_chase = false
var player_body = null

func _physics_process(delta):
	#position += speed
	$AnimatedSprite2D.play("lion running")
	if player_chase:
		position += (player_body.position - position) / speed
		if position < player_body.position:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("lion running")

func _on_detection_area_body_exited(body):
	player_body = null
	player_chase = false


func _on_detection_area_body_entered(body):
	player_body = body
	player_chase = true
