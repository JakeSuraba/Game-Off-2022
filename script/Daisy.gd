extends Node

signal picked_up

export var weight: float = 2.0

export var place_offset: Vector2 = Vector2.UP * 10

func get_weight() -> float:
	return weight
	
func get_place_offset() -> Vector2:
	return place_offset
	
func on_click_no_item():
	ItemManager.pickUpItem(get_node("."))
	emit_signal("picked_up")
	
func on_click_with_item(item):
	if item.has_method("collectFlower"):
		item.collectFlower(get_node("."))
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

