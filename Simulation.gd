extends Node

export (PackedScene) var Body

export var gravity_strenth = 20 # was 6.67408e-2

func _ready():
	add_body(10, Vector2(100, 100))
	add_body(10, Vector2(100, -100))
	add_body(10, Vector2(-100, 100))
	add_body(10, Vector2(-100, -100))

func calculate_forces(pos_a, pos_b, m_a, m_b):
	var distance = pos_a.distance_squared_to(pos_b)
	var unit = pos_a.direction_to(pos_b)
	var f = gravity_strenth * m_a * m_b / distance * unit
	return f

func add_body(mass, position, velocity=Vector2(), radius=-1):
	if radius <= 0:
		radius = mass
	var body = Body.instance()
	add_child(body)
	
	body.mass = mass
	body.position = position
	body.radius = radius

func change_state(updating):
	for body in get_children():
		body.sleeping = updating
	
	if updating:
		for body in get_children():
			body.set_mode(RigidBody2D.MODE_RIGID)
	else:
		for body in get_children():
			body.set_mode(RigidBody2D.MODE_STATIC)

func _physics_process(delta):
	for body in get_children():
		if body.sleeping:
			for body_i in get_children():
				if body.position != body_i.position:
					body.add_force(Vector2(), calculate_forces(
						body.position, 
						body_i.position, 
						body.mass, 
						body_i.mass
					))
