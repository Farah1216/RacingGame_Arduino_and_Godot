extends VehicleBody3D

const Max_STEER=0.8

@onready var camerapovit=$camerapovit
@onready var Camera_3D=$camerapovit/Camera3D

var look_at

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	look_at=global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	steering = move_toward(steering,Input.get_axis("ui_right","ui_left")*Max_STEER,delta*2.5)
	engine_force=Input.get_axis("ui_down","ui_up")*10000
	camerapovit.global_position=camerapovit.global_position.lerp(global_position,delta*20.0)
	camerapovit.transform=camerapovit.transform.interpolate_with(transform,delta*5.0)
	look_at=look_at.lerp(global_position+linear_velocity,delta*5.0)
	Camera_3D.look_at(look_at)
