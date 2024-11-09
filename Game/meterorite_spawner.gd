extends Node2D

var meteorite = preload("res://Game/meteorite.tscn")
@export var camera: Camera2D

var spawn_threshold = 2
var spawn_bucket = 0
var spawn_rate = 4
var rng = RandomNumberGenerator.new()
var mslvl = 0
@export var spawn_radius: float = 600.0
var min_angle: float = -135
var max_angle: float = -45

var bounds_right = 0
var bounds_left = 0
var bounds_up = 0
var bounds_down = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var view = get_viewport_rect().size / 2
	var camera_pos = camera.global_position
	bounds_right = camera_pos.x + view.x
	bounds_left = camera_pos.x - view.x
	bounds_up = camera_pos.y - view.y
	bounds_down = camera_pos.y + view.y
	if spawn_bucket>spawn_threshold:
		spawn_bucket = 0
		spawn_object_on_circle()
		
	spawn_bucket += spawn_rate * delta
	pass
	
func spawnMeteor(position_sp: Vector2) -> void:
	var object_to_spawn = meteorite.instantiate()
	object_to_spawn.position = position_sp
	object_to_spawn.rotation = rng.randf_range(0, 2 * PI)
	var moved_center = get_camera_screen_center() + Vector2(rng.randf_range(-100,100),rng.randf_range(-100,100))
	object_to_spawn.move_direction = moved_center-position_sp
	call_deferred("add_child",object_to_spawn)

func switchTo(lvl: int) -> void:
	print("pass to meteor spawner: " + var_to_str(lvl))
	mslvl = lvl
	print(change_radius_based_on_lvl())
	pass

func change_radius_based_on_lvl() -> String:
	var hallo = "fuck this"
	match mslvl:
		0:
			hallo = "fuck1"
			return hallo
			min_angle = -135
			max_angle -45
		1:
			return hallo
			min_angle = -45
			max_angle = 45
		2:
			hallo = "fuc3"
			return hallo
			min_angle = 135
			max_angle = 4
		_:
			print("hallo")
	return hallo	

func spawn_object_on_circle():
	# Calculate the center of the camera
	var camera_center = get_camera_screen_center()

	# Generate a random angle within the specified range
	var random_angle = deg_to_rad(rng.randf_range(min_angle, max_angle))

	# Calculate the position on the circle
	var spawn_x = camera_center.x + spawn_radius * cos(random_angle)
	var spawn_y = camera_center.y + spawn_radius * sin(random_angle)
	var spawn_position = Vector2(spawn_x, spawn_y)
	spawnMeteor(spawn_position)

func get_camera_screen_center() -> Vector2:
	return Vector2((bounds_right+bounds_left)/2,(bounds_up+bounds_down)/2)
