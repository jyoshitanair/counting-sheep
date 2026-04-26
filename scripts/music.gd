extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	stream = load("res://assets/images/music/bg_music.wav")
	if not playing:
		play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
