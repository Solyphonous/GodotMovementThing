extends RigidBody3D

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var movevector: Vector2 = Input.get_vector("Back", "Forward", "Left", "Right")
	apply_force(Vector3(movevector.x*SPEED, 0, movevector.y*SPEED))
