extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func placeItem(item: Node2D):
	if ItemManager.heldItem != null:
		print_debug("placing item")
		ItemManager.heldItem = null
	return

func _on_Table_mouse_entered():
	print_debug("enter table")
	ItemManager.connect("click", self, "placeItem")
	return

func _on_Table_mouse_exited():
	print_debug("exit table")
	ItemManager.disconnect("click", self, "placeItem")
	return
