extends PiaoInput

var timer = 0.0
export(float) var seconds_to_change = 2
var rng = RandomNumberGenerator.new()

func _ready():
	set_process(true)

func _process(delta):
	timer += delta
	if timer > seconds_to_change:
		timer = 0
		muda_direcao()

func trombou():
	muda_direcao()

func muda_direcao():
	var x = rng.randf_range(-1, 1)
	var z = rng.randf_range(-1, 1)
	movement = Vector3(x, 0, z)
