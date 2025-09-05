extends Node2D

var day = 0
var day1Successful = false
var day2Successful = false
var day3Successful = false

var main1 = ["Kids, your father is a hero", "We're one step closer to saving the rock industry", "Even the ceo of gravel
understands how dire the situation is", "I think that means I can get through to anyone", "We knew you could do it Dad",
"We're gonna save the rocks too!", "I'm sorry kids", "I couldn't get the man to budge","I should've known CEO of gravel would've been a tough sell", 
"I'm just gravel at his feet to him...", "Don't worry Dad, we believe in you",
"In fact, we're gonna help you out Dad.", "We're gonna produce more rocks than ever!!",
"We were thinkin' of packing the pig's carrots and feed with protein powder", "We think that'd make them a lot more efficient
at sniffin' out the rocks", "Really kick 'em into gear, you know?", "What do you think about that?", "I think that's a great idea kids", "Let's get
those  pigs rearin'", "I'm not so sure that that would work", "Let's not blame our problems on the pigs now", "!", "end"]

var main2G = ["DAD DAD DAD", "We had one of our biggest harvests ever!!", "That's great. I had a very good day at work too.","Kids, don't ever believe that you're not learning valuable skills here", "I just got closer to saving the rock industry with good ol' fashioned rock recognition",
"I've still got it, I can spot a fake from a mile away.", "main2End", "main2End2"]

var main2B = ["DAD DAD DAD", "We had one of our biggest harvests ever!!", "That's great. I wish my day of work was as good.","Never meet your heroes", "Helmut wouldn't budge, and he was so childish about it too", "I mean just because I'm not a rock savant like him doesn't mean I'm above rocks",
"It's been awhile since I've really gotten my hands dirty you know", "Perhaps that's a lesson on unfairness", "Doesn't matter how sound your argument is",
"If you don't know rocks, you can go kick em", "main2End", "main2End2"]

var main2Night = ["Dad, you know how we had a really productive day today?", "Well uh, I uh...", "I took some rocks from The Machine", "We had a really low harvest today...",
"I just couldn't leave it so light when I know you're working so hard trying to save us", "I thought the only way to save us was to increase production just a bit...",
"I'm really sorry"]

var nightGood = ["It's alright son.", "If it makes you feel any better, Helmut Felsen thought the same way.", "Brilliant minds may think alike", "It's a shame that we have a bad harvest out there now"
, "But also, I imagine most of our rocks are gonna end up filling a pit or lining some backyard path", "We're not necessarily in an industry known for quality",
"No one will know the difference", "Now let's just make sure our harvests stay organic from now on, alright?", "end"]

var nightBad = ["I'm not sure what to say to you", "You know how hard I've been trying to convince these industry fools that The Machine is the worst thing to ever happen to us", 
"I counter this quantity over quality logic day in and day out, and now I'm getting it from my own son...", "Sorry, that was uncalled for", "All it shows is that these guys I'm bargaining with have the cognitive abilities of a 14 year old",
"It does make sense", "And it's not as if this is an industry known for quality", "Most consumers won't ever see the differnece","So I don't anticipate this being a problem for us, but never do that again",
"I'm proud of you for your honesty", "But seriously, please never do that again", "If it comes out the Dolomites used The Machine, well we'll be done for for sure",
"That's a scandal that'd leave the rock industry in shambles", "So let's just make sure our harvests stay organic from now on, alright?","end"]

var night2 = [main2G, main2B,main2Night,nightGood,nightBad]
var listUsed = 0

@onready var dialogue = $textBox/theText

var indexCount = 0
var choiceIsHappening = false
var choice1Chosen = false
var choice2Chosen = false

var joeMode = false

var needToSkipDialogue = true

# Called when the node enters the scene tree for the first time.
func _ready():
	joeMode = false
	indexCount = 0
	listUsed = 0
	changeVisibility(false)
	day = Global.day
	day1Successful = Global.day1Successful
	day2Successful = Global.day2Successful
	day3Successful = Global.day3Successful
	if(!day1Successful and day == 1):
		indexCount+=6 #to skip win dialogue
	if(day2Successful and day ==2):
		listUsed = 0
	elif(!day2Successful and day == 2):
		listUsed = 1
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dialogue.text == "Kids, your father is a hero"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "We knew you could do it Dad"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "I'm sorry kids"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Don't worry Dad, we believe in you"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "I think that's a great idea kids" or dialogue.text == "I'm not so sure that that would work"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "DAD DAD DAD"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "That's great. I had a very good day at work too." or dialogue.text == "That's great. I wish my day of work was as good." ):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
		

	if((Input.is_action_just_pressed("click") and !choiceIsHappening)):
		indexCount+=1
	if(day == 1):
		if(day1Successful and !joeMode):
			"""visual.texture = -----succeed--------------------------------------------------------------------"""
			if(indexCount==6 and needToSkipDialogue):
				indexCount = 12 #to skip the fail dialogue
				needToSkipDialogue = false
		elif(!day1Successful and !joeMode):
			"""visual.texture = -----fail---------------------------------------------------------------------------"""
			
		if(indexCount<len(main1) and !joeMode):
				dialogue.text = main1[indexCount]
				if(main1[indexCount]=="What do you think about that?"):
					joeMode = true
					
		if(joeMode):
			choiceIsHappening = true
			hitBoxAbility($choice1,false)
			hitBoxAbility($choice2,false)
			changeVisibility(true)
			$choice1.text = "That sounds like a great plan"
			$choice2.text = "I'm not too sure about that"
			
			if(choice1Chosen):
				choiceMade("day1", 1)
			if(choice2Chosen):
				choiceMade("day1", 2)
	
	if(day == 2):
		if(indexCount<len(night2[listUsed]) and !joeMode):
				dialogue.text = night2[listUsed][indexCount]
				print(listUsed)
				print(indexCount)
				if(night2[listUsed][indexCount] == "main2End"):
					$endScreen.visible = true
				if(night2[listUsed][indexCount] == "main2End2"):
					get_tree().change_scene_to_file("res://negotiation_3.tscn")
					indexCount = 0
					listUsed = 2
				if(night2[listUsed][indexCount]=="I'm really sorry"):
					joeMode = true
		if(joeMode):
			choiceIsHappening = true
			hitBoxAbility($choice1,false)
			hitBoxAbility($choice2,false)
			changeVisibility(true)
			$choice1.text = "Understanding"
			$choice2.text = "Annoyed"
			if(choice1Chosen):
				choiceMade("day2", 1)
			if(choice2Chosen):
				choiceMade("day2", 2)		

func choiceMade(event:String, choice:int):
	choiceIsHappening = false
	hitBoxAbility($choice1,true)
	hitBoxAbility($choice2,true)
	changeVisibility(false)
	
	if(event=="day1"):
		if(choice==1):
			if(Global.productionLevel!=2):
				Global.productionLevel+=1
			if(indexCount<len(main1)):
				dialogue.text = main1[indexCount]
			if(dialogue.text == "I'm not so sure that that would work"):
				Global.day = 2
				$endScreen.visible = true
			if(dialogue.text == "!"):
				get_tree().change_scene_to_file("res://negotiation_2.tscn")
			if(dialogue.text == "end"):
				get_tree().change_scene_to_file("res://negotiation_2.tscn")
				
		else:
			if(indexCount<len(main1)):
				dialogue.text = main1[indexCount]
				if(dialogue.text == "I think that's a great idea kids"):
					indexCount+=2
				if(dialogue.text == "I'm not so sure that that would work"):
					Global.day = 2
				if(dialogue.text == "!"):
					$endScreen.visible = true
				if(dialogue.text == "end"):
					get_tree().change_scene_to_file("res://negotiation_2.tscn")
					
					
	if(event=="day2"):
		indexCount = 0
		if(choice==1):
			print("1")
			listUsed = 3
			choice1Chosen = false
		else:
			print("2")
			listUsed = 4
			choice2Chosen = false


#torf means true or false fyi
func changeVisibility(torf:bool):
	$littleBackdropRectangle.visible = torf
	$littleBackdropRectangle2.visible = torf
	$choice1.visible = torf
	$choice2.visible = torf
	
#This will disable a hitbox, since clicking on some things will inspire text prompts,
#so during dialogue, hitboxes will be disabled
func hitBoxAbility(name:Node,disabled:bool):
	name.disabled = disabled
	

func _on_choice_1_pressed():
	indexCount+=1
	choice1Chosen = true

func _on_choice_2_pressed():
	indexCount+=1
	choice2Chosen = true

func _on_end_visual_hit_box_mouse_entered():
	if(day == 1):
		get_tree().change_scene_to_file("res://negotiation_2.tscn")
	elif(day == 2):
		get_tree().change_scene_to_file("res://negotiation_3.tscn")
