extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var click_all: bool = false
var ignore_unclickable: bool = true

var heldItem: Node2D = null
var lastHovered: Area2D = null
var mousePos: Vector2
var hand: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
func _input(event):
	#var space_state = Physics2DDirectSpaceState.get_world_2d().direct_space_state
	#var result = space_state.intersect_point(mousePos)
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed()):
		#emit_signal("click", heldItem)
		print_debug("click")
		
		var shapes = get_world_2d().direct_space_state.intersect_point(mousePos, 32, [], 0x7FFFFFFF, true, true) # The last 'true' enables Area2D intersections, previous four values are all defaults
		# higher z index comes first
		shapes.sort_custom(self, "compShapeZIndex")
		for shape in shapes:
			if heldItem != null and shape["collider"].has_method("on_click_with_item"):
				shape["collider"].on_click_with_item(heldItem)
				break
			elif heldItem == null and shape["collider"].has_method("on_click_no_item"):
				shape["collider"].on_click_no_item()
				break
		
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pickUpItem(item: Node2D):
	# first try to drop any held item
	dropItem()
	
	item.get_node("CollisionPolygon2D").set_disabled(true)
	heldItem = item
	return
	
func dropItem():
	if heldItem != null:
		heldItem.position = mousePos + heldItem.get_place_offset()
		heldItem.get_node("CollisionPolygon2D").set_disabled(false)
		heldItem = null
		return
	
func getAreaAtPos(pos: Vector2):
	var space_state = Physics2DDirectSpaceState.get_world_2d().direct_space_state
	var result = space_state.intersect_point(pos)
	
func _process(delta):
	mousePos = get_viewport().get_mouse_position()
	if heldItem != null:
		heldItem.position = mousePos

func compShapeZIndex(a, b):
	return a["collider"].z_index > b["collider"].z_index
