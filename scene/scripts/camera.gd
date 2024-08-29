extends Node2D


func _on_area_2d_2_body_entered(body):
	if body.name == "Larisa(player)":
		$Camera2D.make_current()
