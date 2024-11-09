extends Node


@export var score = 0
@export var level = 0
@export var camera: Camera2D
@export var scoreLabel: Label
@export var spawner: Node2D
var dmg = 0
var score_reduction = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = 0
	score = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score = -camera.position.y - score_reduction
	var raw_score = -camera.position.y
	scoreLabel.text = "Score: " + str(score).pad_decimals(0)
	if int(raw_score) % 400 == 0 && raw_score > 10 && level == 0:
		level = 1
	elif int(raw_score) % 400 == 0 && raw_score > 10 && level == 1:
		level = 2
	elif int(raw_score) % 400 == 0 && raw_score > 10 && level == 2:
		level = 0
	_levelAnnouncer(level)
	
	if dmg > 10:
		get_tree().quit() # TODO: change this to when you die
	pass

func _levelAnnouncer(lvl: int) -> void:
	spawner.switchTo(lvl)
	pass

func dmgf() -> void:
	dmg+=1
	score_reduction += 50
	pass
