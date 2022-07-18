extends KinematicBody2D
var isTouching = []
var isClamped = false

func _physics_process(delta):
	position = get_global_mouse_position()
	
	if isTouching.size() > 0:
		clampMouse()
	
	if isClamped == true: #keeps mouse away from the borders to attempt to keep the logo in bounds (but doesn't)
		position.x = clamp(position.x, 244, 1036) #dimensions based on the 720p resolution minus the image resolution
		position.y = clamp(position.y, 110, 610) #should probably delete this and find a better way to do it
		print(str(isClamped))

func _on_AreaScanner_body_entered(body): 
	if body.name == "DVDLogo":
		print(body.name)
		print("entered")
		isTouching.append(body) #adds the DVDLogo to the isTouching array

func _on_AreaScanner_body_exited(body):
	if body.name == "DVDLogo":
		print("exited")
		print(body.name)
		isTouching.erase(body) #removes the DVDLogo from the array

func clampMouse(): #creates timer for how long the mouse is clamped from the border
	isClamped = true
	yield(get_tree().create_timer(1), "timeout")
	isClamped = false
	print(str(isClamped))
