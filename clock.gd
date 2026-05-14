extends Area2D


@export var prompt_text: String = "Enter"
#@onready var uitool = get_tree().get_first_node_in_group("ui_tool")
func _process(delta:float) -> void:
	if Global.game.clock_taken == true:
		queue_free()
func interact(player):
	
	print("INTERACT CALLED")
	print("SCENE:",)
	var clock = get_tree().current_scene.find_child("ClockUi", true)
	var transition_controller = get_tree().current_scene.find_child("TransitionController", true)
	var transition_in = "fade_in"
	var transition_out = "fade_out"
	var seconds = 1.5
	transition_controller.transition(transition_in, seconds)
	await transition_controller.animation_player.animation_finished
	
	$AnimationPlayer.play("obtain_In")
	$AudioStreamPlayer.play()
	#$buddhitmetronom.play()
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("obtain_In2")
	await $AnimationPlayer.animation_finished
	
	$Timer.start()
	await $Timer.timeout
	
	$AnimationPlayer.play("obtain_OutBoth")
	await $AnimationPlayer.animation_finished
	$AudioStreamPlayer.stop()
	#$buddhitmetronom.stop()
	transition_controller.transition(transition_out, seconds)
	clock.visible = true
	queue_free()
	await transition_controller.animation_player.animation_finished
	Global.game.clock_taken = true
	print(Global.game.clock_taken)

	
