extends ParallaxBackground

var scrolling_Sspeed = 100

func _process(delta):
	scroll_offset.x -= scrolling_Sspeed * delta
