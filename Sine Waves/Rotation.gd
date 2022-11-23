extends Line2D

var angle = 0.02
var center = points[0]
var mover_speed = 10
onready var mover = $Base/Mover

var running = false
var done = false
var reset = false

#var default_mover_0 = points[0]
#var default_mover_1 = points[1]

#onready var default_mover_0_x = mover.points[0][0] + 117
#onready var default_mover_1_x = mover.points[1][0] + 117

#var default_base_y = points[0][1]
#onready var default_definer_1_x = mover.points[1][0]

func _ready():
	mover.points[0] = points[0]
	mover.points[1] = points[1]
	
	mover.points[0][0] += 117
	mover.points[1][0] += 117
	
	$Base.points[0][1] = points[0][1]
	
	$Definer.points[1][0] = mover.points[1][0]

func _process(delta):
	if running:
		points[1] = center + (points[1] - center).rotated(angle)
		
		# Definer Movement
		$Definer.points[0][0] = points[1][0] 
		$Definer.points[0][1] = points[1][1] + 115
		
		$Definer.points[1][0] += mover_speed
		$Definer.points[1][1] = points[1][1] + 115
		
		mover.points[0][0] = mover.points[0][0] + mover_speed
		mover.points[0][1] = $Definer.points[1][1] - 115
		mover.points[1][1] = $Base.points[0][1]
		mover.points[1][0] = mover.points[1][0] + mover_speed
		
		if mover.points[1][0] >= $Base.points[1][0] and not $"../GUI/DEBUG".pressed:
			running = false
			done = true
			
			$"../GUI/PLAY".text = "RESTART"
			
		reset = false
	else:
		$"../MoverFollower".position = points[0]
		
	mover_speed = $"../GUI/MOVER_SPEED".value
	angle = $"../GUI/ANGLE_SPEED".value
	
	if $"../GUI/DEBUG".pressed:
		$"../GUI/MOVER_SPEED".min_value = -10
	else:
		$"../GUI/MOVER_SPEED".min_value = 0

func _input(event):
	if $"../GUI/DEBUG".pressed:
		if Input.is_action_just_pressed("increase_blue"):
			if Input.is_action_pressed("snap"): 
				$"../GUI/ANGLE_SPEED".value += 0.1
			else: $"../GUI/ANGLE_SPEED".value += 0.01
				
		if Input.is_action_just_pressed("decrease_blue"):
			if Input.is_action_pressed("snap"): 
				$"../GUI/ANGLE_SPEED".value -= 0.1
			else: $"../GUI/ANGLE_SPEED".value -= 0.01
			
		if Input.is_action_just_pressed("increase_green"):
			$"../GUI/MOVER_SPEED".value -= 1
		if Input.is_action_just_pressed("decrease_green"):
			$"../GUI/MOVER_SPEED".value += 1
func _on_PLAY_pressed():
	if done:
		get_tree().change_scene("res://main.tscn")
	
	running = !running

