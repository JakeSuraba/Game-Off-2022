extends Area2D


signal display_changed(text)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var realWeight: float = 0
var displayWeight: float = 0
var zeroOffset: float = 0

var placedItem: Node2D = null


# Called when the node enters the scene tree for the first time.
func _ready():
	$ZeroButton.connect("pressed", self, "zero")
	connect("display_changed", $ScaleDisplay, "updateText")

func zero():
	print_debug("scale zeroed")
	if placedItem == null:
		zeroOffset = 0.0
	else:
		zeroOffset = realWeight
	updateDisplayWeight()
	
func placeItem(item):
	
	if item.has_method("get_weight") and item.has_method("get_place_offset"):
		ItemManager.dropItem()
		print_debug("place offset" + str(item.get_place_offset()))
		item.position = $SnapPosition.position + item.get_place_offset()
		placedItem = item
		updateDisplayWeight()
		
		print_debug(displayWeight)
		
		item.connect("picked_up", self, "on_placedItem_picked_up")
		if item.has_signal("weight_changed"):
			item.connect("weight_changed", self, "updateDisplayWeight")

func on_click_with_item(item):
	if placedItem == null:
		placeItem(item)
		
func updateDisplayWeight():
	if placedItem != null:
		realWeight = placedItem.get_weight()
	else:
		realWeight = 0.0
	
	displayWeight = realWeight - zeroOffset
	emit_signal("display_changed", str(displayWeight))
	
func on_placedItem_picked_up():
	placedItem.disconnect("picked_up", self, "on_placedItem_picked_up")
	if placedItem.has_signal("weight_changed"):
		placedItem.disconnect("weight_changed", self, "updateDisplayWeight")
	placedItem = null
	realWeight = 0.0
	updateDisplayWeight()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
