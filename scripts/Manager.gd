extends Node
var player_name: String
var player_list = []
var score = 0

func _ready() -> void:
	SilentWolf.configure({
		"api_key": Secrets.API_KEY,
		"game_id": "countingsheep",
		"log_level": 1,
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/main.tscn"
	})

func _physics_process(delta: float) -> void:
	leaderboard()

func leaderboard():
	for score in Manager.score:
		Manager.player_list.append(Manager.player_name)
		
