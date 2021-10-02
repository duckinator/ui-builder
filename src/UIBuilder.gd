extends Control

const HSD_APP = [
	["section", "Primary Attributes", [
		["grid", {"columns": 2}, [
			["label", {}, "Strength:"],     ["input", {"id": "strength"},     "2"],
			["label", {}, "Dexterity:"],    ["input", {"id": "dexterity"},    "3"],
			["label", {}, "Intelligence:"], ["input", {"id": "intelligence"}, "4"],
			["label", {}, "Endurance:"],    ["input", {"id": "endurance"},    "4"],
	]]]],
	["section", "Secondary Attributes", [
		["grid", {"columns": 2}, [
			["label", {}, "Hit Points:"], ["input", {"id": "hit-points"}, "24"],
			["label", {}, "Armor:"],      ["input", {"id": "armor"},      "6"],
			["label", {}, "Movement:"],   ["input", {"id": "movement"},   "4"],
	]]]]
]

const PARTS_HORSE_APP = ["Application", {}, [
	["ScrollContainer", {}, [
		["HBoxContainer", {"name": "ComponentHBox"}, [
			["Section", {"name": "Details", "title_text": "Details"}, [
				["LabeledTextEdit", {"name": "name",          "label_text": "Name"}],
				["LabeledTextEdit", {"name": "slug",          "label_text": "Slug"}],
				["LabeledTextEdit", {"name": "summary",       "label_text": "Summary"}],
				["LabeledTextEdit", {"name": "details",       "label_text": "Text"}],
				["LabeledTextEdit", {"name": "datasheet_url", "label_text": "Datasheet URL"}],
				["LabeledTextEdit", {"name": "details_url",   "label_text": "Details URL"}],
				# Package Style
				# Number of Pins
				["LabeledTextEdit", {"name": "tags",          "label_text": "Tags (comma separated)"}],
			]],
			["Section", {"name": "Pins", "title_text": "Pinout"}, [
				# ...
			]] # Section
		]] # HBoxContainer
	]] # ScrollContainer
]] # Application

func _ready():
	add_child(build(PARTS_HORSE_APP))

func build(item: Array):
	if len(item) == 1:
		return _build(item[0])
	elif len(item) == 2:
		return _build(item[0], item[1])
	else:
		return _build(item[0], item[1], item[2])

func _build(control_type: String, attrs: Dictionary = {}, children: Array = []):
	var control = load("res://controls/" + control_type + ".tscn").instance()
	
	for attr in attrs:
		control[attr] = attrs[attr]
	
	for child in children:
		control.add_child(build(child))
	
	return control
