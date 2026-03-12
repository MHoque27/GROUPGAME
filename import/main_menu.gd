extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	#tween(%TextureRect2, "rotation", Vector2(100, 200), 5.0)
	%MenuMusic.play()
		#song ranked for best:
		#1. cathedral
		#2. tired song
		#3. dwellers
	var tween = create_tween().set_loops()
	tween.tween_property(%Spotlight04A, "scale", Vector2(1.4, 1.4), 3.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(%Spotlight04A, "scale", Vector2(0.9, 0.9), 3.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	#NOTE: find out how to do multiple tweens and make the gradient modulate:a
	#property go up and down independant of this loop, and in another
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	%TextureRect2.pivot_offset = %TextureRect2.size / 2
	%TextureRect2.rotation_degrees += 15 * delta
	%Spotlight04A.rotation_degrees -= 12 * delta
	%Spotlight08A.rotation_degrees += 7 * delta
func button_hover(button: Button, tween_amt, duration):
	## change pivot if desired)
	button.pivot_offset_ratio = Vector2(0.5,0.5)
	if button.is_hovered():
		#print("hovered")
		## if button state is hover than scale up
		tween(button, "scale", Vector2.ONE, duration)
		
## create tweens and pass in arguments to tween property
func tween(button, property, amount, duration):
	var tween = create_tween()
	tween.tween_property(button, property, amount, duration)
