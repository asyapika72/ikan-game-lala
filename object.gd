extends Area2D

@export var fall_speed: float = 300.0
@export var rotation_speed: float = 5.0   # radians per second

func _process(delta):
	position.y += fall_speed * delta
	rotation += rotation_speed * delta
