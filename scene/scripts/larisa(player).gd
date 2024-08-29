extends CharacterBody2D
class_name Player


const SPEED = 160.0
const JUMP_VELOCITY = -260.0
var jump_const = 1
var jump_count = 0
var last_checkpoint = null
@onready var animated_sprite = $AnimatedSpriteLarisa

func _ready():
	GameManager.player = self

func kill():
	$CPUParticles2D.emitting = true
	$deathmatch.start()
	$AnimatedSpriteLarisa.visible = false
	set_physics_process(false)
	
func _on_deathmatch_timeout():
	$AnimatedSpriteLarisa.visible = true
	set_physics_process(true)
	GameManager.respawn_player()


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and jump_count < jump_const:
		jump_count += 1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		jump_count = 0
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run_right")
	elif direction == 0:
		animated_sprite.play("jump")
	else:
		animated_sprite.play("jump_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		


	move_and_slide()
