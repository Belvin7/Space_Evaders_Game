extends RigidBody2D

var startPos = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.distance_to(startPos) > 1400:
		queue_free()
	pass
