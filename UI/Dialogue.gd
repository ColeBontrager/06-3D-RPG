extends Control

var dialogue = []
var pos = 0

signal finished

func _ready():
	hide()
	
func start(d):
	dialogue = d.duplicate()
	pos = 0
	show()
	
func hide_d():
	dialogue = []
	pos = 0
	hide()
	
func _physics_process(delta):
	if dialogue.size() and pos < dialogue.size():
		var d = "[center]" + dialogue[pos] + "[/center]"
		if $Text.bbcode_text != d:
			$Text.bbcode_text = d
		if Input.is_action_just_pressed("action"):
			pos += 1
	elif dialogue.size():
		emit_signal("finished")
		hide_d()
