extends Node


# Called when the node enters the scene tree for the first time.
func _ready():  
	pass

# 


func _on_HUD_update_button_update(updating):
	$Simulation.change_state(updating)
