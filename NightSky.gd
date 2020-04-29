extends Node

export(Environment) var environment
export(Vector3) var rotation_speed = Vector3.UP

export(NodePath) var piao_input_node_path
onready var piao_input: PiaoInput = get_node(piao_input_node_path)

func _ready():
	set_process(true)

func _process(delta):
	var piao_movement = piao_input.get_movement()
	var movement = Vector3(piao_movement.z, 1, piao_movement.x)
	environment.background_sky_rotation_degrees += (movement * delta)
	
