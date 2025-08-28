extends Control

@onready var left_portrait = $LeftPortrait
@onready var right_portrait = $RightPortrait
@onready var dialogue_text = $TextboxBg/DialogueText
@onready var speaker_name = $NameLabel

var dialogue_data = []
var current_line = 0

func _ready():
	load_dialogue("res://assets/dialogues/stage-1-pre-boss.json")
	show_next_line()

func load_dialogue(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		dialogue_data = JSON.parse_string(content)
	else:
		push_error("Failed to load dialogue file.")

func show_next_line():
	if current_line >= dialogue_data.size():
		hide()
		return

	var line = dialogue_data[current_line]
	dialogue_text.text = line["text"]
	speaker_name.text = line["speaker"]

	# Load portraits
	if line["portrait_left"]:
		left_portrait.texture = load("res://assets/portraits/" + line["portrait_left"] + ".png")
	else:
		left_portrait.visible = false
	if line["portrait_right"]:
		right_portrait.texture = load("res://assets/portraits/" + line["portrait_right"] + ".png")
	else:
		right_portrait.visible = false

	# Handle speaker visibility
	var active = line.get("active_speaker_side", "left")

	# Opacity based on speaker
	left_portrait.modulate.a = 1.0 if active == "left" else 0.5
	right_portrait.modulate.a = 1.0 if active == "right" else 0.5

	current_line += 1

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		show_next_line()
