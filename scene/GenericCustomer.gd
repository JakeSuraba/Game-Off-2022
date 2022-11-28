extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var orderWeight: float = 5.0
export var possibleOrderWeights: Array


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_click_with_item(item):
	if item.has_method("get_weight"):
		print_debug("gave customer " + str(item.get_weight()))
		ItemManager.dropItem()
		item.queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
