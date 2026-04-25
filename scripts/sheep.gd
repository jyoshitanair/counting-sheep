extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		print("hi")
	if self.get_groups()[0] == "enemy":
		print("hiiiii")

func _on_area_2d_mouse_entered() -> void:
	print("hello")
