extends RigidBody2D

# var mass
export var radius = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Line2D.clear_points()
	$Line2D.add_point(Vector2())
	$Line2D.add_point(applied_force)


func _on_Body_draw():
	#draw_circle(position, radius, Color())
	draw_circle(Vector2(), radius, Color())
	
