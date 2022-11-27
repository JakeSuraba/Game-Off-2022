extends Area2D


signal state_changed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var realWeight: float = 0
var displayWeight: float = 0
var zeroOffset: float = 0

var placedItem: Node2D = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func zero():
	print_debug("scale zeroed")
	if placedItem == null:
		zeroOffset = 0.0
	else:
		zeroOffset = realWeight
	
func placeItem(item):
	
	if item.has_method("get_weight") and item.has_method("get_place_offset"):
		ItemManager.dropItem()
		print_debug("place offset" + str(item.get_place_offset()))
		item.position = $SnapPosition.position + item.get_place_offset()
		placedItem = item
		realWeight = placedItem.get_weight()
		updateDisplayWeight()
		
		print_debug(displayWeight)
		
		item.connect("picked_up", self, "on_placedItem_picked_up")

func on_click_with_item(item):
	if placedItem == null:
		placeItem(item)
		
func updateDisplayWeight():
	displayWeight = realWeight - zeroOffset
	emit_signal("state_changed")
	
func on_placedItem_picked_up():
	placedItem.disconnect("picked_up", self, "on_placedItem_picked_up")
	placedItem = null
	realWeight = 0.0
	updateDisplayWeight()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
