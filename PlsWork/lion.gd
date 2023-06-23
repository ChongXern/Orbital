# temporarily useless
extends CharacterBody2D
@export var speed = 600;
#var player_chase = false
#var player_body = null


var playerPos
var targetPos
#@onready var controlSample = get_node("../player")


#func _physics_process(delta):
#	print_debug(player.position)
'''
	#position += speed
	$AnimatedSprite2D.play("lion running")
	playerPos = player.position
	targetPos = (playerPos - position).normalized()
	if position.distance_to(playerPos) > 3:
		velocity = targetPos * speed
		move_and_slide()
'''
'''
	if player_chase:
		position += (player_body.position - position) / speed
		if position < player_body.position:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("lion running")'''
	#print_debug(player_body.position)

'''
func _on_detection_area_body_exited(body):
	player_body = null
	player_chase = false

func _on_detection_area_body_entered(body):
	player_body = body
	player_chase = true'''

