extends TextureButton

onready var tween: = $Tween

func _ready():
	pass
	
	
func _toggled(button_pressed) -> void:
	tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.75), Vector2(1.0, 1.0), 1.0, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	tween.start()

