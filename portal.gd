extends Area2D

@export_file(".tscn") var destination_scene: String
# Called when the node enters the scene tree for the first time.

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", destination_scene)
