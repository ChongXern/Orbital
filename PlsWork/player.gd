class_name Player extends CharacterBody2D

@export var speed = 600
# var screen_size
var current_dir = "none"
signal killed
var currentWeapon = "none"
var isSpray = false
var isTorch = false
var isHorn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("running")

func compute_animation(current_dir):
	var anim = $AnimatedSprite2D
	anim.play("running")
	if current_dir == "right":
		anim.flip_h = true
	else:
		anim.flip_h = false

func handleInput():
	if Input.is_action_just_pressed("left"):
		current_dir = "left"
	elif Input.is_action_just_pressed("right"):
		current_dir = "right"
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
	velocity = moveDirection.normalized() * speed

func _physics_process(delta):
	handleInput()
	var velocity = Vector2.ZERO
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	compute_animation(current_dir)
	move_and_slide()

func die():
	killed.emit()

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
