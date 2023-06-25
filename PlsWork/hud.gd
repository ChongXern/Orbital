extends CanvasLayer
signal pressed_tag
signal message_disappear
@onready var PauseMenu = $PauseMenu
var lionDistance: int

@onready var player_animation = get_parent().get_node("player")
var score = 60
var coins = Global.coins

# Called when the node enters the scene tree for the first time.
func _ready():
	$blackRect.hide()
	$gameOverPanel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug("node: ", get_parent().get_node("/root/Global").get_path())
	if Input.is_action_pressed("ui_cancel"):
		PauseMenu.visible = true
		get_tree().paused = true
<<<<<<< HEAD
		$distanceToLion.text = str(lionDistance / 60, "m")
 
=======
	$distanceToLion.text = str(lionDistance / 60, " m")

>>>>>>> 9d7cc9bc8a4921ab438a1ecaa1ed7e1fa88ff028
func _on_tag_button_pressed():
	$MessageTimer.start()
	if Global.check == true:
		$blackRect.show()
		$Tick.show()
		$ScoreTimer.stop()
<<<<<<< HEAD
		$TagButton.hide()
		get_tree().paused = true
		await get_tree().create_timer(3).timeout
		#show game over
		$gameOverPanel.show()
		coins += score
		Global.coins = coins
		
=======
		get_tree().paused = true
		await get_tree().create_timer(3).timeout
		#show game over
		$Tick.hide()
		$gameOverPanel.show()
>>>>>>> 9d7cc9bc8a4921ab438a1ecaa1ed7e1fa88ff028
	else:
		$Cross.show()

func _on_message_timer_timeout():
	message_disappear.emit()

func _on_score_timer_timeout():
	score -= 1
	$Score.text = str(score)
	if score == 0:
		$Score.text = "times up!"
		$Coin.hide()
<<<<<<< HEAD
		get_tree().paused = false
		get_tree().change_scene_to_file("res://game_over.tscn")


func update_score(score):
	$Score.text = str(score)
	Global.score = score
=======
		$blackRect.show()
		get_tree().paused = true
		$gameOverPanel.show()

>>>>>>> 9d7cc9bc8a4921ab438a1ecaa1ed7e1fa88ff028

func _on_resume_button_pressed():
	PauseMenu.visible = false
	get_tree().paused = false

func _on_exit_button_pressed():
	get_tree().quit()

func _on_pause_button_pressed():
	get_tree().paused = true
	PauseMenu.visible = true

<<<<<<< HEAD

func _on_back_to_main_pressed():
	get_tree().paused = false
	update_score(coins)
	get_tree().change_scene_to_file("res://start_menu.tscn")

func _on_world_branch_4_lion_distance(distance):
	lionDistance = distance - 500
=======
func _on_world_branch_4_lion_distance(distance):
	lionDistance = distance - 500

func _on_quit_button_pressed():
	get_tree().quit()

func _on_try_again_button_pressed():
	get_tree().reload_current_scene()
>>>>>>> 9d7cc9bc8a4921ab438a1ecaa1ed7e1fa88ff028
