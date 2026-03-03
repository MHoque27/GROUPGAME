extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_physics: GravityPhysics
@export var input_process : InputProcess
@export var movement_component: MovementComponent

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	gravity_physics.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_process.input_horizontal)
	
	move_and_slide()
