extends Node

#get_tree().call_group("menu_quest_button")

#SpeakQuest
#FindQuest
#KillQuest
#CollectQuest


onready var ActiveList = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton/ActiveButtonHolder/ActiveButtonList")
onready var CompleteList = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/CompleteListButton/CompleteButtonHolder/CompleteeButtonList")

onready var button_SpeakQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton/ActiveButtonHolder/ActiveButtonList/SpeakQuest")
onready var button_FindQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton/ActiveButtonHolder/ActiveButtonList/FindQuest")
onready var button_KillQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton/ActiveButtonHolder/ActiveButtonList/KillQuest")
onready var button_CollectQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton/ActiveButtonHolder/ActiveButtonList/CollectQuest")

onready var page_Info = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/QuestInfoPage")
onready var page_NoInfo = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/NoQuestInfoPage")
onready var page_SpeakQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/SpeakQuestInfo")
onready var page_FindQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/FindQuestInfo")
onready var page_KillQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/KillQuestInfo")
onready var page_CollectQuest = get_node("MenuControl/Journal_Panel/NinePatchRect/PagesContainer/Right_Page/MarginContainer/CollectQuestInfo")

onready var questPages = get_tree().get_nodes_in_group("Quest_Page")

onready var SpeakQuestActive = false
onready var FindQuestActive = false
onready var KillQuestActive = false
onready var CollectQuestActive = false

var activated = false

#true = active
#false = completed

var _textureActivated = load("res://assets/UI/questMenuButton.png")


func _ready():
	$MenuControl/Journal_Panel.hide()
#button press -> pressed = true until another button is pressed
	page_Info.hide()
	page_NoInfo.hide()
	if not SpeakQuestActive:
		if not FindQuestActive:
			if not KillQuestActive:
				if not CollectQuestActive:
					activated = false
	ActiveList.remove_child(button_FindQuest)
	ActiveList.remove_child(button_KillQuest)
	ActiveList.remove_child(button_CollectQuest)
	

func _on_MenuOpener_toggled(button_pressed):
	if (button_pressed):
		$MenuControl/Journal_Panel.show()
		for node in questPages:
			node.hide()
		if activated:
			page_Info.show()
			page_NoInfo.hide()
		if not activated:
			page_Info.hide()
			page_NoInfo.show()
		
		CompleteList.hide()
		ActiveList.hide()
		
	else:
		$MenuControl/Journal_Panel.hide()
		$MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/ActiveListButton.pressed = false
		$MenuControl/Journal_Panel/NinePatchRect/PagesContainer/LPage/HBoxContainer/CompleteListButton.pressed = false


func _on_ActiveListButton_toggled(button_pressed):
	CompleteList.hide()
	ActiveList.show()
	if ActiveList.has_node("SpeakQuest"):
		button_SpeakQuest.show()
		
	if ActiveList.has_node("FindQuest"):
		button_FindQuest.show()
		
	if ActiveList.has_node("KillQuest"):
		button_KillQuest.show()
		
	if ActiveList.has_node("CollectQuest"):
		button_CollectQuest.show()


func _on_CompleteListButton_toggled(button_pressed):
	ActiveList.hide()
	CompleteList.show()
	
	if CompleteList.has_node("button_SpeakQuest"):
			button_SpeakQuest.show()
	if CompleteList.has_node("button_FindQuest"):
			button_FindQuest.show()
	if CompleteList.has_node("button_KillQuest"):
			button_KillQuest.show()
	if CompleteList.has_node("button_CollectQuest"):
			button_CollectQuest.show()

#----- buttons

func _on_SpeakQuest_toggled(button_pressed):
	if (button_pressed):
		page_Info.hide()
		page_NoInfo.hide()
		
		page_SpeakQuest.show()
		page_FindQuest.hide()
		page_KillQuest.hide()
		page_CollectQuest.hide()
		
	else:
		page_SpeakQuest.hide()
		if activated:
			page_Info.show()
			page_NoInfo.hide()
		if not activated:
			page_Info.hide()
			page_NoInfo.show()

func _on_FindQuest_toggled(button_pressed):
	if (button_pressed):
		page_Info.hide()
		page_NoInfo.hide()
		
		page_SpeakQuest.hide()
		page_FindQuest.show()
		page_KillQuest.hide()
		page_CollectQuest.hide()
		
	else:
		page_FindQuest.hide()
		if activated:
			page_Info.show()
			page_NoInfo.hide()
		if not activated:
			page_Info.hide()
			page_NoInfo.show()


func _on_KillQuest_toggled(button_pressed):
	if (button_pressed):
		page_Info.hide()
		page_NoInfo.hide()
		
		page_SpeakQuest.hide()
		page_FindQuest.hide()
		page_KillQuest.show()
		page_CollectQuest.hide()
		
	else:
		page_KillQuest.hide()
		if activated:
			page_Info.show()
			page_NoInfo.hide()
		if not activated:
			page_Info.hide()
			page_NoInfo.show()


func _on_CollectQuest_toggled(button_pressed):
	if (button_pressed):
		page_Info.hide()
		page_NoInfo.hide()
		
		page_SpeakQuest.hide()
		page_FindQuest.hide()
		page_KillQuest.hide()
		page_CollectQuest.show()
		
	else:
		page_CollectQuest.hide()
		if activated:
			page_Info.show()
			page_NoInfo.hide()
		if not activated:
			page_Info.hide()
			page_NoInfo.show()

#----- activations

func speakQuestActivate():
	SpeakQuestActive = true
	activated = true
	ActiveList.add_child(button_SpeakQuest)
	print("getting called")
		
func findQuestActivate():
	FindQuestActive = true
	activated = true
	ActiveList.add_child(button_FindQuest)
		
func killQuestActivate():
	KillQuestActive = true
	activated = true
	ActiveList.add_child(button_KillQuest)
		
func collectQuestActivate():
	CollectQuestActive = true
	activated = true
	ActiveList.add_child(button_CollectQuest)
	
#----- completions 

func speakQuestComplete():
	ActiveList.remove_child(button_SpeakQuest)
	CompleteList.add_child(button_SpeakQuest)
	SpeakQuestActive = false
	print("hit menu")

func findQuestComplete():
	ActiveList.remove_child(button_FindQuest)
	CompleteList.add_child(button_FindQuest)
	FindQuestActive = false

func killQuestComplete():
	ActiveList.remove_child(button_KillQuest)
	CompleteList.add_child(button_KillQuest)
	KillQuestActive = false

func collectQuestComplete():
	ActiveList.remove_child(button_CollectQuest)
	CompleteList.add_child(button_CollectQuest)
	CollectQuestActive = false








