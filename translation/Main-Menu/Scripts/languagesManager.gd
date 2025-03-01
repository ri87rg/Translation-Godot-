extends Control

func _on_english_pressed() -> void:
	TranslationServer.set_locale("en")

func _on_arabic_pressed() -> void:
	TranslationServer.set_locale("ar")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Main-Menu/Settings/options.tscn")
