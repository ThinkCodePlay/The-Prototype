class_name MoveComponent
extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var rotate: float = 0.0

func _process(delta):
	actor.translate(velocity * delta)
	actor.rotate(rotate * delta)
