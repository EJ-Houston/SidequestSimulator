#extends Node
#class_name Quest
#
#signal activated
#signal deactivated
#signal abandoned
#signal completed
#
#enum {
#	ACTIVE = 0,
#	INACTIVE = 1,
#	ABANDONED = 2,
#	COMPLETED = 3,
#}
#
#var status = INACTIVE
#
#onready var dict = {
#	"active": false,
#	"inactive": true,
#	"abandoned": false,
#	"completed": false,
#	}
#
#onready var check_status = dict
#
#func _ready():
#	pass
#
#func update():
#	match status:
#		0:
#			check_status["active"] = true
#			check_status["inactive"] = false
#
#			if check_status["active"]:
#				emit_signal("activated")
#			if not check_status["active"]: 
#				print("nope")
#			if check_status["inactive"]:
#				print("inactive = true")
#			if not check_status["inactive"]:
#				print("inactive = false")
#
#			else:
#				print("get fucked")
#
#		1:
#			pass
#
#		2:
#			pass
#
#		3:
#			check_status["completed"] = true
#			check_status["active"] = false
#
#			if check_status["completed"]:
#				emit_signal("completed")
#				print("printcomplete")
#			if not check_status["completed"]: 
#				print("nope")
#
#
#
#func activate():
#	status = 0
#	update()
#
#func deactivate():
#	status = 1
#	update()
#	#emit_signal("deactivated")
#
#func abandon():
#	status = 2
#	update()
#	#emit_signal("abandoned")
#
#func complete():
#	status = 3
#	update()
#
##------ bool_goal
#
#signal goal_updated
#
#export(String) var title = ""
#export(String, MULTILINE) var description = ""
#
##Whether the goal stays completed when completed or not.
#export(bool) var is_sticky = false
#
#var is_complete := false setget set_completion 
#
#func set_completion(new_value : bool) -> void:
#	if is_sticky:
#		if !is_complete:
#			is_complete = new_value
#	else:
#		is_complete = new_value
#	emit_signal("goal_updated")
#	print("goal updated")
#
#
##------ int_goal
#
#export(String) var x_title = "X"
#export(String) var y_title = "Y"
#
#export(int) var x = 0 setget set_numerator
#export(int) var y = 0 setget set_denominator
#
#export(bool) var can_go_over = false
#
#func set_numerator(new_value : int) -> void:
#	x = new_value
#	update()
#
#func set_denominator(new_value : int) -> void:
#	y = new_value
#
#func update_goal() -> void:
#	x += 1
#	if x == y:
#		set_completion(is_complete)
#		emit_signal("goal_updated")
#
#func get_completion_percentage() -> float:
#	return float(x) / float(y)




#func update() -> void:
#	if status == ACTIVE:
#		for child in get_children():
#			if child.name == "Goals":
#				if child.get_child_count() > 0:
#					var goal_child := $Goals.get_child(0)
#					if goal_child is Goal:
#						set_completion(goal_child.is_complete)
#
#	if status != ABANDONED:
#		for child in get_children():
#			if child.name == "Triggers":
#				if child.get_child_count() > 0:
#					var trigger_child := $Triggers.get_child(0)
#					if trigger_child is Goal:
#						if trigger_child.is_complete:
#							activate()
#						else:
#							deactivate()

#for child in get_children():
#		if child.name == "Goals":
#			if child.get_child_count() > 0:
#				var goal_child := $Goals.get_child(0)
#				if goal_child is Goal:
#					goal_child.connect("goal_updated", self, "update")
#		if child.name == "Triggers":
#			if child.get_child_count() > 0:
#				var trigger_child := $Triggers.get_child(0)
#				if trigger_child is Goal:
#					trigger_child.connect("goal_updated", self, "update")
