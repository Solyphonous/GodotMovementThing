extends RigidBody3D

@onready var Cam: Camera3D = $Camera3D

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func updateCamera():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var movevector: Vector2 = Input.get_vector("Back", "Forward", "Left", "Right")
	apply_force(Vector3(movevector.x*SPEED, 0, movevector.y*SPEED))
	transform.basis = Quaternion.from_euler(Vector3(0, Cam.transform.basis.y, 0))
