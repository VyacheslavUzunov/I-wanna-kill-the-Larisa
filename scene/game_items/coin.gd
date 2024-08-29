extends Node2D


func _on_area_2d_body_entered(body):
	GameManager.gain_coins(1)
	queue_free()
