extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_physics: GravityPhysics
@export var input_process : InputProcess
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var jump_component: JumpComponent

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	gravity_physics.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_process.input_horizontal)
	animation_component.handle_move_animation(input_process.input_horizontal)
	jump_component.handle_jump(self, input_process.get_jump_input())
	animation_component.handle_jump_animation(jump_component.is_jumping, gravity_physics.is_falling)
	
	move_and_slide()
