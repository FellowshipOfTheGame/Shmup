extends CanvasLayer

var current_line = 0
var dialogue_active = false
var dialogue_lines = []

func start_dialogue(lines):
	dialogue_lines = lines
	current_line = 0
	dialogue_active = true
	show()
	display_line()

func display_line():
	if current_line >= dialogue_lines.size():
		end_dialogue()
		return
	
	var line = dialogue_lines[current_line]
	$TextLabel.text = line["text"]
	
	# Set portrait
	if line["side"] == "left":
		$LeftPortrait.texture = load(line["portrait"])
		$LeftPortrait.show()
		$RightPortrait.hide()
	else:
		$RightPortrait.texture = load(line["portrait"])
		$RightPortrait.show()
		$LeftPortrait.hide()

func _input(event):
	if dialogue_active and event.is_action_pressed("ui_accept"):
		current_line += 1
		display_line()

func end_dialogue():
	dialogue_active = false
	hide()
	# Emit signal if you want other nodes to know dialogue ended
