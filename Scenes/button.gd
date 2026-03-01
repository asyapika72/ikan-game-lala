extends Button

func _on_pressed() -> void:
	get_tree().reload_current_scene()


func _on_button_2_pressed() -> void:
	get_tree().quit()
