class_name Player extends CharacterBody2D

@export var speed = 600
# var screen_size
var current_dir = "none"
signal killed
var currentWeapon = "none"
var stopped = false
var isSpray = false
var isTorch = false
var isHorn = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var moveDirection = Vector2.ZERO
	moveDirection.x -= 1
	velocity = moveDirection.normalized() * speed
	$AnimatedSprite2D/GPUParticles2D.hide()
	#move_and_slide()

func compute_animation(current_dir):
	var anim = $AnimatedSprite2D
	if not(isTorch or isSpray or isHorn):
		if stopped:
			if current_dir == "right":
				anim.flip_h = true
			elif current_dir == "left":
				anim.flip_h = false
			anim.play("idle")
		else:
			anim.play("running")
			if current_dir == "right":
				anim.flip_h = true
			else:
				anim.flip_h = false
	

func handleInput():
	if Input.is_action_just_pressed("left"):
		stopped = false
		current_dir = "left"
	elif Input.is_action_just_pressed("right"):
		stopped = false
		current_dir = "right"
	elif Input.is_action_just_pressed("stop"):
		stopped = true
	var moveDirection = Vector2.ZERO
	if current_dir == "left":
		if Input.is_action_pressed("up"):
			moveDirection.y -= 1
		elif Input.is_action_pressed("down"):
			moveDirection.y += 1
		moveDirection.x -= 1
	elif current_dir == "right":
		if Input.is_action_pressed("up"):
			moveDirection.y -= 1
		elif Input.is_action_pressed("down"):
			moveDirection.y += 1
		moveDirection.x += 1
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
	$AnimatedSprite2D.play("running")
	var moveDirection = Vector2.ZERO
	if current_dir == "left":
		moveDirection.x -= 1
	elif current_dir == "right":
		moveDirection.x += 1
	velocity = moveDirection.normalized() * speed
	move_and_slide()

func _on_spray_button_pressed():
	isSpray = true
	stopped = true
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("pepper_spray_up")
	await get_tree().create_timer(0.267).timeout
	$AnimatedSprite2D.play("pepper_spray_idle")
	$AnimatedSprite2D/GPUParticles2D.show()
	await get_tree().create_timer(3).timeout
	$AnimatedSprite2D.play("pepper_spray_down")
	await get_tree().create_timer(0.267).timeout

#old code
'''class_name Player extends CharacterBody2D

@export var speed = 400
# var screen_size
var current_dir = "none"
signal killed

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("running")
	# screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.

func compute_animation(current_dir):
	var anim = $AnimatedSprite2D
	anim.play("running")
	if current_dir == "right":
		anim.flip_h = true
	else:
		anim.flip_h = false

func handleInput():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("right"):
		current_dir = "right"
		velocity.x += 1
	if Input.is_action_pressed("left"):
		current_dir = "left"
		velocity.x -= 1
	compute_animation(current_dir)

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	# else:
		# $AnimatedSprite2D.stop()
	# position += velocity * delta
	# position.x = clamp(position.x, 0, screen_size.x)
	# position.y = clamp(position.y, 0, screen_size.y)
	handleInput()
	move_and_slide()

func die():
	killed.emit()'''
