extends Node
@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit():
	var velocity = Vector2.ZERO

func _on_start_timer_timeout():
	$MobTimer.start()

func new_game():
	$player.start($StartPosition.position)
	$StartTimer.start()



func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	#choose random location on Path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	#set mob's direction perpendicular to path direction
	var direction = mob_spawn_location.rotation + PI/2
	
	
	#set mob's position to random location
	mob.position = mob_spawn_location.position
	
	
	#add randomness to direction
	direction += randf_range(0, PI) 
	#mob.rotation = direction

	
	#choose velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0),0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	#spawn mob by adding it to Main scene
	add_child(mob)



