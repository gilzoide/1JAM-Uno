extends KinematicBody

export(float) var move_speed = 10
export(float) var rotation_speed = 500
const MOVE_ROTATION_ANGLE = 15

var move_to: Vector3

func _ready():
	set_process(true)

func _process(delta):
	var moving_to = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		moving_to.z = -1
	elif Input.is_action_pressed("ui_down"):
		moving_to.z = 1
	if Input.is_action_pressed("ui_left"):
		moving_to.x = -1
	elif Input.is_action_pressed("ui_right"):
		moving_to.x = 1
	animate(moving_to, delta)
	apply_move(moving_to, delta)

func animate(moving_to: Vector3, delta: float):
	$Pivot/Mesh.rotate_object_local(Vector3.DOWN, rotation_speed * delta)
	$Pivot.rotation = Vector3(deg2rad(moving_to.z * MOVE_ROTATION_ANGLE),
		0,
		deg2rad(-moving_to.x * MOVE_ROTATION_ANGLE))

func apply_move(moving_to: Vector3, delta: float):
	var _x = move_and_collide(moving_to * move_speed * delta)
