extends Node

export var weight: float = 2.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_weight() -> float:
	return weight
	
func on_click_no_item():
	ItemManager.pickUpItem(get_node("."))
	
func on_click_with_item(item):
	if item.has_method("collectFlower"):
		item.collectFlower(get_node("."))
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
