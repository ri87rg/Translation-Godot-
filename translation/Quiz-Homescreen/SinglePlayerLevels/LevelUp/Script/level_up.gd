extends Control

@onready var bg_particles: GPUParticles2D = $BGParticles
@onready var r_wing_particles: GPUParticles2D = $RWingParticles
@onready var l_wing_particles: GPUParticles2D = $LWingParticles

@onready var title: Label = $Title
@onready var rays: TextureRect = $Anchor/Rays
@onready var shield: TextureRect = $Anchor/Shield
@onready var level: Label = $Anchor/Shield/Level
@onready var level_nb: Label = $Anchor/Shield/LevelNb
@onready var r_wing: TextureRect = $Anchor/Shield/RWing
@onready var l_wing: TextureRect = $Anchor/Shield/LWing
@onready var level_up: Label = $Anchor/LevelUp
@onready var ribbon: TextureRect = $Ribbon
@onready var rewards: Label = $Ribbon/Rewards
@onready var rewards_container: HBoxContainer = $RewardsContainer

@onready var r_wing_pos: Vector2 = r_wing.position
@onready var l_wing_pos: Vector2 = l_wing.position

var tween: Tween

func _ready() -> void:
	rays.scale = Vector2.ZERO
	shield.scale = Vector2.ZERO
	level.self_modulate.a = 0.0
	level_nb.self_modulate.a = 0.0
	r_wing.self_modulate.a = 0.0
	l_wing.self_modulate.a = 0.0
	bg_particles.emitting = false
	r_wing_particles.emitting = false
	l_wing_particles.emitting = false
	title.self_modulate.a = 0.0
	level_up.self_modulate.a = 0.0
	ribbon.modulate.a = 0.0
	rewards_container.modulate.a = 0.0
	animate()
	
	pass
	
func animate() -> void:
	tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_interval(1.0)
	
	# shield & rays
	tween.tween_property(rays, "scale", Vector2.ONE, 1.2)
	tween.parallel().tween_property(shield, "scale", Vector2.ONE, 1.2)
	tween.tween_interval(0.15)
		
	tween.tween_property(shield.material, "shader_parameter/y_rot", 360.0, 0.6) \
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT)
		
	# shield text
	tween.tween_property(level, "self_modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(level_nb, "self_modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	
	# Wings
	tween.tween_property(r_wing, "position", r_wing_pos, 0.6).from(r_wing_pos + Vector2(1152, 0)) \
	.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.parallel().tween_property(l_wing, "position", l_wing_pos, 0.6).from(r_wing_pos - Vector2(1152, 0)) \
	.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.parallel().tween_property(r_wing, "self_modulate:a", 1, 0.0)
	tween.parallel().tween_property(l_wing, "self_modulate:a", 1, 0.0)

	tween.tween_property(title, "self_modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(level_up, "self_modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(ribbon, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(rewards_container, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	
	
	tween.tween_callback(bg_particles.restart)
	tween.parallel().tween_callback(r_wing_particles.restart)
	tween.parallel().tween_callback(l_wing_particles.restart)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
