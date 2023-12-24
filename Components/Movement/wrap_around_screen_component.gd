# must be attached to CharacterBody2D
class_name WrapAroundWorldComponent
extends Node

@export var actor: CharacterBody2D

func _physics_process(delta):
	# Wrap around screen
	var screen_size = get_viewport().get_visible_rect().size
	if actor.position.x < 0:
		actor.position.x = screen_size.x
	elif actor.position.x > screen_size.x:
		actor.position.x = 0
	if actor.position.y < 0:
		actor.position.y = screen_size.y
	elif actor.position.y > screen_size.y:
		actor.position.y = 0
