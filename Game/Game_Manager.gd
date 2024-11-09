extends Node


@export var score = 0
@export var level = 0
@export var camera: Camera2D
@export var scoreLabel: Label
@export var spawner: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = 0
	score = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score = -camera.position.y
	scoreLabel.text = "Score: " + str(score).pad_decimals(0)
	if score > 200:
		level = 1
	if score > 400:
		level = 2
	if score > 600:
		level = 3
	_levelAnnouncer(level)
	pass

func _levelAnnouncer(lvl: int) -> void:
	spawner.switchTo(lvl)
	pass
	
