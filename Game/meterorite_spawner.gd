extends Node2D

var meteorite = preload("res://Game/meteorite.tscn")
@export var camera: Camera2D

var spawn_threshold = 2
var spawn_bucket = 0
var spawn_rate = 4
var rng = RandomNumberGenerator.new()
var lvl = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn_bucket>spawn_threshold:
		spawn_bucket = 0
		spawnMeteor()
		
		
		
	spawn_bucket += spawn_rate * delta
	pass
	
func spawnMeteor() -> void:
	var object_to_spawn = meteorite.instantiate()
	var view = get_viewport_rect().size / 2
	var camera_pos = camera.global_position
	var bounds_right = camera_pos.x + view.x
	var bounds_left = camera_pos.x - view.x
	var bounds_up = camera_pos.y - view.y
	var position = rng.randf_range(bounds_left, bounds_right)
	object_to_spawn.position.x = position
	object_to_spawn.position.y = bounds_up - 200
	object_to_spawn.rotation = rng.randf_range(0, 2 * PI)
	object_to_spawn.gravity_scale = rng.randf_range(0.15, 0.5)
	call_deferred("add_child",object_to_spawn)

func switchTo(lvl: int) -> void:
	print("pass to meteor spawner: " + var_to_str(lvl))
	pass
