extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var zoom_factor = 2

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
	if Input.is_action_pressed("ui_page_down"):
		$Camera2D.zoom *= zoom_factor
	if Input.is_action_pressed("ui_page_down"):
		$Camera2D.zoom /= zoom_factor
	if velocity.length() > 0:
		velocity = velocity.normalized() * 400
	position += velocity * delta

