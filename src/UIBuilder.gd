extends Control

func _ready():
	var items = [
		["grid", {"columns": 2}, [
			["label", {}, "Primary Attributes"], null,
			["label", {}, "Strength:"],     ["input", {"id": "strength"},     "2"],
			["label", {}, "Dexterity:"],    ["input", {"id": "dexterity"},    "3"],
			["label", {}, "Intelligence:"], ["input", {"id": "intelligence"}, "4"],
			["label", {}, "Endurance:"],    ["input", {"id": "endurance"},    "4"],
		]],
		["grid", {"columns": 2}, [
			["label", {}, "Secondary Attributes"], null,
			["label", {}, "Hit Points:"], ["input", {"id": "hit-points"}, "24"],
			["label", {}, "Armor:"],      ["input", {"id": "armor"},      "6"],
			["label", {}, "Movement:"],   ["input", {"id": "movement"},   "4"],
		]]
	]
	
	for item in items:
		add($Container, item)

func add(parent, item):
	# FIXME: stop using funcref() in such an insecure way.
	var fn = funcref(self, "add_" + item[0])
	fn.call_func(parent, item[1], item[2])

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