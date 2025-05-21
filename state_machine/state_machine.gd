class_name StateMachine
extends Node

@export var initial_state: State

var states: Dictionary = {}

var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			var state_child: State = child as State  # Explicitly cast to State
			states[state_child.name.to_lower()] = state_child
			state_child.Transitioned.connect(on_child_transition)
			
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
			
func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state: State, new_state_name: String) -> void:
	
	if state != current_state:
		return
	
	var new_state: State = states.get(new_state_name.to_lower())

	if !new_state:
		return

	if current_state:
		current_state.Exit()
		
	new_state.Enter()
		
	current_state = new_state
