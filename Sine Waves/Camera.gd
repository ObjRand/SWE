extends Camera2D

var follow = false

func _ready():
	position = $"../Line2D/Base/Mover".points[0]


func _process(delta):
	if $"../Line2D".running and follow:
		position = $"../Line2D/Base/Mover".points[0]
		
		offset = Vector2(-200,-250)
	else:
		position = Vector2(0,0)
		
		offset = Vector2(0,0)


func _on_FOLLOW_pressed():
	follow = !follow
