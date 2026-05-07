class_name InteractionComponent
extends Node

#@onready var prompt_label = get_tree().root.get_node("GameController/Canvas_Layer/InteractLabel")
@onready var prompt_label = get_tree().get_first_node_in_group("ui_prompt")
var player
var interactables_in_range: Array = []

func init(p):
	player = p

func _ready():
	print("UI NODE:", get_tree().root.get_node_or_null("Game/Canvas_Layer/InteractLabel"))
	pass

func connect_area(area_node):
	area_node.area_entered.connect(_on_area_entered)
	area_node.area_exited.connect(_on_area_exited)

func _on_area_entered(area):
	print("ENTERED:", area.name)
	
	if area.has_method("interact"):
		interactables_in_range.append(area)
		
		if prompt_label:
			prompt_label.text = "[E] - " + area.prompt_text
			prompt_label.visible = true

func _on_area_exited(area):
	interactables_in_range.erase(area)
	
	if interactables_in_range.is_empty():
		if prompt_label:
			prompt_label.visible = false

func handle_interaction():
	if Input.is_action_just_pressed("interact"):
		print(interactables_in_range)
		print("E pressed")
		var target = get_closest()
		if target:
			target.interact(player)
			

func get_closest():
	var closest = null
	var min_dist = INF

	for obj in interactables_in_range:
		var dist = player.global_position.distance_to(obj.global_position)
		if dist < min_dist:
			min_dist = dist
			closest = obj

	return closest
