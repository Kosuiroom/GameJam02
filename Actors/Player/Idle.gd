extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.velocity.y > 0.0 and not player.is_on_floor():
		state_machine.transition_to("Air")
		return

	if Input.is_action_just_pressed("Jump"):
		state_machine.transition_to("Jump", {do_jump = true})
	elif Input.is_action_pressed("mvLeft") or Input.is_action_pressed("mvRight"):
		state_machine.transition_to("Run")
