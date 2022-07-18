extends RigidBody2D

var speed = 400
var max_speed = 400

var rng = RandomNumberGenerator.new()

func _ready(): #launches logo in a random direction on start
	rng.randomize()
	var my_random_number = rng.randf_range(0, PI)
	print(my_random_number)
	linear_velocity = Vector2(speed, 0).rotated(my_random_number)

func _integrate_forces(state):
	state.linear_velocity = state.linear_velocity.clamped(max_speed) #caps speed at 400

func _on_Area2D_body_entered(body): #changes color and plays sound effect upon touching another object
	if body.name != "DVDBody":
		$BounceSound.play()
		$DvdLogo.modulate =  Color(rand_range(0.3, 1), rand_range(0.3, 1), rand_range(0.3, 1), 1)
