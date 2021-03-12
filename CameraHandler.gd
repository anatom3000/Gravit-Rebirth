extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dragging = false
var drag_pos = Vector2()
export var key_zoom_factor = 1.01
export var scroll_zoom_factor = 1.1

func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_page_up"):
		$Camera2D.zoom *= key_zoom_factor
		print("PLus!")
	if Input.is_action_pressed("ui_page_down"):
		$Camera2D.zoom /= key_zoom_factor
		print("Moins !")
	if velocity.length() > 0:
		velocity = velocity.normalized() * 400
	position += velocity * delta


func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				#zoom_pos = get_global_mouse_position()
				$Camera2D.zoom /= scroll_zoom_factor
			# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				#zoom_pos = get_global_mouse_position()
				$Camera2D.zoom *= scroll_zoom_factor
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
			drag_pos = get_global_mouse_position()
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position += drag_pos
		position -= get_global_mouse_position()
