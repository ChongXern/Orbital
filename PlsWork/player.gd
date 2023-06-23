class_name Player extends CharacterBody2D

@export var speed = 600
# var screen_size
var current_dir = "left"
signal killed
var currentWeapon = "none"
var started_game = false
var stopped = false
var isSpray = false
var isTorch = false
var isHorn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D/particles_left.emitting = false
	$AnimatedSprite2D/particles_right.emitting = false
	var moveDirection = Vector2.ZERO
	moveDirection.x -= 1
	velocity = moveDirection.normalized() * speed

func compute_animation(current_dir):
	var anim = $AnimatedSprite2D
	if not(isTorch or isSpray or isHorn):
		if stopped:
			if current_dir == "right":
				anim.flip_h = true
			elif current_dir == "left":
				anim.flip_h = false
			anim.play("idle")
		elif started_game:
			anim.play("running")
			if current_dir == "right":
				anim.flip_h = true
			else:
				anim.flip_h = false
		else:
			anim.play("running")
			move_body("left")
	
func move_body(current_dir):
	var moveDirection = Vector2.ZERO
	if Input.is_action_pressed("up"):
		moveDirection.y -= 1
	elif Input.is_action_pressed("down"):
		moveDirection.y += 1
	if current_dir == "left":
		moveDirection.x -= 1
	elif current_dir == "right":
		moveDirection.x += 1
	velocity = moveDirection.normalized() * speed
	#move_and_slide()

func handleInput():
	if Input.is_action_just_pressed("left"):
		stopped = false
		started_game = true
		current_dir = "left"
	elif Input.is_action_just_pressed("right"):
		stopped = false
		started_game = true
		current_dir = "right"
	elif Input.is_action_just_pressed("stop"):
		stopped = true
	var moveDirection = Vector2.ZERO
	move_body(current_dir)
	if stopped:
		moveDirection.x = 0
		moveDirection.y = 0
		if Input.is_action_pressed("up"):
			stopped = false
			moveDirection.y -= 1
		elif Input.is_action_pressed("down"):
			stopped = false
			moveDirection.y += 1
		velocity = moveDirection.normalized() * speed


func _physics_process(delta):
	handleInput()
	compute_animation(current_dir)
	move_and_slide()

func die():
	killed.emit()

func _on_torch_button_pressed():
	isTorch = true
	stopped = true
	print_debug("torch picked")
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("fire_torch")
	await get_tree().create_timer(3).timeout
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("running")
	isTorch = false
	stopped = false

func _on_spray_button_pressed():
	isSpray = true
	stopped = true
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("pepper_spray_up")
	await get_tree().create_timer(0.267).timeout
	var spray_particle
	if ($AnimatedSprite2D.flip_h):
		spray_particle = $AnimatedSprite2D/particles_right
	else:
		spray_particle = $AnimatedSprite2D/particles_left
	spray_particle.emitting = true
	$AnimatedSprite2D.play("pepper_spray_idle")
	await get_tree().create_timer(2.466).timeout
	$AnimatedSprite2D.play("pepper_spray_down")
	await get_tree().create_timer(0.267).timeout
	spray_particle.emitting = false
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("running")
	isTorch = false
	stopped = false
