extends KinematicBody2D

signal dead

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200
var direction = Vector2.ONE * speed
var bounces = 0
var max_bounces = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.add_lol(self)
	
func on_player_collide(collision):
	bounces += 1
	# if bounces >= max_bounces:
	#	queue_free()
	#	emit_signal("dead", self)
	# self.scale += self.scale * 0.05
	$ColorRect.color.g -= 0.2
	$ColorRect.color.r += 0.2
	
func push(push_direction):
	print("Being pushed", push_direction)
	direction += push_direction

func _physics_process(delta):
	# Reduce the speed
	direction -= direction * (delta * 0.1)
	#for i in get_slide_count():
	var i = 0
	var collision = get_slide_collision(0)
	if collision != null:
		print("I collided with ", collision.collider.name, " ", collision.position, collision.normal, collision.collider_velocity)
		direction = direction.bounce(collision.normal) - (collision.normal * 2)
		direction += collision.collider_velocity * 0.025
		if collision.collider != null && collision.collider.name == "Player":
			on_player_collide(collision)
	move_and_slide(direction)
