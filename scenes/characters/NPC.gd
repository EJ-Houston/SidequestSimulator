extends Node2D
#extends Area2D

onready var sprite = $Area2D/KinematicBody2D/AnimatedSprite

signal timeline_changed

signal active_changed

var active = false

func _ready():
	$Area2D.connect("body_entered", self, '_on_NPC_body_entered')
	$Area2D.connect("body_exited", self, '_on_NPC_body_exited')

func _process(_delta):
	$Area2D/QuestionMark.visible = active

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
		print("entered!")
		emit_signal("active_changed", true)
		
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
		print("exited!")
		emit_signal("active_changed", false)
