extends Node

export(Texture) var defaultCursor
export(Texture) var grabCursor
export(Texture) var dropCursor
export(Texture) var denyCursor
export var testInt = 5

func _ready():
	Input.set_custom_mouse_cursor(defaultCursor, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(grabCursor, Input.CURSOR_DRAG)
	Input.set_custom_mouse_cursor(dropCursor, Input.CURSOR_CAN_DROP)
	Input.set_custom_mouse_cursor(denyCursor, Input.CURSOR_FORBIDDEN)
