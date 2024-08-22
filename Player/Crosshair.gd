@tool
extends Control

func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2(0,16), Color.AQUA,1)
	draw_circle(Vector2.ZERO, 3.0, Color.AQUA)
	draw_circle(Vector2.ZERO, 4, Color.MEDIUM_AQUAMARINE)
	draw_arc(Vector2.ZERO, 16, 0, PI, 64, Color.AQUA)

