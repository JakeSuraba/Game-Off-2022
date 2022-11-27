extends Node

signal click(item)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var heldItem: Node2D = null
var lastHovered: Area2D = null
var mousePos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var items = get_tree().get_nodes_in_group("Item")
	for item in items:
		item.connect("")
		
func _input(event):
	var space_state = Physics2DDirectSpaceState.get_world_2d().direct_space_state
	var result = space_state.intersect_point(mousePos)
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed()):
		emit_signal("click", heldItem)
		print_debug("click")
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setHeldItem(item: Node2D):
	heldItem = item
	return
	
func setItemPosition(item: Node2D, pos: Vector2):
	item.position = pos;
	
func getAreaAtPos(pos: Vector2):
	var space_state = Physics2DDirectSpaceState.get_world_2d().direct_space_state
	var result = space_state.intersect_point(pos)
	result.
	
func _process(delta):
	mousePos = get_viewport().get_mouse_position()
	if heldItem != null:
		heldItem.position = mousePos
		
func removeAllSignals():
	var signals = get_signal_list()
	for s in signals:
		var connections = get_signal_connection_list(s.name)
		for c in connections:
			disconnect(c.signal, c.target, c.method)
	return
	
