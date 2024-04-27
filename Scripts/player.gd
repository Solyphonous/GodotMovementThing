extends RigidBody3D

@onready var camHolder: Node3D = $CamHolder
@onready var cam: Camera3D = $CamHolder/Camera3D

const SPEED = 100
const SENSITIVITY = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func updateCamera():
	pass

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion: # Control camera rotation
		print(-event.relative.x)
		rotate_y(-event.relative.x * SENSITIVITY)
		cam.rotate_x(-event.relative.y * SENSITIVITY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	var movevector: Vector2 = Input.get_vector("Back", "Forward", "Left", "Right")
	apply_force(Vector3(movevector.x*SPEED, 0, movevector.y*SPEED))
