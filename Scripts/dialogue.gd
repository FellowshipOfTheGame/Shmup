extends CanvasLayer

@onready var portrait_left = $Background/PortraitLeft
@onready var portrait_right = $Background/PortraitRight
@onready var name_label_left = $Background/NameLabelLeft
@onready var name_label_right = $Background/NameLabelRight
@onready var text_box = $Background/TextBox

@export var dialogue_file_name: String = "stage-1-pre-boss.json"
var json_file_path: String = "res://Assets/Dialogues/" + dialogue_file_name

var dialogue_entries = []
var current_index = 0

func _ready():
	dialogue_entries = load_json_data(json_file_path)
	if dialogue_entries.size() > 0:
		show_dialogue_entry(dialogue_entries[0])

func load_json_data(path: String) -> Array:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		
		var result = JSON.parse_string(json_text)
		if result is Array:
			return result
		else:
			print("Parsed data is not an array.")
	else:
		print("Could not open file at path:", path)
	return []

func show_dialogue_entry(entry: Dictionary):
	var side = entry.get("side", "left")
	var speaker = entry.get("speaker", "???")
	var text = entry.get("text", "")
	var portrait_path = entry.get("portrait", "")
	
	# Reset visibility
	portrait_left.visible = false
	portrait_right.visible = false
	name_label_left.visible = false
	name_label_right.visible = false

	# Set content depending on the side
	if side == "left":
		portrait_left.visible = true
		name_label_left.visible = true
		name_label_left.text = speaker
		if portrait_path != "":
			portrait_left.texture = load(portrait_path)
	elif side == "right":
		portrait_right.visible = true
		name_label_right.visible = true
		name_label_right.text = speaker
		if portrait_path != "":
			portrait_right.texture = load(portrait_path)
	
	text_box.text = text

func _input(event):
	if event.is_action_pressed("ui_accept"):
		current_index += 1
		if current_index < dialogue_entries.size():
			show_dialogue_entry(dialogue_entries[current_index])
		else:
			print("End of dialogue.")
