extends RigidBody

export(float) var speed = 30


func _ready():
	apply_torque_impulse(Vector3.DOWN * 100)

#func _physics_process(delta):
#	rotate_object_local(Vector3.DOWN, delta * speed)
