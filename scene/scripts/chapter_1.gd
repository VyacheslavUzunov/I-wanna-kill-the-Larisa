extends Node2D
@onready var larisa = $"Larisa(player)"
@onready var colorRect = $ColorRect


func _on_start_timeout():
	colorRect.visible = true
	larisa.visible = true
	#$Timer.start()
	

func change_sprite():
	var texture = load('res://sprite/bg/chapter1 changed.png')
	$Chap1Start.texture = texture
	 
	
func _on_timer_timeout(): 
	colorRect.visible = false
	change_sprite()
