extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/Toby_Testscene.tscn")


func on_options_pressed() -> void:
	print(" options pressed ")


func on_exit_pressed() -> void:
	get_tree().quit()
