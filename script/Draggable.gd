extends Area2D

onready var parent: Node2D = get_owner()

var is_picked_up: bool = false

func _ready():
	set_process_input(false)

func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if (
		event is InputEventMouseButton
		and event.button_index == BUTTON_LEFT
		and event.is_pressed()
	):
		is_picked_up = !is_picked_up

func _process(delta: float) -> void:
	if (is_picked_up):
		parent.position = get_viewport().get_mouse_position()
