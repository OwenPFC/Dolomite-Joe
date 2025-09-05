extends Node2D

@onready var dialogue = $textBox/theText
#@onready var choice1Text = $choice1/choice1Text
#@onready var choice2Text = $choice2/choice2Text
@onready var choice1 = $choice1Button
@onready var choice2 = $choice2Button

var goodwillCounter = 0
var badwillCounter = 0

var resetIndex = false

var mainText = ["cg","So, Dolomite Joe, my good friend", "It pains me that we're having this conversation right now",
"I should tell you that I've received an enticing offer from the government", 
"This machine of their's is really a miracle worker", "They gave me a little sample, and let me tell you"
,"My gravel pit is already twice what it used to be!","But isn't the spirit of the industry more important?", "Your gravel pit is very impressive",
"But I think what matters more is the source of the gravel", "Your gravel pit is great because it shows off
the marvels of our earth", "We're not out here building a testament to some machine", "We're celebrating
the Earth we live on", "Well the rocks are coming from somewhere right?", "As far as I can tell, they seem just like your rocks, just in much greater quantities", "I don't quite understand the moral grandstanding", "(Maybe I've gotta soften this guy up a little bit)"]

var mainText2 = ["How about them eagles?", "I'm just joking sorry", "So back to your point about the rocks", "I still don't really
get what seperates your rocks from their rocks?", "It just seems like a quality quantity kind of problem", "And honestly I'm just trying to
fill up my gravel pit", "I'm not so sure that I'm in the quality market"]
#The choice for this branch will be sentimental or logical, which will actually have larger implications.
#Here, logical will fail and sentimental will triumph

var mainTextLogic = ["I've been one of your suppliers for a few years now", "You've relied on family farms for a long time, and you've never had this issue of not having enough rocks.", "You're letting yourself be told that you need more rocks, more gravel", "When you already have all the rocks and gravel that you need coming in at a consistent  rate.", "They're not in it for the love of the game", "They're just gonna keep selling you more and more rocks, more than you'll ever need.", "If your quarterly rate increases
a bit, all of the sudden that's the new standard that you need to reach", "You'll run us farmers dry, and then we'll all be gone. There'll be no more soul in the game.", "All you'll have are these worthless, historyless rocks that you don't even want.", "I understand what you're saying, Joe. But it sounds to me like you're just projecting your own fears onto me.",
"Frankly, I don't see it your way at all.", "My gravel pit needs gravel, it's a simple a business as that.",
"They made a machine that does it better than you guys, I don't know what to tell you.", "What can you actually do to help the industry?"]
		
var mainTextSentiment = ["Listen, I represent the Dolomites as much as you represent the Gravels.", "I know the crushing weight of being the patriarch of a
family business.", "Whenever I do my business on the farm, I always question whether or not I'm honoring the vision of my forefathers",
"I question if I'm living up to the spirit of the business.", "Why fill a gravel pit? It's the same reason we dig a hole at the beach,",
"To see a visual representation of our hard work.", "What valor is there in pushing a button?", "Do you think you'll be satisfied when all that gravel just appears in the pit?", "You'll just keep wanting for more until nothing can satisfy you.", "These fake, instant rocks
will bring you no happiness.", "Maybe you're right. The novelty is starting to wear off.", "I mean from a business perspective it's the greatest deal of all time, it's really hard to ignore that aspect.", "But I have worked with family farms for years,", "We were always focused on bolstering
insignificant little ventures like your's.", "It would be a shame to see all those little family businesses just disappear.", "But you're gonna have to offer me an alternative.", "What do you have over this machine besides wholesomeness?"]

var mainTextTech = ["Everybody in the industry is terrfied of this machine, it's not just me scrambling to get our market back.", "Even my kids are working on innovations in farm tech.", "There's nothing concrete at the moment, but I can promise you this,", "the finest minds in the industry are doing every thing they can to increase rock production like never before.", "This machine is the push we needed. And you won't lose anything by just giving us some time.", "If we fail your expectations you can go back to the rock machine and get all the rocks you've ever
wanted.", "You raise a fair point. From what I can tell it's been barely a week since it was made", "I can't expect you to have the solution immediately.", "Hell, I don't know what I would do if they came out with the business factory", "I might just have to end it all
right there.", "I commend you for trying to fight against this, really.", "I hope you understand that I can't just play along with you because I admire you, I have my own problems to sort out.", "!!!"]

var mainTextUnion = ["Well we haven't had a lot of time to work on that quite yet.", "This isn't the kind of thing you can plan for.", "At the moment we're
working on trying to band together and seeing if we can get into the courts with this.", "I mean what right does the government have-",
"Woah woah woah. A union? This is supposed to entice me?", "I'm sorry I hate to say it, I love workers, but if your
best idea for cornering the market is a union", "You are in for a world of pain my friend.", "I really sympathize with your position
here", "Hell, I don't what I would do if they came out with the business factory", "It might be over for Gravel INC. right then and
there.", "That being said, I really hope you understand that I can't just play along with you because I admire you.", "I've got my own
problems to deal with", "!!!"]
		
var goodText = ["Alright, I've made up my mind. You're not just gravel at my feet.", "It's really something that you're standing up to the government
like this.", "I'm not sure how well that'll work out for you, but I'll help you out all I can in the free market.", "It's only fair.", 
"The rock industry will die when people like you are gone, Dolomite Joe.", "THE END", "THE END 2"]
			
var badText = ["Dolomite Joe, I'm really sorry. I've made up my mind.", "I just can't justify backing you. I don't see much hope in your
battle", "And you just kind of sound like a traditionalist that can't move on from an obsolete past.", "I've been a lifelong
champion of the rock industry", "And I'd just hate to delay progress like this. I'm sorry I think it's what must be done.", "THE END", "THE END 2"]

var secondHalfList = [mainText2,mainTextLogic,mainTextSentiment,mainTextTech,mainTextUnion,goodText,badText]
var main2ChoiceMade = false

#SHOULD I MAKE THE DIALOGUE FOR THIS A 2D ARRAY I NEVER THOUGHT OF THAT IT WOULD ACTUALLY WORK WELL ARCHITECTURALLY

var mouseInPainting = false
var paintingLookedAt = false
var paintingUsed = false #The point of this is that the event can only happen once, and then the other times
						#He just says a one liner about it
var paintingText = ["It's a pretty awesome picture ain't it?", "You just don't understand the culture you sick western soul",
"That's my brother in Chicago", "That was his first time in a big city", "He may have overextended his company budget a bit
on that trip ", "He came crying home like the prodigal son", "I keep it as a reminder of my own temperance and impeccable business 
accumen"]

var mouseInChoice1 = false
var mouseInChoice2 = false
var choiceIsHappening = false
var choice1Chosen = false
var choice2Chosen = false
var joeMode = false

var main = true #This is so that when main dialogue is running, buttons will work as intended with the whole
				#adding 1 to the index thing

var numInteractions = 0 #This can be a counter of non event dialogue, that way you can run main dialogue
						#using this. Maybe events will forward the interaction number
#what if only certain numbers will do main dialogue, that way on other numbers we can look for like
#click and mouseInPainting for example

var indexCount = 0
var indexCount2 = 0
var listUsed = 0

var is1stTime = false #This is to subtract 1 from the indexCount when pressing a button
					#because that shit sucks otherwise


# Called when the node enters the scene tree for the first time.
func _ready():
	changeVisibility(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dialogue.text == "cg"):
		$cg.visible = true
	else:
		$cg.visible = false
	
	if(dialogue.text == "But isn't the spirit of the industry more important?"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Your gravel pit is very impressive"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text ==  "Well the rocks are coming from somewhere right?"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "(Maybe I've gotta soften this guy up a little bit)"):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "It's a pretty awesome picture ain't it?"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "I've been one of your suppliers for a few years now" or dialogue.text == "Listen, I represent the Dolomites as much as you represent the Gravels."):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "I understand what you're saying, Joe. But it sounds to me like you're just projecting your own fears onto me." or dialogue.text == "Maybe you're right. The novelty is starting to wear off."):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(dialogue.text == "Everybody in the industry is terrfied of this machine, it's not just me scrambling to get our market back." or dialogue.text == "Well we haven't had a lot of time to work on that quite yet."):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "You raise a fair point. From what I can tell it's been barely a week since it was made" or dialogue.text == "Woah woah woah. A union? This is supposed to entice me?"):
			dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	
	if((Input.is_action_just_pressed("click") and mouseIsInBlankSpace() and !choiceIsHappening)):
		indexCount+=1
		"""
		So the point of this is to move dialogue forward in a "click anywhere" kinda way, I just need to make sure it's
		meaningful.
		
		Ok so the solution is putting all of the dialogue in a list, and this represents the indices.
		So, i need an inDialogue boolean that runs will a list is being displayed, that way you can't get to like
		100000 or something just by screwing around
			
			When you make choices, it'll change the index count to skip over certain parts,
			in sort of a choose your own adventure sort of way
		"""
		
	###########################################
	if(numInteractions == 0):
		main = true
		if(indexCount == len(mainText)):
			numInteractions+=1
		if(numInteractions == 0): #I KNOW THIS LOOKS JANK BUT THIS IS SO AFTER THE INDEX EXCEEDS THE LIST
								#WE JUST LEAVE
			if(indexCount<len(mainText) and !joeMode):
				dialogue.text = mainText[indexCount]
			if(mainText[indexCount]=="My gravel pit is already twice what it used to be!"):
				choiceIsHappening = true
				joeMode = true
			if(indexCount<len(mainText) and joeMode):
				changeVisibility(true)
				hitBoxAbility(choice1,false)
				hitBoxAbility(choice2,false)
				choice1.text = "Annoyed"
				choice2.text = "Understanding"
				if(choice1Chosen):
					choiceMade("Main1",1)
				elif(choice2Chosen):
					choiceMade("Main1",2)
	##########################################
	if(Input.is_action_just_pressed("click") and mouseInPainting and numInteractions !=0 and numInteractions !=2):
		main = false
		paintingLookedAt = true
		indexCount = 0
		hitBoxAbility($choice1Button,true)
		hitBoxAbility($choice2Button,true)
	if(paintingLookedAt):
		if(paintingUsed):
			dialogue.text = "\"You've already heard my piece about that buddy\""
		else:
			if(indexCount<len(paintingText)):
				dialogue.text = paintingText[indexCount]
	
			else:
				dialogue.text = "Googas" 
				paintingLookedAt = false
				main = true
				paintingUsed = true
				numInteractions+=1
				
				hitBoxAbility($choice1Button,false) #Not sure what the intention was but I'll see ig
				
				#The point of this is that the event can only happen once, and then the other times
				#He just says a one liner about it
				#Maybe if you click on it like 5 times he's like bro wtf I'm done talking about it
				
			
		if(indexCount == 0 and !paintingUsed):
			choiceIsHappening = true
			changeVisibility(true)
			hitBoxAbility($choice1Button,false)
			hitBoxAbility($choice2Button,false)
			choice1.text = "\"Yeah it's pretty nice\""
			choice2.text = "\"It's a little strange\""
		if(choice1Chosen):
			choiceMade("painting",1)
			choice1Chosen = false
		if(choice2Chosen):
			choiceMade("painting",2)
			choice2Chosen = false
			
		"""
		I need some onscreen prompt to be like click to continue
		"""
	#############################################
	if(numInteractions == 2):
		main = true
		if(dialogue.text == "Googas"):
			indexCount = 0
		if(indexCount<len(mainText2)): #not sure if need to do !joeMode
			dialogue.text = mainText2[indexCount]
		if(dialogue.text == "I'm not so sure that I'm in the quality market" and !joeMode):
			choiceIsHappening = true
			joeMode = true
		if(indexCount-1<len(secondHalfList[listUsed]) and joeMode and !main2ChoiceMade):
				changeVisibility(true)
				hitBoxAbility(choice1,false)
				hitBoxAbility(choice2,false)
				choice1.text = "Analytical"
				choice2.text = "Sentimental"
				if(choice1Chosen):
					choiceMade("Main2",1)
				elif(choice2Chosen):
					choiceMade("Main2",2)
		if(indexCount<len(secondHalfList[listUsed]) and main2ChoiceMade):
			choiceIsHappening = false #idk why it wasn't working
			dialogue.text = secondHalfList[listUsed][indexCount]
		if(dialogue.text == "What can you actually do to help the industry?" or dialogue.text == "What do you have over this machine besides wholesomeness?"):
			joeMode = true
			main = true
			changeVisibility(true)
			hitBoxAbility(choice1,false)
			hitBoxAbility(choice2,false)
			choice1.text = "Possible Innovation"
			choice2.text = "Rock Farmer's Union"
			if(choice1Chosen):
				choiceMade("Main22",1)
			elif(choice2Chosen):
				choiceMade("Main22",2)
		if(dialogue.text == "!!!"):
			if(goodwillCounter>badwillCounter or goodwillCounter == badwillCounter and !resetIndex):
				listUsed = 5
				indexCount = 0
				resetIndex = true
				Global.ceoOfGravel = true
				Global.day1Successful = true
			else:
				listUsed = 6
				indexCount = 0
				resetIndex = true
				Global.ceoOfGravel = false
				Global.day1Successful = false
		if(dialogue.text == "THE END"):
			$endScreen.visible = true
			Global.day = 1
		if(dialogue.text == "THE END 2"):
			get_tree().change_scene_to_file("res://home.tscn")
	#########################################


func choiceMade(event:String, choice:int):
	choiceIsHappening = false
	hitBoxAbility($choice1Button,true)
	hitBoxAbility($choice2Button,true)
	changeVisibility(false)
	
	if(event == "Main1"):
		if(choice == 1):
			if(indexCount<len(mainText)-1): #I need to do -1 because there's more text after this that is not joe
											#will need to change this slightly
				dialogue.text = mainText[indexCount]
			else:
				choice1Chosen = false
				joeMode = false
		else:
			
			if(indexCount<len(mainText)-2):
				dialogue.text = mainText[indexCount+1]
			else:
				choice2Chosen = false
				joeMode = false
	
	if(event == "Main2"):
		indexCount = 0
		if(choice == 1):
			listUsed = 1
			choice1Chosen = false
			badwillCounter+=1
		else:
			listUsed = 2
			choice2Chosen = false
			goodwillCounter+=1
		main2ChoiceMade = true
		joeMode = false
		
	if(event == "Main22"):
		indexCount = 0
		if(choice == 1):
			listUsed = 3
			choice1Chosen = false
			goodwillCounter+=1
		elif(choice == 2):
			listUsed = 4
			choice2Chosen = false
			badwillCounter+=1
		joeMode = false
		
	
	if(event == "painting"):
		choiceIsHappening = false
		if(choice==1):
			indexCount+=2
			if(!paintingUsed):
				goodwillCounter+=1
				#paintingUsed = true
		elif(choice==2):
			indexCount+=1
			if(!paintingUsed):
				badwillCounter+=1
				#paintingUsed = true

#torf means true or false fyi
func changeVisibility(torf:bool):
	$littleBackdropRectangle.visible = torf
	$littleBackdropRectangle2.visible = torf
	choice1.visible = torf
	choice2.visible = torf
	
#This will disable a hitbox, since clicking on some things will inspire text prompts,
#so during dialogue, hitboxes will be disabled
func hitBoxAbility(nameOf:Node,disabled:bool):
	nameOf.disabled = disabled
	
func mouseIsInBlankSpace():
	if(!mouseInPainting and !mouseInChoice1 and !mouseInChoice2):
		return true
	return false

func _on_painting_mouse_entered():
	mouseInPainting = true
	
	"""
	2. make indicator, perhaps a highlighted border. I think legit just make a copy of the black
	textbox and just make it a different color in mspaint, and then load in that image when you need it
	"""
	
func _on_painting_mouse_exited():
	mouseInPainting = false
	
	"""
	2. Get rid of the border indicator
	"""
	
func _on_choice_1_button_pressed():
	if(main):
		indexCount+=1
	choice1Chosen = true
	
func _on_choice_2_button_pressed():
	if(main):
		indexCount+=1
	choice2Chosen = true
	
func _on_choice_1_button_mouse_entered():
	mouseInChoice1=true
	
func _on_choice_1_button_mouse_exited():
	mouseInChoice1=false

func _on_choice_2_button_mouse_entered():
	mouseInChoice2=true

func _on_choice_2_button_mouse_exited():
	mouseInChoice2=false
