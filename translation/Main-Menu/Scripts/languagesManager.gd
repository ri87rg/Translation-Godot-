extends Control

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Main-Menu/Settings/options.tscn")


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Quiz-Homescreen/Quiz.tscn")
