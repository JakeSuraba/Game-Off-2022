extends Area2D

var weight: float = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var half_threshold: float = 5.0
export var full_threshold: float = 10.0 

export var half_texture: Texture
export var full_texture: Texture


func _on_Bag_mouse_entered():
	print_debug("enter bag")

	return
	
func _on_Bag_mouse_exited():
	print_debug("exit bag")

	return
	
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
		
	
func on_click_no_item():
	ItemManager.pickUpItem(get_node("."))
		
func on_click_with_item(item):
	if item.has_method("get_weight"):
		ItemManager.dropItem()
		collectFlower(item)



