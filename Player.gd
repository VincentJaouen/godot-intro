extends KinematicBody2D

var max_speed = 1000
export var speed = 0
var direction = Vector2.UP

func _physics_process(delta):
	# Reduce speed
	speed -= speed * 0.05
	if Input.is_action_pressed('ui_up'):
		speed = speed + 50
	if Input.is_action_pressed('ui_down'):
		speed = speed - 100
	if Input.is_action_pressed('ui_right'):
		self.rotate(deg2rad(6))
		direction = direction.rotated(deg2rad(6))
	if Input.is_action_pressed('ui_left'):
		self.rotate(deg2rad(-6))
		direction = direction.rotated(deg2rad(-6))
		
	if speed > max_speed:
		speed = max_speed
	if speed < 0:
		speed = 0
	print(speed)
	move_and_slide(direction.normalized() * speed)
	var collision = get_slide_collision(0)
	if collision != null:
		if collision.collider.has_method("push"):
			collision.collider.push(direction.normalized() * (speed / 2))
		speed = 0
	
