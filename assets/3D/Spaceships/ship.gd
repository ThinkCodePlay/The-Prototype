extends CharacterBody3D

@export var max_speed: float = 50
@export var acceleration: float = 0.6
@export var pitch_speed: float = 1.5
@export var roll_speed: float = 1.9
@export var yaw_speed: float = 0.7
@export var input_response = 8.0

var vel: Vector3 = Vector3.ZERO
var forward_speed: float = 0.0
var pitch_input: float = 0.0
var roll_input: float = 0.0
var yaw_input: float = 0.0

func get_input(delta):
	if Input.is_action_pressed("throttle_up"):
		forward_speed = lerp(forward_speed, max_speed, acceleration * delta)
	elif Input.is_action_pressed("throttle_down"):
		forward_speed = lerp(forward_speed, -max_speed / 2, acceleration * delta)
	else:
		forward_speed = lerp(forward_speed, 0.0, acceleration * delta)
	pitch_input = lerp(pitch_input, Input.get_action_strength("pitch_up") - Input.get_action_strength("pitch_down"), input_response * delta)
	roll_input = lerp(roll_input, Input.get_action_strength("roll_left") - Input.get_action_strength("roll_right"), input_response * delta)
	yaw_input = lerp(yaw_input, Input.get_action_strength("yaw_right") - Input.get_action_strength("yaw_left"), input_response * delta)
	
func _physics_process(delta):
	get_input(delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x, pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.z, roll_input * roll_speed * delta)
	transform.basis = transform.basis.orthonormalized()
	vel = transform.basis.y * forward_speed
	move_and_collide(vel * delta)
