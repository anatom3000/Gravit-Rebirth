extends RigidBody2D


export var radius = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 100)
	print($BodyCollisionShape.shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Body_draw():
	draw_circle(position, radius, Color())
