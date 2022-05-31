extends Node2D

signal axe_retreived

func _on_Hurtbox_area_entered(area):
	print("AXE YOU STUPID")
	emit_signal("axe_retreived")
	queue_free()
