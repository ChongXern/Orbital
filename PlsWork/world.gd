extends Node2D
var score
var player = null
var player_animation = player/AnimatedSprite2D

@onready var hud = $hud
@onready var game_over = $game_over
# Called when the node enters the scene tree for the first time.
func _ready():
	$hud/TagButton.hide() 
	$hud/Tick.hide()
	$hud/Cross.hide()
	$hud/PauseMenu.hide()
	$hud/ScoreTimer.start()
	$player/GPUParticles2D.hide()
	$hud/torchButton.disabled = true
	$hud/sprayButton.disabled = true
	$hud/hornButton.disabled = true
	$hud/torchButton.hide()
	$hud/sprayButton.hide()
	$hud/hornButton.hide()
	score = 60
	#player.killed.connect(_on_player_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#shows tag button on collition with any npc/ally
func _on_ally_hit():
	$hud/TagButton.show()

#shows the respective outcomes of tagging any npc/ally
func _on_hud_pressed_tag():
	$hud._on_tagged_button_pressed()

func _on_ally_exit():
	$hud/TagButton.hide()

func _on_hud_message_disappear():
	$hud/Cross.hide()

func _on_score_timer_timeout():
	Global

func _on_player_killed():
	await get_tree().create_timer(1.5).timeout
	game_over.visible = true
	

#torch is picked up
func _on_pick_up_torch_picked_up():
	#item disappears and collision is disabled
	get_node("weapons to pick up/pick up torch").visible = false
	get_node("weapons to pick up/pick up spray/CollisionShape2D").disabled = true
	#make weapons buttons appear
	$hud/torchButton.disabled = false
	$hud/torchButton.visible = true


func _on_torch_button_pressed():
	pass # Replace with function body.


func _on_spray_button_pressed():
	pass # Replace with function body.


func _on_horn_button_pressed():
	pass # Replace with function body.
