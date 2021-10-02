extends PanelContainer

export var title_text = "" setget _set_title_text, _get_title_text

func _ready():
	anchor_right = ANCHOR_END
	anchor_bottom = ANCHOR_END

func _set_title_text(value):
	$MarginContainer/VBoxContainer/Title.text = value

func _get_title_text():
	return $MarginContainer/VBoxContainer/Title.text

func add_item(child):
	$MarginContainer/VBoxContainer.add_child(child)

func add_child(child: Node, legible_unique_name: bool = false):
	$MarginContainer/VBoxContainer.add_child(child, legible_unique_name)
