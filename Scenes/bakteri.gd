extends Area2D
class_name bakteri
@export var speedy: float = 200.0
@export var spinny: float = 5.0
@export var type: String
@onready var spritey: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += delta * speedy
	spritey.rotation += delta * spinny
	blud_offscreen()
	
func blud_offscreen() -> void:
	if position.y > 1000.0:
		var main = get_tree().get_current_scene()
		main.decrease_health()
		queue_free()

func _on_body_entered(body) -> void:
	if body.name == "Player":
		var main = get_tree().get_current_scene()
		main.add_point()
		queue_free()
		
