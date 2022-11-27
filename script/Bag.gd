extends Area2D

var weight: float = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Bag_mouse_entered():
	print_debug("enter bag")
	ItemManager.connect("click", self, "pickUp")
	return
	
func _on_Bag_mouse_exited():
	print_debug("exit bag")
	ItemManager.disconnect("click", self, "pickUp")
	return
	
func pickUp(item):
	if ItemManager.heldItem == null:
		ItemManager.setHeldItem(self)
	return
	
func collectFlower(flower):
	pass



