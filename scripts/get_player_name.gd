extends Control

@onready var line_edit: LineEdit = $LineEdit

func _on_submit_pressed() -> void:
	Manager.player_name = line_edit.text
	var sw_result : Dictionary = await SilentWolf.Scores.save_score(Manager.player_name, Manager.score).sw_save_score_complete
	print ("Score persisted successfully: " + str(sw_result.score_id))
	self.hide()

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
