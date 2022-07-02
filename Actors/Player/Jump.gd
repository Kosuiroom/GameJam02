extends PlayerState
var rotationspeed = 2
var rotaion_dir = 0

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = player.jump_velocity

func physics_update(delta: float) -> void:
	player.velocity.y += player.get_gravity() * delta

	var input_direction_x: float = (
		Input.get_action_strength("mvRight")
		- Input.get_action_strength("mvLeft")
	)

#	if Input.is_action_pressed("mvRight"):
#		rotaion_dir += 1
#	if Input.is_action_pressed("mvLeft"):
#		rotaion_dir -= 1
#
#	player.rotation_degrees = rotaion_dir * rotationspeed
	
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.is_on_floor():
		print("is on floor")
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
