extends PiaoInput

func _ready():
	set_process(true)

func _process(delta):
	var accel = Input.get_accelerometer()
	
