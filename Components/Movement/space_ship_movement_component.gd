# must be attached to CharacterBody2D
class_name SpaceShipMovementComponent
extends Node

@export var actor: CharacterBody2D
@export var acceleration: float = 10.0
@export var max_speed: float = 100.0
@export var rotation_speed: float = 100.0
@export var slow_down_speed: float = 1

func _physics_process(delta):
	var input_vector = Vector2()
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	actor.velocity += input_vector.rotated(actor.rotation) * acceleration
	actor.velocity = actor.velocity.limit_length(max_speed)

	var input_rotation = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	actor.rotate(deg_to_rad(input_rotation * rotation_speed * delta))
	
	if input_vector.y == 0:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, slow_down_speed)

	actor.move_and_slide()
