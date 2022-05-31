extends Node2D

onready var Sprite = $Sprite

func _ready():
	$Sprite.texture = load("res://assets/BushTexClean.png")
	
