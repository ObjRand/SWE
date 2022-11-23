extends TextureRect

var show = true

func ready():
	update()

func _draw():
	if show:
		draw_circle($"../Line2D".points[0],117,Color.black)
		draw_circle($"../Line2D".points[0],115,Color.white)

func _on_Button_pressed():
	show = !show
	update()

func _process(delta):
	pass
