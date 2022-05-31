extends Control

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://UX/Main Menu.tscn")


func _on_Button2_pressed():
	if get_tree().current_scene.name == "Tutorial":
		get_tree().change_scene("res://UX/TutorialPage2.tscn")
	elif get_tree().current_scene.name == "TutorialPage2":
		get_tree().change_scene("res://UX/Tutorial.tscn")
