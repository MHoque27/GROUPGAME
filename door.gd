extends Area2D

@export var target_scene: String
@export var prompt_text: String = "Enter"
@export var player_spawn_position = Vector2()
func interact(player):
	print("INTERACT CALLED")
	print("SCENE:", target_scene)

	if Global.game:
		print("CALLING GAME MANAGER")
		$AudioStreamPlayer.play()
		#$Timer.start()
		#await $Timer.timeout
		Global.game.change_scene(target_scene)
		#then change player position from global
	else:
		print("GLOBAL GAME IS NULL")
		
