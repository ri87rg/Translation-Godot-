extends Control

@onready var back: Button = $VBoxContainer/Back

var languagesContainer = {
	"_ENGLISH": "en",
	"_ARABIC": "ar"
}

func _ready() -> void:
	for language in languagesContainer:
		$VBoxContainer/OptionButton.add_item(language)



func _on_option_button_item_selected(index: int) -> void:
	TranslationServer.set_locale(languagesContainer.values()[index])


func _on_back_pressed() -> void:
	back.focus_mode = Control.FOCUS_NONE
	get_tree().change_scene_to_file("res://Main-Menu/MainMenu.tscn")
