# Air.gd
extends PlayerState

# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.PlayerJump

func physics_update(delta: float) -> void:

	var input_direction_x: float = (
		Input.get_action_strength("mvRight")
		- Input.get_action_strength("mvLeft")
	)
	player.velocity.x = player.PlayerSpeed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	# Landing.
	if player.is_on_floor():
		print("is on floor")
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
