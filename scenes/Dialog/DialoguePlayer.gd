extends Node
class_name DialoguePlayer

onready var dialogue_player = $Dialog_Box
onready var name_label = $Dialog_Box/VoiceBox/NameBox/Name
onready var portrait := $Dialog_Box/VoiceBox/FaceBox/Portrait as TextureRect

signal speakCompleted

signal findActivated
signal killActivated
signal collectActivated


export(String, "TimelineDropdown") var timeline: String = ''

onready var status = INACTIVE

enum {ACTIVE, INACTIVE, ABANDONED, COMPLETED
}


signal speaking
signal finished_speaking

var active

func _ready():
	dialogue_player.hide()
	connect("speaking", self, '_on_NPC_speaking')
	connect("finished_speaking", self, '_on_NPC_finished_speaking')

func update_active(boolean):
	active = boolean

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start(timeline, '')
			emit_signal("speaking")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			
			dialog.connect("dialogic_signal", self, 'dialogic_signal')
			dialog.connect("timeline_end", self, 'after_dialog')
			
func unpause(timeline_name):
	get_tree().paused = false

func after_dialog(timeline_name):
	emit_signal("finished_speaking")

func dialogic_signal(argument):
	if argument == 'spoke_to_npc':
		emit_signal("speakCompleted")
		print("dialog hit")
		
	if argument == 'lost_axe':
		emit_signal("findActivated")
		print("find activated")
		
	if argument == 'kill_blue':
		emit_signal("killActivated")
		print("kill activated")
		
	if argument == 'collect_berries':
		emit_signal("collectActivated")
		print("collect activated")
		
	
func _on_NPC_speaking():
	dialogue_player.show()

func _on_NPC_finished_speaking():
	dialogue_player.hide()
