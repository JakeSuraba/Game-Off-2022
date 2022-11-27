extends Area2D

signal picked_up

var weight: float = 0.2

export var half_threshold: float = 5.0
export var full_threshold: float = 10.0

export var place_offset: Vector2 = Vector2.UP * 50

var half_texture: Texture = load("res://texture/Bag/Half bag.png")
var full_texture: Texture = load("res://texture/Bag/Full bag.png")
	
func pickUp(item):
	if ItemManager.heldItem == null:
		ItemManager.setHeldItem(self)
	return
	
func collectFlower(flower):
	weight += flower.get_weight()
	# destroy flower
	if (weight > full_threshold):
		$Sprite.texture = full_texture
		# full, dont add more
	elif weight >= half_threshold:
		$Sprite.texture = full_texture
	elif weight > 0:
		$Sprite.texture = half_texture
	
	flower.queue_free()
	
	print_debug(weight)
	return

func on_click_no_item():
	ItemManager.pickUpItem(get_node("."))
	emit_signal("picked_up")
		
func on_click_with_item(item):
	if item.has_method("get_weight"):
		ItemManager.dropItem()
		collectFlower(item)
		
func get_weight() -> float:
	return weight
	
func get_place_offset() -> Vector2:
	return place_offset



