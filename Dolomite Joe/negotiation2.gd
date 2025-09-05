extends Node2D

var main = ["cg","Hey man, I appreciate you coming out here. But listen, I know you're here because you want to stop me from using the machine.", "But... have you ever
considered using it yourself?", "Excuse me? I'm a rock farmer. Farming rocks is my life. Why would I ever use The Machine?",
"Because it's your life. You're looking at a money printer and you're just refusing to use it.", "And it's different from a money printer, because a booming rock economy is not gonna lead to an inflation nightmare, right?",
"I thought at least you would understand... Whatever happened to just loving rocks. Isn't that your life? You're the rock collector.",
"You're THE rock guy. What pleasure are machine rocks giving you?",
"Well, first you've gotta understand this. I'm no longer a private collector.", "I got contracted by this real rich fella
to travel around and collect little geological wonders.", "And there was this one little rock that he just had to have, it's this grey stone but it's got like 6 different colored gems all over it",
"There're a lot of fakes out there but I know how to spot the real thing.", "Anyways, I had it pegged as being in this desolate little fishing town in France",
"But when I got there it was just nowhere to be found.", "If you ask me, I think it's an artifact lost to time, but I couldn't just come back to the states empty handed", "I mean who knows what would happen to me if this guy was unsatisfied with my work.",
"It was around then that I was, uh, contacted by some guy who said he could help get me out of this.", "I flew back here and I was shown the machine,
and I mean I was desperate so I took the rock and I ran.", "And I mean the quality of it was superb, I've never seen a fake like it. As far as I can tell it might be an exact reconstruction of it.",
"I'm sorry, who contacted you about the machine?",
"Just some guy, I don't know. Probably one of the guys who worked on it.", "I don't know how he knew that that was exactly what I needed, but again, I was not about to question his offer.",
"So what now? You're still padding your collection, or sorry, his collection with these rocks?",
"Well first of all, it's just some tax write off museum, let's not get ahead of ourselves.", "Nobody's ever gonna visit this thing. It's
not the museum of natural history.", "But yes, I am. Why wouldn't I?", "Honestly sometimes I just use The Machine to make rocks
that might not even exist besides in my head.", "I can create rocks that geologists could never dream of seeing. We can conjure up
a physical replica of the core of the earth.", "I mean the research implications are out of this world. Why would you want to stop this?",
"You're just like the ceo of gravel. It's about the principles of it man, the spirit of the industry-",
"It's funny, I figured you'd come in talking about 'the spirit of the industry' and 'the love of the game',but how do I know that you have the spirit?", "That you're no just a soulless little schmuckman trying to save his paycheck with some talking points?", "I've got a little game I'd like to play with you, if you'd be so kind as to indulge me.",
"After this, we'll see who really loves rocks.", "I'm gonna show you 2 photos of rocks, you just tell me which one is real.", "Should be easy since you see em all day every day and all", "mainEnd"]

