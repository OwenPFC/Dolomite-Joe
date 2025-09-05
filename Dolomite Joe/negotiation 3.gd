extends Node2D

@onready var dialogue = $textBox/theText

var mouseIn = false

var submission = ""
var indexCount = 0
var numInteractions = 0

var textSubmitted = false

var lastText = ""

var main = ["cg","You're a pagan aren't you?", "What other reason would you have to limit my rock supply then to save you and your sinning friends?",
"It seems like simple math to me. More rocks equals more ammo.", "All rocks are equal when they're in the skull of a heretic.", "I'd argue that your synthetic rocks are heresy."
, "What are rocks but little encapsulations of our earth's history?", "And what might you call a machine
that creates images of a false history and interpretation of our world?", "A false prophet?", "Say you really rely on this machine to arm your
trebuchet, is this a false idol you've created?", "I just fear for your own spiritual safety", "Classic work of the devil right here, twisting the wonderful words of our Lord against his strongest soldiers", "All so you can profit in the end.",
"What kind of man makes a living selling rocks anyway?", "All you're doing is taking from our Lord's earth and selling it to lazy men who couldn't
walk outside and pick it up themselves.", "You add no value to the world. You only mine it for profit.", "Now, you want to prove that you're here for
virtuistic reasons don't you?", "Well then, you better be able to name all of the bible references in this room.", "Go on, I'm waiting", "mainEnd"]

var allCorrect = ["I'm sorry I ever doubted you sir.", "Of course I'd be more than happy to do busines with a God fearing, salt of the earth farmer
like yourself.", "Certainly more than I would be to do business with those secular freaks in public office.", "Let's get to work, we're gonna
make this market clean.", "And by the way, if any of your sons turn prodigal, send em my way.", "I'll get him fixed right up for you.", "end","end2"]
	

var mostCorrect = ["Ok ok I believe you.", "I understand not being completely read up.", "Those secular freaks in office are trying to take away the bible
at every turn.", "Plus, I know being a farmer and all you might be a little illiterate, I won't hold that against you.", "You know
more than you don't.", "I'll pray for you as you fight your war, as long as you keep that rock flow nice and strong, right?", 
"And by the way, if any of your sons turn prodigal, send em my way.", "I'll get him fixed right up for you.", "end", "end2"]

var less = ["I knew it. You don't know the first thing about the bible.", "You're just some demon spawn trying to take advantage of my plight
	to sell me something.", "Well guess what buddy, I'm God's strongest soldier, and your guiles and tricks won't work on a guy like me.",
	"We're done here. You're lucky I can't bring a trebuchet inside, BECAUSE YOU WOULD BE FINISHED BUDDY!", "YOU'D BE MEETING YOUR MAKER,
	AND YOU WOULD NOT BE HAPPY ABOUT IT!!! LEAVE AT ONCE!!!", "end","end2"]

var all = [main,allCorrect,mostCorrect,less]
var listUsed = 0

var maryIn = false
var maryPressed = false
var maryDone = false

var noahIn = false
var noahPressed = false
var noahDone = false

var redSeaIn = false
var redSeaPressed = false
var redSeaDone = false

var holyLandIn = false
var holyLandPressed = false
var holyLandDone = false

var thomasIn = false
var thomasPressed = false
var thomasDone = false

var bushIn = false
var bushPressed = false
var bushDone = false

var hangIn = false
var hangPressed = false
var hangDone = false

var goodWill = 0
var badWill = 0

var holyLandIndex = 0

var finalListChosen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$input.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dialogue.text == "cg"):
		$cg.visible = true
	else:
		$cg.visible = false
	if(dialogue.text == "end"):
		$endScreen.visible = true
	if(dialogue.text == "end2"):
		get_tree().change_scene_to_file("res://animation.tscn")
	if(dialogue.text == "I'd argue that your synthetic rocks are heresy."):
		dialogue.set("theme_override_colors/font_color", Color(0.643, 0, 0.643))
	if(dialogue.text == "Classic work of the devil right here, twisting the wonderful words of our Lord against his strongest soldiers"):
		dialogue.set("theme_override_colors/font_color", Color(0, 0, 0))
	
	
	if(Input.is_action_just_pressed("click") and mouseIsInBlankSpace()):
		indexCount+=1
		if(holyLandPressed):
			if(!holyLandDone):
				holyLandIndex+=1
	if(indexCount<len(all[listUsed])):
		dialogue.text = all[listUsed][indexCount]
	if(dialogue.text == "mainEnd"):
		dialogue.text = "Go on, I'm waiting"
		numInteractions+=1
	if(dialogue.text == "end"):
		Global.day = 3
	if(numInteractions > 0):
		if(maryPressed):
			if(!maryDone):
				dialogue.text = "Ah the MM there. What do you think that stands for?"
				changeVisibility(true)
				if(textSubmitted):
					changeVisibility(false)
					if("mary" in submission.to_lower() or "mag" in submission.to_lower()):
						dialogue.text = "Exactly! Mary Magdelene. Oh how I wish I was her. The things I would have done..."
						goodWill+=1
					else:
						dialogue.text = "You don't even know about Mary Magdelene, and you claim to be a man of the cloth? You know, if I could be anyone in history I would be her. The things I would have done... and you don't even know her. For shame"
						badWill+=1
					maryDone = true
					maryPressed = false
					textSubmitted = false
					$input.text = ""
					print("mary")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				maryPressed = false
			
		if(noahPressed):
			if(!noahDone):
				dialogue.text = "That rainbow there, what story was that from again?"
				changeVisibility(true)
				if(textSubmitted):
					changeVisibility(false)
					if("noah" in submission.to_lower() or "ark" in submission.to_lower()):
						dialogue.text = "Yep, yep, yep. Noah's Ark's an all time classic. Although anyone would know that one"
						goodWill+=1
					else:
						dialogue.text = "Come on, you think this is Evan Almighty or something? This is the easiest one. Only someone who acitvely ignores the lord could get this one wrong"
						badWill+=1
					noahDone = true
					noahPressed = false
					textSubmitted = false
					$input.text = ""
					print("noah")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				noahPressed = false
			
		if(redSeaPressed):
			if(!redSeaDone):
				dialogue.text = "That map there, what sea is that showing? "
				changeVisibility(true)
				if(textSubmitted):
					changeVisibility(false)
					if("red" in submission.to_lower()):
						dialogue.text = "Absolutely, the red sea, that moses parted. Now are you a believer or just a geography knower?"
						goodWill+=1
					else:
						dialogue.text = "You're so stupid that you don't even know elementary geography? No wonder it doesn't seem like you can handle the holy texts"
						badWill+=1
					redSeaDone = true
					redSeaPressed = false
					textSubmitted = false
					$input.text = ""
					print("red")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				redSeaPressed = false
			
		if(holyLandPressed):
			if(!holyLandDone):
				if(holyLandIndex == 0):
					dialogue.text = "The picture of the holy land there, who do you believe is the rightful owner of that land?"
				if(holyLandIndex == 1):
					dialogue.text = "I'm just jokin'"
				if(holyLandIndex == 2):
					dialogue.text = "Obviously God owns the holy land. Humans can claim to own it, but I personally would not try to steal God's property."
				if(holyLandIndex == 3):
					dialogue.text = "Alright now back to the real questions."
					holyLandDone = true
					holyLandPressed = false
					textSubmitted = false
					$input.text = ""
					print("holyLand")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				holyLandPressed = false
			

		if(thomasPressed):
			if(!thomasDone):
				dialogue.text = "Ah the hand with the hole in it, who was Jesus showing that to?"
				changeVisibility(true)
				if(textSubmitted):
					changeVisibility(false)
					if("thomas" in submission.to_lower() or "doubt" in submission.to_lower() or "tom" in submission.to_lower()):
						dialogue.text = "Mhm, Doubting God Damned Thomas. And that's not in vain by the way. It's just true. He is damned by God. Atleast I sure hope he is. I spit on all those named Thomas, it's retribution for carrying that wicked name"
						goodWill+=1
					else:
						dialogue.text = "You know what. Maybe it's good you don't know. Doubting Thomas is one of history's greatest monsters. Perhaps it's a good thing if people forget his name and who he was."
						badWill+=1
					thomasDone = true
					thomasPressed = false
					textSubmitted = false
					$input.text = ""
					print("tom")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				thomasPressed = false

		if(bushPressed):
			if(!bushDone):
				dialogue.text = "This burning bush here, who does it represent?"
				changeVisibility(true)
				if(textSubmitted):
					changeVisibility(false)
					if("god" in submission.to_lower() or "lord" in submission.to_lower() or "father" in submission.to_lower()):
						dialogue.text = "Yep, our good lord giving Moses the 10 Commandments"
						goodWill+=1
					else:
						dialogue.text = "Tsk tsk. Perhaps if you burned a little less bush you'd find some happiness in your life."
						badWill+=1
					bushDone = true
					bushPressed = false
					textSubmitted = false
					$input.text = ""
					print("bush")
					numInteractions+=1
			else:
				dialogue.text = "Nuh uh, no repeats"
				bushPressed = false
				
		if(hangPressed):
				if(!hangDone):
					dialogue.text = "Ah that's my favorite poster. Do you remember what they used to check if Jesus was dead on the cross?"
					changeVisibility(true)
					if(textSubmitted):
						changeVisibility(false)
						if("spear" in submission.to_lower()):
							dialogue.text = "Yeah. Personally if I wanted to see if he was dead I would've just asked. I mean obviously stabbing him didn't work out too well for them"
							goodWill+=1
						else:
							dialogue.text = "Sorry, I was looking for spear. A favorite tool of the romans. Kind of a neanderthal weapon, which I guess is fitting for those guys"
							badWill+=1
						hangDone = true
						hangPressed = false
						textSubmitted = false
						$input.text = ""
						print("hang")
						numInteractions+=1
				else:
					print("koop")
					dialogue.text = "Nuh uh, no repeats"
					hangPressed = false
					
		lastText = dialogue.text
	if(maryDone and noahDone and redSeaDone and holyLandDone and thomasDone and bushDone and hangDone and !finalListChosen):
		if(badWill == 0):
			Global.day3Successful = true
			Global.crusader = true
			listUsed = 1
		elif(goodWill>badWill):
			Global.day3Successful = true
			Global.crusader = true
			listUsed = 2
		else:
			listUsed = 3
		indexCount = 0
		all[listUsed].insert(0, lastText)
		finalListChosen = true

func changeVisibility(aBool:bool):
	$input.visible = aBool

func hitBoxAbility(nameOf:Node,disabled:bool):
	nameOf.disabled = disabled
	
func mouseIsInBlankSpace():
	if(!mouseIn and !maryIn and !noahIn and !redSeaIn and !holyLandIn and !thomasIn and !bushIn and !hangIn):
		return true
	return false
	
func _on_input_mouse_entered():
	mouseIn = true

func _on_input_mouse_exited():
	mouseIn = false
	
func _on_input_text_submitted(new_text):
	submission = new_text
	textSubmitted = true
	
func _on_mm_mouse_entered():
	maryIn = true

func _on_mm_mouse_exited():
	maryIn = false
	
func _on_mm_pressed():
	if(numInteractions>0):
		maryPressed = true
	
func _on_rainbow_mouse_entered():
	noahIn = true

func _on_rainbow_mouse_exited():
	noahIn = false

func _on_rainbow_pressed():
	if(numInteractions>0):
		noahPressed = true

func _on_red_sea_mouse_entered():
	redSeaIn = true

func _on_red_sea_mouse_exited():
	redSeaIn = false

func _on_red_sea_pressed():
	if(numInteractions>0):
		redSeaPressed = true

func _on_holy_land_mouse_entered():
	holyLandIn = true

func _on_holy_land_mouse_exited():
	holyLandIn = false

func _on_thomas_mouse_entered():
	thomasIn = true

func _on_thomas_mouse_exited():
	thomasIn = false

func _on_thomas_pressed():
	if(numInteractions>0):
		thomasPressed = true

func _on_bush_mouse_entered():
	bushIn = true

func _on_bush_mouse_exited():
	bushIn = false

func _on_bush_pressed():
	if(numInteractions>0):
		bushPressed = true

func _on_holy_land_pressed():
	if(numInteractions>0):
		holyLandPressed = true
		
func _on_hang_mouse_entered():
	hangIn = true
	
func _on_hang_mouse_exited():
	hangIn = false
	
func _on_hang_pressed():
	if(numInteractions>0):
		hangPressed = true
