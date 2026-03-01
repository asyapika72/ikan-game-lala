extends CharacterBody2D

@export var speed: float = 500.0
@export var jump_force: float = -500.0
@export var gravity: float = 1200.0

@onready var sprite = $SpriteAnime
@onready var effect = $Effect

func _ready():
	sprite.play("default") 

func _physics_process(delta: float) -> void:
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
		effect.play()

	# Left / Right movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * speed
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
