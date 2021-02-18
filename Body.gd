extends RigidBody2D

# var mass
export var radius = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$BodyCollisionShape.shape.radius = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_Body_draw():
	draw_circle(position, radius, Color())
