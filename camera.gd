extends Camera3D

@onready var cam: Node3D = get_node("../Player/CamHolder")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = cam.transform