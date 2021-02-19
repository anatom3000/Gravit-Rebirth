extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass #body1=  


func _on_CheckButton_toggled(button_pressed):
	$Simulation.change_state(button_pressed)
