
extends Area2D

@onready var collide: CollisionShape2D = $CollisionShape2D

signal on_touch
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("collectable")
func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("player") and body.alive:
		Manager.score +=1
		print("hii")
		call_deferred("_disabled_collision")
func _disabled_collision()-> void:
	collide.disabled = true 
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when the node enters the scene tree for the first time.
