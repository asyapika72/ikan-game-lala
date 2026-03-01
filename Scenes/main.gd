extends Node2D

const object_scene = preload("uid://q6kd56gw6f74")
const MARGIN = 90.0
@onready var spawn_timer: Timer = $Timer
@onready var music = $BGM

func spawn() -> void:
	var bakteriyaya: bakteri = object_scene.instantiate()
	bakteriyaya.position = Vector2(randf_range(MARGIN, 1366 - MARGIN), -50)
	bakteriyaya.scale = Vector2(0.2, 0.2)
	add_child(bakteriyaya)


func _on_timer_timeout() -> void:
	spawn()

var score: int = 0
var health: float = 100.0
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var health_bar: ProgressBar = $CanvasLayer/ProgressBar

func add_point():
	score += 1
	score_label.text = str(score)

func decrease_health():
	health -= 20
	health_bar.value = float(health)
	if health <= 0:
		gameyoveru()
	
func increase_health():
	health += 10
	health_bar.value = float(health)

func gameyoveru():
	get_tree().change_scene_to_file("uid://dqnng8rsavyqk")
	music.playing = false
