extends CanvasLayer

signal update_button_update(updating)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_UpdateButton_toggled(button_pressed):
	emit_signal("update_button_update", button_pressed)
	print("Update:", button_pressed)
