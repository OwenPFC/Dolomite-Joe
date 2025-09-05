extends Node2D

@onready var dialogue = $textbox/theText

var opener = ["Howdy there, my name is Dolomite Joe", "I'm the proud owner of America's preeminent rock farm", "I run this place with my wife and my 6 beautiful children",
"Such was the case until we got a little gift from the government", "Their machine, they want to replace our farm with their machine", "They're gonna help the rock industry by increasing production tenfold",
"So they say", "But who knows where those rocks are even coming from", "So, I made it my life's mission to save our industry from this machine", "I'm gonna reach out to the biggest people in the industry and get them on our side",
"We simply cannot allow an automated rock machine crush the hundreds of family farms who make their livelyhood from rock production", "end", "end2"]

var success = ["We did it", "The machine is no more", "We asserted our dominace in the market, we got everyone to boycott", "The rock industry is saved, and we can now live in peace", "end", "end2"]

var fail = ["We couldn't do it", "Despite our best efforts, no one else could see our vision", "They were blinded by profit and quantity", "Now those of us who make an honest living will suffer greatly",
"We'll have to find new jobs", "Generations of Dolomite history and tradition is now left behind for a little increased production", "end", "end2"]

var indexCount = 0
var animationPlayed = false
var animationPlayed2 = false

var winCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	indexCount = 0
	dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.ceoOfGravel):
		winCount+=1
		Global.ceoOfGravel = false
	if(Global.collector):
		winCount+=1
		Global.collector = false
	if(Global.crusader):
		winCount+=1
		Global.crusader = false
	
	if((Input.is_action_just_pressed("click"))):
		indexCount+=1
	if(Global.day == 1):
		$animated1.play("start")
		if(indexCount<len(opener)):
			dialogue.text = opener[indexCount]
		if(dialogue.text == "Their machine, they want to replace our farm with their machine"):
			$animated1.stop()
			$animated1.visible = false
			$animated2.visible = true
			if(!animationPlayed):
				$animated2.play("sequence")
				animationPlayed = true
		if(dialogue.text == "end"):
			$next.visible = true
		if(dialogue.text == "end2"):
			get_tree().change_scene_to_file("res://interrogation.tscn")
	if(Global.day == 3):
		if(winCount==3):
			if(indexCount<len(success)):
				dialogue.text = success[indexCount]
			if(!animationPlayed2):
				$animated1.visible = false
				$animated2.visible = true
				$animated2.play("sequence",-1.0,true)
				animationPlayed2 = true
			if($animated2.frame == 0):
				$animated1.visible = true
				$animated2.visible = false
				$animated1.play("start")
			if(dialogue.text == "end"):
				$endScreen.visible = true
			if(dialogue.text == "end2"):
				pass
				#SDAOIJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ HOME SCREEN????
		else:
			if(indexCount<len(fail)):
				dialogue.text = fail[indexCount]
			$fail.visible = true
			if(dialogue.text == "end"):
				$endScreen.visible = true
			if(dialogue.text == "end2"):
				pass
			
		
