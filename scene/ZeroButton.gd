extends Area2D

signal pressed

func on_click_no_item():
	emit_signal("pressed")
	print_debug("zeroed")