var allRight = ["Well, let's tally these results","Damnnnn you got em all right. That's pretty impressive.", "I didn't know I was sitting across from a real rock savant. So yeah, I'll
work with you on this.", "Just gonna let you know, I'm keeping the rocks I already made. But a boycott I can do.", "I'm real excited to see
where this goes!", "end", "end2"]

var majRight = ["Well, let's tally these results","Looks like you know your stuff.", "You know, I was really just skeptical that you were some loon
who just wanted to avoid losing some money, but I guess you really do care.", "I'm not getting rid of the rocks I already
made, but yeah I'll support you in the boycott", "end", "end2"]

var less = ["Well, let's tally these results","Ugh, just as I thought. You're just some money grubber pretending to love rocks.", "You clearly have no stake in this industry
besides how it can line your pockets.", "I've always respected the Dolomites as an honorable and principled family in this industry,
but obviously they didn't raise their current patriarch right.", "I guess it's the beginning of the end for you guys, and I don't care.",
"So please, make your leave now", "end", "end2"]

var all = [main,allRight,majRight,less]

var listUsed = 0
"""
Well let's tally the results here
"""
@onready var real1 = load("res://interrogation/real1.png")
@onready var real2 = load("res://interrogation/real2.png")
@onready var real3 = load("res://interrogation/real3.png")
@onready var real4 = load("res://interrogation/real4.png")
@onready var real5 = load("res://interrogation/real5.png")
@onready var real6 = load("res://interrogation/real6.png")
@onready var fake1 = load("res://interrogation/fake1.png")
@onready var fake2 = load("res://interrogation/fake2.png")
@onready var fake3 = load("res://interrogation/fake3.png")
@onready var fake4 = load("res://interrogation/fake4.png")
@onready var fake5 = load("res://interrogation/fake5.png")
@onready var fake6 = load("res://interrogation/fake6.png")

@onready var dialogue = $textBox/theText

var indexCount = 0
var question = 0

var choice1Chosen = false
var choice2Chosen = false

var right = 0
var wrong = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	changeVisibility(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dialogue.text == "Excuse me? I'm a rock farmer. Farming rocks is my life. Why would I ever use The Machine?"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Because it's your life. You're looking at a money printer and you're just refusing to use it."):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "I thought at least you would understand... Whatever happened to just loving rocks. Isn't that your life? You're the rock collector."):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Well, first you've gotta understand this. I'm no longer a private collector."):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "I'm sorry, who contacted you about the machine?"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Just some guy, I don't know. Probably one of the guys who worked on it."):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "So what now? You're still padding your collection, or sorry, his collection with these rocks?"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Well first of all, it's just some tax write off museum, let's not get ahead of ourselves."):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "You're just like the ceo of gravel. It's about the principles of it man, the spirit of the industry-"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "It's funny, I figured you'd come in talking about 'the spirit of the industry' and 'the love of the game',but how do I know that you have the spirit?"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	
	if((Input.is_action_just_pressed("click"))):
		indexCount+=1
	if(indexCount<len(all[listUsed])):
		dialogue.text = all[listUsed][indexCount]
	if(dialogue.text == "cg"):
		$cg.visible = true
	else:
		$cg.visible = false
		
	if(dialogue.text == "mainEnd"):
		question = 1
	if(question == 1):
		changeVisibility(true)
		$choice1.icon = real1
		$choice2.icon = fake1
		dialogue.text = "Alright here's number 1"
		if(choice1Chosen):
			choiceMade("1", 1)
		elif(choice2Chosen):
			choiceMade("1", 2)
	if(question == 2):
		changeVisibility(true)
		$choice1.icon = real2
		$choice2.icon = fake2
		if(choice1Chosen):
			choiceMade("2", 1)
		elif(choice2Chosen):
			choiceMade("2", 2)
	if(question == 3):
		changeVisibility(true)
		$choice1.icon = fake3
		$choice2.icon = real3
		if(choice1Chosen):
			choiceMade("3", 1)
		elif(choice2Chosen):
			choiceMade("3", 2)
	if(question == 4):
		changeVisibility(true)
		$choice1.icon = real4
		$choice2.icon = fake4
		if(choice1Chosen):
			choiceMade("4", 1)
		elif(choice2Chosen):
			choiceMade("4", 2)
	if(question == 5):
		changeVisibility(true)
		$choice1.icon = fake5
		$choice2.icon = real5
		if(choice1Chosen):
			choiceMade("5", 1)
		elif(choice2Chosen):
			choiceMade("5", 2)
	if(question == 6):
		changeVisibility(true)
		$choice1.icon = fake6
		$choice2.icon = real6
		if(choice1Chosen):
			choiceMade("6", 1)
		elif(choice2Chosen):
			choiceMade("6", 2)		
	if(question == 7):
		question = 8
		indexCount = 0
		if(wrong == 0):
			listUsed = 1
			Global.day2Successful = true
			Global.collector = true
		elif(right>wrong):
			listUsed = 2
			Global.day2Successful = true
			Global.collector = true
		else:
			listUsed = 3
	if(dialogue.text == "end"):
		$endScreen.visible = true
		Global.day = 2
	if(dialogue.text == "end2"):
		get_tree().change_scene_to_file("res://home.tscn")
		
func choiceMade(event:String, choice:int):
	changeVisibility(false)
	if(event == "1"):
		if(choice == 1):
			dialogue.text =  "Yeah alright, not a bad start. Let's keep it going with 2"
			choice1Chosen = false
			right+=1
		else:
			dialogue.text = "Nope. Don't worry, we'll call that a warmup. Here's another"
			choice2Chosen = false
			wrong+=1
		question = 2
		
	if(event == "2"):
		if(choice == 1):
			dialogue.text =  "Mhm. Yeah that's the one. Now for the next one"
			choice1Chosen = false
			right+=1
		else:
			dialogue.text = "Nah man, it's not that one. Don't worry, you'll get this one"
			choice2Chosen = false
			wrong+=1
		question = 3
		
	if(event == "3"):
		if(choice == 1):
			dialogue.text = "You're really worrying me here man. You've got this next one for sure"
			choice1Chosen = false
			wrong+=1
		else:
			dialogue.text = "Correct. Good eye Joe. Now again"
			choice2Chosen = false
			right+=1
		question = 4
	
	if(event == "4"):
		if(choice == 1):
			dialogue.text =  "Absolutely, that's the one. Keep this up"
			choice1Chosen = false
			right+=1
		else:
			dialogue.text = "Seriously? I thought that was an easy one"
			choice2Chosen = false
			wrong+=1
		question = 5
	
	if(event == "5"):
		if(choice == 1):
			dialogue.text =  "Are you serious? Are you even a rock expert? If I came down to your farm and said hey is this asbestos would you be like uhhhhh probably not? You don't know if you're running an asbestos mine or not? You're nothing dude"
			choice1Chosen = false
			wrong+=1
		else:
			dialogue.text = "Yep, alright last one"
			choice2Chosen = false
			right+=1
		question = 6
	if(event == "6"):
		if(choice == 1):
			dialogue.text =  "WRONG!!! And that's the last one. That was your last chance to prove yourself and you utterly failed"
			choice1Chosen = false
			wrong+=1
		else:
			dialogue.text = "CORRECT! And that's all of them"
			choice2Chosen = false
			right+=1
		question = 7
		
func changeVisibility(torf:bool):
	$choice1.visible = torf
	$choice2.visible = torf
	
func _on_choice_1_pressed():
	choice1Chosen = true

func _on_choice_2_pressed():
	choice2Chosen = true
