extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var raycast: RayCast2D = $RayCast2D

func _physics_process(delta: float) -> void:
	if raycast.can_see:
		print("i see ya fella")
	else:
		print("hell nah")
	move_and_slide()
