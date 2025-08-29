extends ParallaxBackground

@export var scroll_speed: Vector2 = Vector2(0, 1000)

func _process(delta):
	scroll_offset += scroll_speed * delta
