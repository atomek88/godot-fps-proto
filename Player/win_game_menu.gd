extends Control

@export var next_level_path: String = "res://Levels/Sandbox.tscn"

func win_game() -> void:
	get_tree().paused = true
	visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pass

func _on_restart_button_pressed() -> void:

	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_sandbox_button_pressed() -> void:
	# Load the new scene
	get_tree().paused = false
	var error = get_tree().change_scene_to_file(next_level_path)
	#error != OK:
		#push_error("An error occurred while trying to load the next level.")
