extends CharacterBody3D

@export var speed = 10.0 # سرعة الحركة
@export var rotation_speed = 2.0 # سرعة التدوير

func _physics_process(delta):
	# التدوير يميناً ويساراً باستخدام الأسهم (يمين/يسار)
	var rotation_input = Input.get_axis("ui_right", "ui_left")
	rotate_y(rotation_input * rotation_speed * delta)
	
	# الحركة للأمام والخلف باستخدام الأسهم (فوق/تحت)
	var direction = Vector3.ZERO
	var input_dir = Input.get_axis("ui_down", "ui_up")
	
	# حساب اتجاه الكاميرا الحالي للتحرك باتجاهه
	var forward = transform.basis.z
	velocity = -forward * input_dir * speed
	
	# تنفيذ الحركة مع مراعاة التصادم
	move_and_slide()
