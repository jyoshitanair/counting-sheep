extends CharacterBody2D
var player
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var raycast: RayCast2D = $RayCast2D
@onready var detection: Area2D = $detection
var direction = Vector2.LEFT

func _ready() -> void:
	player=get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if player and player.alive and raycast.can_see:
		var to_player = (player.global_position-global_position).normalized()
		velocity = lerp(velocity, to_player * SPEED, delta * 10)
		# check wall, then chase, if wall - turn
	var starts = detection.get_overlapping_bodies()
	for e in starts:
		if e.is_in_group("tiles"):
			if direction==Vector2.LEFT or direction==Vector2.RIGHT:
				var s = sign(player.global_position.y-global_position.y)
				if s==1:
					direction=Vector2.UP
				if s==-1:
					direction=Vector2.DOWN
			if direction==Vector2.UP or direction==Vector2.DOWN:
				var x = sign(player.global_position.x-global_position.x)
				if x==1:
					direction=Vector2.RIGHT
				if x==-1:
					direction=Vector2.LEFT
				
			else:
				velocity=lerp(velocity, direction*SPEED, delta*10)
				
			move_and_slide()
				
					
				
				
				
				
				
		
