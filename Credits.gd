extends Control

func _on_MenuButton_pressed():
	get_tree().change_scene("res://UX/Main Menu.tscn")


func _on_Icons_pressed():
	OS.shell_open("https://pixeltier.itch.io/pixeltiers-16x16-rpg-icon-pack")


func _on_Village_pressed():
	OS.shell_open("https://limezu.itch.io/serenevillagerevamped")


func _on_Creatures_pressed():
	OS.shell_open("https://kenney.itch.io/creature-mixer")


func _on_UI_pressed():
	OS.shell_open("https://mounirtohami.itch.io/pixel-art-gui-elements")


func _on_GitHub_pressed():
	OS.shell_open("https://github.com/EJ-Houston/SidequestSimulator")


func _on_Label_mouse_entered():
	var color = Color("c0cbdc")
	set_self_modulate(color)


func _on_Label_mouse_exited():
	var color = Color("8b9bb4")
	set_self_modulate(color)
