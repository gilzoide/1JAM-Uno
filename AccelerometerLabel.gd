extends Label

func _ready():
	set_process(true)

func _process(delta):
	text = "Accel " + str(Input.get_accelerometer())
