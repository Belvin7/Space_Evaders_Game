extends RigidBody2D

var speed = 300
var startPos = 0
var move_direction = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity = move_direction.normalized() * speed * delta
	move_and_collide(linear_velocity)
	if position.distance_to(startPos) > 2500:
		queue_free()
	pass
