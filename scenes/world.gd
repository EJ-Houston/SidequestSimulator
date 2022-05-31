extends Node2D

signal speakQuestActivated

signal findQuestActivated
signal killQuestActivated
signal collectQuestActivated

export var bush_count = 0
export var enemy_count = 0

var is_paused = false setget set_is_paused

func _ready():
	$YSort/Interactables/Axe.hide()
	$UX/QuestMenu.speakQuestActivate()
	print("ready, activated")
	
	$NPC.connect("active_changed", $UX/DialogMenu, "update_active")
	#Dialogic.get_variable("Find_Complete", "Find_Complete")
	#Dialogic.get_variable("Find_Check", "Find_Check")
	


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	get_tree().change_scene("res://UX/Main Menu.tscn")



#----- activations

	#speak quest activated by game start

func _on_DialogMenu_findActivated():
	$UX/QuestMenu.findQuestActivate()
	$YSort/Interactables/Axe.show()

func _on_DialogMenu_killActivated():
	$UX/QuestMenu.killQuestActivate()

func _on_DialogMenu_collectActivated():
	$UX/QuestMenu.collectQuestActivate()


#----- tasks and completions 

func _on_DialogMenu_speakCompleted():
	$UX/QuestMenu.speakQuestComplete()
	print("hit world")


func _on_Axe_axe_retreived():
	#(on queue_free())
	$UX/QuestMenu.findQuestComplete()


func _on_Bush_bushDeath():
	if $UX/QuestMenu.CollectQuestActive:
		bush_count += 1
		if bush_count >= 3:
			$UX/QuestMenu.collectQuestComplete()
			
	elif not $UX/QuestMenu.CollectQuestActive:
		pass

func _on_Enemy_enemyDeath():
	if $UX/QuestMenu.KillQuestActive:
		enemy_count += 1
		if enemy_count >= 3:
			$UX/QuestMenu.killQuestComplete()
			
	#elif not $UX/QuestMenu.KillQuestActive:
		pass
