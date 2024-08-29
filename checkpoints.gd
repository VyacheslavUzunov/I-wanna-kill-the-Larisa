extends Node2D
class_name Checkpoint

@export var spawnpoint = false

var activated = false


func _ready():
	$AnimatedSprite2D.play("start")

func activate(body):
	if body.last_checkpoint != null:
		body.last_checkpoint.desactivate()
	body.last_checkpoint = self
	$AnimatedSprite2D.play("actived")
	GameManager.curren_checkpoint = self
	activated = true


func _on_area_2d_body_entered(body):
	if body.name == "Larisa(player)" && !activated:
		activate(body)

func desactivate():
	$AnimatedSprite2D.play("start")
	activated = false
