class_name Player
extends KinematicBody2D
###Node initialization
onready var fsm := $StateMachine

###Player stats
var velocity
export var PlayerSpeed := 200.0
export var PlayerJump := 300.0
export var gravity = 500
