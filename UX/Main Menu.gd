extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _ready():
	$Control/buttonPage/menuButtons/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	self.is_paused = false


func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_HelpButton_pressed():
	get_tree().change_scene("res://UX/Tutorial.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://UX/Credits.tscn")
