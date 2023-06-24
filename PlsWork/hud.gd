extends CanvasLayer
signal pressed_tag
signal message_disappear
@onready var PauseMenu = $PauseMenu
var lionDistance

#@onready var player_animation = get_parent().get_node("player")
var score = 60

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

func _on_tag_button_pressed():
	$MessageTimer.start()
	if Global.check == true:
		$blackRect.show()
		$Tick.show()
		$ScoreTimer.stop()
		get_tree().paused = true
		#show game over
		$Tick.hide()
		$gameOverPanel.show()
	else:
		$Cross.show()

func _on_message_timer_timeout():
	message_disappear.emit()

func _on_score_timer_timeout():
	score -= 1
	$distanceToLion.text = str(lionDistance / 60, " m")
	$Score.text = str(score)
	if score == 0:
		$Score.text = "times up!"
		$Coin.hide()
		$blackRect.show()
		get_tree().paused = true
		$gameOverPanel.show()


func _on_resume_button_pressed():
	PauseMenu.visible = false
	get_tree().paused = false

func _on_exit_button_pressed():
	get_tree().quit()

func _on_pause_button_pressed():
	get_tree().paused = true
	PauseMenu.visible = true

func _on_world_branch_4_lion_distance(distance):
	lionDistance = distance - 500

func _on_quit_button_pressed():
	get_tree().quit()

func _on_try_again_button_pressed():
	get_tree().reload_current_scene()
