extends ParallaxBackground

@onready var space_layer = %SpaceLayer
@onready var far_stars_layer = %FarStarsLayer
@onready var close_stars_layer = %CloseStarsLayer


func _process(delta):
	close_stars_layer.motion_offset.y += 20 * delta
	far_stars_layer.motion_offset.y += 10 * delta
	space_layer.motion_offset.y += 5 * delta
