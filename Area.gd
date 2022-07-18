extends Node

func _on_Corner1_body_entered(body):
	if body.name == "DVDLogo":
		celebrate($Corners/Corner1/CollisionShape2D.position)


func _on_Corner2_body_entered(body):
	if body.name == "DVDLogo":
		celebrate($Corners/Corner2/CollisionShape2D.position)


func _on_Corner3_body_entered(body):
	if body.name == "DVDLogo":
		celebrate($Corners/Corner3/CollisionShape2D.position)


func _on_Corner4_body_entered(body):
	if body.name == "DVDLogo":
		celebrate($Corners/Corner4/CollisionShape2D.position)

func celebrate(pos):
	print(str(pos))
	$SparksSound.play()
	var Sparks = preload("res://Sparks.tscn").instance()
	Sparks.name = "Sparks" + str(randi())
	Sparks.position = pos
	add_child(Sparks)
	get_node(Sparks.name).emitting = true
	yield(get_tree().create_timer(1), "timeout")
	get_node(Sparks.name).queue_free()
