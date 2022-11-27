extends Area2D


onready var empty_selection: Node2D = $EmptySelection

var selection: Node2D = empty_selection
var isOverTable: bool = false
var isOverScale: bool = false

signal mouse_click(item)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed()):
		print_debug("click hand")
		if (selection != empty_selection):
			selection = empty_selection
			print_debug("click hand")
		else:
			return
			selection = get_overlapping_areas()[0]
		
# Called when the node enters the scene tree for the first time.
func _ready():
	selection = empty_selection
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_viewport().get_mouse_position()
	selection.position = position

func _on_Item_pickup():
	selection = self
	return


func _on_Table_mouse_entered():
	isOverTable = true
	print_debug("mouse enter table")
	return


func _on_Table_mouse_exited():
	isOverTable = false
	print_debug("mouse exit table")
	return
