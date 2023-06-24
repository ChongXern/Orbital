extends Node2D
var score
var Coins

func _ready():
	update_coins(Coins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_coins(Coins):
	$Coins.text = str(Global.coins)
	

func _on_clb_level_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
