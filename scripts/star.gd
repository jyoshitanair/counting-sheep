extends Area2D



@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



signal on_touch
func _ready() -> void:
	add_to_group("collectable")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player") and body.alive):
		emit_signal("on_touch")
		call_deferred("_disabled_collision")
func _disabled_collision() -> void:
	collision_shape_2d.disabled = true
	
# Called when the node enters the scene tree for the first time.
