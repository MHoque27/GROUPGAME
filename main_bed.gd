extends Area2D

@export var prompt_text: String = "Sleep"

# List of possible dream scenes
@export var dream_scenes: Array[String] = [
	"res://level.tscn",
	"res://level_2.tscn"
]

@export var dream_weights: Array[int] = [70, 20]

func interact(player):
	print("INTERACT CALLED")

	var chosen_scene = get_random_dream()
	print("CHOSEN DREAM:", chosen_scene)

	if Global.game:
		$AudioStreamPlayer.play()
		Global.game.change_scene(chosen_scene)
	else:
		print("GLOBAL GAME IS NULL")


func get_random_dream() -> String:
	# Safety check
	if dream_scenes.size() == 0:
		return ""

	if dream_scenes.size() != dream_weights.size():
		push_error("dream_scenes and dream_weights must have the same size.")
		return dream_scenes[0]

	# Sum all weights
	var total_weight = 0
	for weight in dream_weights:
		total_weight += weight

	# find a random numer
	var random_value = randi() % total_weight

	# checks each scene for the matching number wiht a for in loop
	var running_total = 0
	for i in range(dream_scenes.size()):
		running_total += dream_weights[i]

		if random_value < running_total:
			return dream_scenes[i]

	# Fallback
	return dream_scenes[0]
