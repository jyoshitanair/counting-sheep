extends RayCast2D
var player
@export var can_see = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player_main")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(can_see)
	if player:
		target_position = to_local(player.global_position)
		force_raycast_update()
	if is_colliding():
		print("colliding")
		var collider = get_collider()
		print(collider)
		if collider.is_in_group("player_main"):
			can_see = true
			print("can see")
		else:
			print("hey")
			print(collider.get_groups())
			can_see = false
