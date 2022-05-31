#extends Node
#
#export(int, "NPC1", "NPC2", "NPC3", "NPC4") var npc_choice
#onready var npc = npc_choice setget set_npc
#
#signal choice_npc1
#signal choice_npc2
#
#func set_npc(value):
#	npc = value
#	if npc == 0:
#		emit_signal("choice_npc1")
#		print("npc1 chose")
#
#	elif npc == 1:
#		emit_signal("choice_npc2")
#		print("npc2 chose")
