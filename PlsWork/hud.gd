extends CanvasLayer
signal pressed_tag
signal message_disappear
@onready var PauseMenu = $PauseMenu
#@onready var player_animation = get_parent().get_node("player")
var score = 100
var coins = Global.coins

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug("node: ", get_parent().get_node("/root/Global").get_path())
	if Input.is_action_pressed("ui_cancel"):
		PauseMenu.visible = true
		get_tree().paused = true
 
func _on_tag_button_pressed():
	$MessageTimer.start()
	if Global.check == true:
		$Tick.show()
		$ScoreTimer.stop()
		$TagButton.hide()
		coins += score
		Global.coins = coins
		
	else:
		$Cross.show()

func _on_message_timer_timeout():
	message_disappear.emit()

func _on_score_timer_timeout():
	score -= 1
	update_score(score)
	if score == 0:
		$Score.text = "times up!"

func update_score(score):
	$Score.text = str(score)
	Global.score = score

func _on_resume_button_pressed():
	PauseMenu.visible = false
	get_tree().paused = false

func _on_exit_button_pressed():
	get_tree().quit()


func _on_pause_button_pressed():
	get_tree().paused = true
	PauseMenu.visible = true


func _on_back_to_main_pressed():
	get_tree().paused = false
	update_score(coins)
	get_tree().change_scene_to_file("res://start_menu.tscn")
	
