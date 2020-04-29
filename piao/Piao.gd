extends KinematicBody

export(NodePath) var piao_input_node_path
onready var piao_input: PiaoInput = get_node(piao_input_node_path)
export(float) var move_speed = 10
export(float) var rotation_speed = 500
const MOVE_ROTATION_ANGLE = 15

var moving_to: Vector3 = Vector3.ZERO

func _ready():
	set_process(true)
	set_physics_process(true)


func set_movement(vec: Vector3):
	moving_to = vec

func _process(delta):
	moving_to = piao_input.get_movement()
	apply_rotation_animation(delta)


func _physics_process(_delta):
	apply_move()


func apply_rotation_animation(delta: float):
	$Pivot/Mesh.rotate_object_local(Vector3.DOWN, rotation_speed * delta)
	$Pivot.rotation = Vector3(
		deg2rad(moving_to.z * MOVE_ROTATION_ANGLE),
		0,
		deg2rad(-moving_to.x * MOVE_ROTATION_ANGLE)
	)


func apply_move():
	var _x = move_and_slide(moving_to * move_speed)
	if get_slide_count() > 0:
		piao_input.trombou()
