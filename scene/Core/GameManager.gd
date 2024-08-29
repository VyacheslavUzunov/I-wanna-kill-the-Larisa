extends Node

signal gained_coins(int)

var coins

var curren_checkpoint : Checkpoint

var player : Player


func respawn_player():
	if curren_checkpoint != null:
		player.position = curren_checkpoint.global_position
		
func gain_coins(coins_gained):
	coins += coins_gained
	emit_signal("gained_coins", coins_gained)
