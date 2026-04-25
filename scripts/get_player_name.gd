extends Control

var loaded = false
@onready var line_edit: LineEdit = $LineEdit
@onready var button: TextureButton = $Node2D/TextureButton
@onready var label: Label = $Node2D/TextureButton/Label
@onready var fail: Label = $Label
@onready var timer: Timer = $Timer

func _ready() -> void:
	await SilentWolf.Scores.get_scores(0).sw_get_scores_complete
	loaded = true

func _on_pressed() -> void:
	button.disabled = true
	label.text = "Hang on..."
	if not loaded:
		return
	if check_name():
		fail.show()
		timer.start()
		button.disabled = false
		label.text = "Submit"
	else:
		Manager.player_name = line_edit.text
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func check_name()-> bool:
	if line_edit.text.strip_edges().to_lower() == "":
		fail.text = "Enter a name"
		return true
	for score_data in SilentWolf.Scores.scores:
		if score_data["player_name"].strip_edges().to_lower() == line_edit.text.strip_edges().to_lower():
			return true
	return false
	fail.text = "Name already in use"

func _on_timer_timeout() -> void:
	fail.hide()
