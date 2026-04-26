extends CharacterBody2D
var direction = Vector2(-1,0)
var alive = true
var score = 0
const speed = 3000
var tree

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	if alive:
		if Input.is_action_just_pressed("space"):
			alive = false
		if Input.is_action_pressed("up"):
			print("up")
			direction = Vector2(0,-1)
			
		if Input.is_action_pressed("down"):
			print("down")
			direction = Vector2(0,1)
		if Input.is_action_pressed("left"):
			direction = Vector2(-1,0)
		if Input.is_action_pressed("right"):
			direction = Vector2(1,0)
		velocity = direction*speed*delta
		move_and_slide()
	else:
		Manager.score = score
		tree = get_tree()

		SilentWolf.Scores.save_score(Manager.player_name, Manager.score).sw_save_score_complete
		call_deferred("submit")
		
func submit() -> void:
	if not is_inside_tree():
		return
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")
