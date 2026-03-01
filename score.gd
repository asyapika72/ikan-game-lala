extends Node2D

var score: int = 0

@onready var score_label = $score

func _on_pipe_passed():
	score += 1
	score_label.text = str(score)
