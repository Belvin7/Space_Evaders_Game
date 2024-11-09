extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var camera: Camera2D



func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction := Input.get_axis("ui_left", "ui_right")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vertical_direction := Input.get_axis("ui_down", "ui_up")
	if vertical_direction:
		velocity.y = (-vertical_direction) * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		
	#get the viewport size and divide by 2 since this is where the camera is positioned
	var view = get_viewport_rect().size / 2

	#get the camera position
	var camera_pos = camera.global_position

	var bounds_up = camera_pos.y - view.y
	var bounds_down = camera_pos.y + view.y
	
	var bounds_right = camera_pos.x + view.x
	var bounds_left = camera_pos.x - view.x
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.is_in_group("meteor"): # Fiters for meteors
			#print("Collided with: ", collision.get_collider().name)
			collider.queue_free() # Deletes Meteor on collision
	

	#after the character is moved clamp its position to the end of the camera bounds
	global_position.y = clamp(global_position.y, bounds_up, bounds_down)
	global_position.x = clamp(global_position.x, bounds_left, bounds_right)
