extends KinematicBody2D

var knockback = Vector2.ZERO
onready var stats = $Stats

signal enemyDeath

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	knockback = area.knockback_vector * 80

func _on_Stats_no_health():
	emit_signal("enemyDeath")
	print("died")
	queue_free()


