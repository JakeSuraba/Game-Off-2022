extends Area2D


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
	if placedItem == null:
		zeroOffset = 0.0
	else:
		zeroOffset = realWeight
	
func placeItem(item):
	if item.has_method("get_weight"):
		ItemManager.dropItem()
		placedItem = item
		realWeight = placedItem.get_weight()
		displayWeight = realWeight - zeroOffset

	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
