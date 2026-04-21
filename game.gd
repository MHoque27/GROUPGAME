class_name GameController extends Node2D
#figure out how to make this script a global and scene script at the same times
var current_scene
@export var scene_holder : Node
@export var transition_controller : Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	Global.game = self
	current_scene = $World/main_menu
# Called every frame. 'delta' is the elapsed time since the previous frame.

func change_scene(
	new_scene: String, 
	delete: bool = true, #delete the scene true or false
	keep_running: bool = false, #hide the scene true or false
	transition: bool = true, 
	transition_in: String = "Fade In",
	transition_out: String = "Fade Out",
	seconds: float = 1.0):
	
	#fade to black
	#if transition:
		#transition_controller.transition(transition_in, seconds)
		#await transition_controller.animation_player.animation_finished
		
	if current_scene != null:
		if delete:
			current_scene.queue_free() # remove scene
		elif keep_running:
			current_scene.visible = false # hide scene but keep running
		else:
			scene_holder.remove_child(current_scene) #keeps scene in memory not running
	var new = load(new_scene).instantiate()
	scene_holder.add_child(new)
	current_scene = new
	
	#fade back in
	#if transition:
		#transition_controller.transition(transition_out, seconds)
		#await transition_controller.animation_player.animation_finished
		
		
#func _process(delta: float) -> void:
	#pass
#func load_level(scene_path: String):
	#
	#if current_level:
		#current_level.queue_free()
		#
	#var scene = load(scene_path)
	#current_level = scene.instantiate()
	#
	#$World.add_child(current_level)
