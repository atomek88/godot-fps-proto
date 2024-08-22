extends Area3D

@export var game_over_menu: Control
@export_file('*.tscn') var file_path

func _ready():
	# Connect the body_entered signal to our _on_body_entered function
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	print('entered ', body)
	if body.is_in_group("player"):
		game_over_menu.win_game()
