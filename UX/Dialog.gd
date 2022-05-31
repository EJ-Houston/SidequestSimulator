#extends Node
#extends Control
#class_name DialogueBox
#
#signal speaking
#signal finished_speaking
#
#onready var dialogue_player: DialoguePlayer = get_node("DialoguePlayer")
#
#onready var name_label := get_node("Panel/Colums/Name") as Label
#onready var text_label := get_node("Panel/Colums/Text") as Label
#
#onready var button_next := get_node("Panel/Colums/ButtonNext") as Button
#onready var button_finished := get_node("Panel/Colums/ButtonFinished") as Button
#
#onready var portrait := $Portrait as TextureRect
#
#
#func start(dialogue: Dictionary) -> void:
#	# Reinitializes the UI and asks the DialoguePlayer to 
#	# play the dialogue
#	button_finished.hide()
#	button_next.show()
#	button_next.grab_focus()
#	button_next.text = "Next"
#	dialogue_player.start(dialogue)
#	update_content()
#	show()
#
#
#func update_content() -> void:
#	var dialogue_player_name = dialogue_player.title
#	name_label.text = dialogue_player_name
#	text_label.text = dialogue_player.text
#	portrait.texture = DialogueDatabase.get_texture(
#		dialogue_player_name, dialogue_player.expression
#	)
#
#
#func _on_NPC_choice_npc1():
#	var npc_nums = 1
#
#
#func _on_NPC_choice_npc2():
#	var npc_nums = 2
#
#
#func _ready() -> void:
#	$Dialog_Box.hide()
#	npc1.hide()
#	npc2.hide()
#	print("hiding!")
#
#
#func _on_NPC_speaking():
#	$Dialog_Box.show()
#	if npc_nums == 1:
#		npc1.show()
#	if npc_nums == 2:
#		npc2.show()
#	else:
#		pass
#	print("speaking!")
#
#
#func _on_NPC_finished_speaking():
#	$Dialog_Box.hide()
#	npc1.hide()
#	npc2.hide()
#	print("done speaking!")


