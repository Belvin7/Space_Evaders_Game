extends RigidBody2D

var speed = 40
var startPos = 0
var direction = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity = direction * delta
	if position.distance_to(startPos) > 2500:
		queue_free()
	pass
