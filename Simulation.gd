extends Node

export (PackedScene) var Body

export var gravity_strenth = 10 # was 6.67408e-2

func _ready():
	var body1 = Body.instance()
	var body2 = Body.instance()
	
	add_child(body1)
	add_child(body2)
	
	
	
	body1.position = Vector2(100, 100)
	body2.position = Vector2(200, 200)
	
	body1.mass = 20
	body2.mass = 50
	
	body1.radius = 20
	body2.radius = 50

func calculate_forces(pos_a, pos_b, m_a, m_b):
	var distance = pos_a.distance_squared_to(pos_b)
	var unit = pos_a.direction_to(pos_b)
	var f = gravity_strenth * m_a * m_b / distance * pos_a.direction_to(pos_b)
	return f


func _process(delta):
	for body in get_children():
		for body_i in get_children():
			if body.position != body_i.position:
				body.add_force(Vector2(), calculate_forces(
					body.position, 
					body_i.position, 
					body.mass, 
					body_i.mass
				))
		print(body.position)
