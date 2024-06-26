extends RigidBody3D

@onready var camHolder: Node3D = $CamHolder
@onready var cam: Camera3D = $CamHolder/Camera3D
@onready var floorCheck: RayCast3D = $FloorCheck

const FORCE = 100
const MAXSPEED = 30
const SENSITIVITY = 0.01
const JUMPPOWER = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func updateCamera():
	pass

func _unhandled_input(event: InputEvent):

	if event is InputEventMouseMotion: # Control camera rotation
		camHolder.rotate_y(-event.relative.x * SENSITIVITY)
		cam.rotate_x(-event.relative.y * SENSITIVITY)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-90), deg_to_rad(90))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Jump") && floorCheck.is_colliding():
		apply_central_force(Vector3(0, JUMPPOWER, 0))

func speedControl():
	var speed: Vector3 = Vector3(linear_velocity.x, 0, linear_velocity.z)
	if (speed.length() > MAXSPEED):
		var limited = speed.normalized()*MAXSPEED
		linear_velocity = Vector3(limited.x, linear_velocity.y, limited.z)

func _physics_process(_delta):
	var movevector: Vector2 = Input.get_vector("Back", "Forward", "Left", "Right")
	apply_central_force(camHolder.transform.basis*Vector3(movevector.y*FORCE, 0, -movevector.x*FORCE))
	speedControl()
