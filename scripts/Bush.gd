extends Node2D

#func create_bush_effect():
#	var BushEffect = load("res://scenes/Effects/BushEffect.tscn")
#	var bushEffect = BushEffect.instance()
#	var world = get_tree().current_scene
#	world.add_child(bushEffect)
#	bushEffect.global_position = global_position
signal bushDeath

onready var stats = $Stats
onready var Sprite = $Sprite

func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	
func _on_Stats_no_health():
	$Sprite.texture = load("res://assets/Texture/BushTexClean.png")
	emit_signal("bushDeath")
	print("emitbushdeath")
