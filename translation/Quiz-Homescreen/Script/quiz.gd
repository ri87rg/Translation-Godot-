extends Control

# logo controls
@onready var circle: TextureRect = $Screen/VBoxContainer/Logo/Circle
@onready var star_partical: GPUParticles2D = $Screen/VBoxContainer/Logo/starPartical
@onready var godot: TextureRect = $Screen/VBoxContainer/Logo/RotationPoint/GODOT
@onready var quiz: TextureRect = $Screen/VBoxContainer/Logo/RotationPoint/QUIZ
# custom onready values
@onready var godot_final_pos: Vector2 = godot.position
@onready var quiz_final_pos: Vector2 = quiz.position
var tween_logo: Tween

# page controls
@onready var avatar_container: VBoxContainer = $Screen/VBoxContainer/AvatarContainer
@onready var progress_bar_container: HBoxContainer = $Screen/VBoxContainer/ProgressBarContainer
@onready var button_container: VBoxContainer = $Screen/VBoxContainer/ButtonContainer
var tween_page: Tween

func _ready() -> void:
	# initial values
	circle.scale = Vector2.ZERO
	godot.self_modulate.a = 0.0
	quiz.self_modulate.a = 0.0
	star_partical.emitting = false
	avatar_container.modulate.a = 0.0
	progress_bar_container.modulate.a = 0.0
	button_container.modulate.a = 0.0
	
	await get_tree().create_timer(0.8).timeout
	logo_animation()
	await get_tree().create_timer(1.0).timeout
	page_animation()
	
func logo_animation() -> void:
	tween_logo = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	# logo background tweening
	tween_logo.tween_property(circle, "scale", Vector2.ONE, 0.6) \
		.from(Vector2.ZERO).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	# text tweening
	tween_logo.parallel().tween_property(godot, "position", godot_final_pos, 0.6).from(godot_final_pos - Vector2(255, 0))
	tween_logo.parallel().tween_property(godot, "self_modulate:a", 1.0, 0.5).from(0.0)
	tween_logo.parallel().tween_property(quiz, "position", quiz_final_pos, 0.6).from(quiz_final_pos + Vector2(255, 0))
	tween_logo.parallel().tween_property(quiz, "self_modulate:a", 1.0, 0.5).from(0.0)
	

func page_animation() -> void:
	tween_page = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	tween_page.tween_property(avatar_container, "modulate:a", 1.0, 0.5).from(0.0)
	tween_page.parallel().tween_property(progress_bar_container, "modulate:a", 1.0, 0.5).from(0.0)
	tween_page.parallel().tween_property(button_container, "modulate:a", 1.0, 0.5).from(0.0)
	tween_page.tween_callback(star_partical.restart)
