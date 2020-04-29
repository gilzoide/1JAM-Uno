extends PiaoInput

func _ready():
	set_process(true)

func _process(delta):
	movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	movement = movement.normalized()
