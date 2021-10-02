extends VBoxContainer

export var label_text = "" setget _set_label_text, _get_label_text
export var text = "" setget _set_text, _get_text

func _set_label_text(value):
	$Label.text = value

func _get_label_text():
	return $Label.text

func _set_text(value):
	$LineEdit.text = value

func _get_text():
	return $LineEdit.text
