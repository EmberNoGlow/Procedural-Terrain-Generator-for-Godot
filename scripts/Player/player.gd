extends CharacterBody3D

# Настройки движения
const FORWARD_SPEED = 5.0
const MOUSE_SENSITIVITY = 0.005 # Настройте эту величину для чувствительности

# Диапазоны вращения по оси X (вверх/вниз)
const PITCH_LIMIT_UP = deg_to_rad(-89)
const PITCH_LIMIT_DOWN = deg_to_rad(89)

# Переменные для отслеживания вращения
var pitch: float = 0.0
var yaw: float = 0.0

@onready var camera_pivot: Node3D = $CameraPivot # Предполагаем, что у вас есть Node3D для вращения по Y

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * MOUSE_SENSITIVITY
		pitch -= event.relative.y * MOUSE_SENSITIVITY
		
		pitch = clamp(pitch, PITCH_LIMIT_UP, PITCH_LIMIT_DOWN)

var mouse_mode_captured : bool = true

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"): # Например, по нажатию ESC
		mouse_mode_captured = !mouse_mode_captured


func _physics_process(delta: float) -> void:
	if mouse_mode_captured:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	camera_pivot.rotation.x = lerp_angle(camera_pivot.rotation.x , pitch, delta*10.0)
	rotation.y = lerp_angle(rotation.y , yaw, delta*10.0)
	
	
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	
	var forward_vector = camera_pivot.global_transform.basis.z.normalized()
	var right_vector = camera_pivot.global_transform.basis.x.normalized()

	var desired_velocity = (right_vector * input_dir.x + forward_vector * input_dir.y) * FORWARD_SPEED
	
	velocity = desired_velocity
	
	move_and_slide()
