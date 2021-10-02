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

const FUNC_MAP = {
	"grid": "add_grid",
	"input": "add_input",
	"label": "add_label",
	"section": "add_section",
}

func _ready():
	build(HSD_APP)

func build(items):
	for item in items:
		add($Container, item)

func add(parent, item):
	var fn = funcref(self, FUNC_MAP[item[0]])
	fn.call_func(parent, item[1], item[2])

func add_section(parent, title_text, items):
	var section = load("res://Section.tscn").instance()
	parent.add_child(section)
	var vbox = section.get_node('MarginContainer/VBoxContainer')
	var title = vbox.get_node('Title')
	section.anchor_right = ANCHOR_END
	section.anchor_bottom = ANCHOR_END
	
	title.text = title_text
	
	for idx in range(0, len(items)):
		add(vbox, items[idx])

func add_grid(parent, attrs, items):
	var grid = GridContainer.new()
	parent.add_child(grid)
	grid.anchor_right = ANCHOR_END
	grid.anchor_bottom = ANCHOR_END
	
	if "columns" in attrs:
		grid.columns = attrs["columns"]
	
	for idx in range(0, len(items)):
		if items[idx] == null:
			items[idx] = ["label", {}, ""]
		add(grid, items[idx])

func add_label(parent, attrs, text):
	var label = Label.new()
	label.text = text
	parent.add_child(label)

func add_input(parent, attrs, value):
	var input = TextEdit.new()
	input.text = value
	input.name = attrs["id"]
	input.rect_min_size = Vector2(100, 20)
	parent.add_child(input)

func add_table(parent, attrs, rows):
	#add_grid(parent, attrs, items)
	pass
