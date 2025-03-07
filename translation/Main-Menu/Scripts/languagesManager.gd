extends Control
@onready var quit: Button = $VBoxContainer/Quit
@onready var start: Button = $VBoxContainer/Start
@onready var settings: Button = $VBoxContainer/Settings

func _on_settings_pressed() -> void:
	settings.release_focus()
	get_tree().change_scene_to_file("res://Main-Menu/Settings/options.tscn")


func _on_start_pressed() -> void:
	start.release_focus()
	get_tree().change_scene_to_file("res://Quiz-Homescreen/Quiz.tscn")


func _on_quit_pressed() -> void:
	quit.release_focus()
	pass # Replace with function body.
