extends Node2D


onready var PIXELSC = preload("res://PIXEL.tscn")


func _process(delta):
	if $Timer.is_stopped(): $Timer.start()
	

func _on_Timer_timeout():
	if $Line2D.running:
		var p = PIXELSC.instance()
		add_child(p)
		
		p.rect_position = $Line2D/Base/Mover.points[0]
		var temp_C = Color($GUI/COLORHEX.text)
		p.color = Color(temp_C.r,temp_C.g,temp_C.b)
		#print(p)
		#print($Line2D.running)


func _on_Button_pressed():
	$Line2D.visible = !$Line2D.visible
	$GUIDE3.visible = !$GUIDE3.visible

