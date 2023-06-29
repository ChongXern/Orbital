extends Control
@export var scene:String = "res://world.tscn"
@onready var progress_bar:ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0

func _ready():
	ResourceLoader.load_threaded_request(scene)
	$AnimatedSprite2D.play()

func _process(delta):
	'''scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	print(scene_load_status)
	progress_bar.value = progress[0] * 100
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_file("res://world.tscn")
		queue_free()'''
	while scene_load_status != 1:
		await get_tree().create_timer(0.5).timeout
		scene_load_status += 0.125
		progress_bar.value += 12.5
	if scene_load_status == 1:
		get_tree().change_scene_to_file("res://world.tscn")
		queue_free()
