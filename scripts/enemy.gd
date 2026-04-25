extends CharacterBody2D
var player
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var raycast: RayCast2D = $RayCast2D
@onready var detection: Area2D = $detection
func _ready() -> void:
	player=get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if e.is_in_group("player") and e.alive and raycast.can_see:
		chase() 

func chase() -> void:
	# check wall, then chase, if wall - turn
	var starts = detection.get_overlapping_bodies()
	for e in starts:
		if e.is_in_group("tiles"):
			
			#chase player
	
player.global_position
velocity=
