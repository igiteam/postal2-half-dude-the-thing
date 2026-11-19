// Why hello there!
// ============================================================================
// P2AchievementManager
// Class file for handling anything and everything involving Postal 2
// Achievements.
// ============================================================================

class P2AchievementManager extends AchievementManager;

var globalconfig bool bDisplayAchievements;
var localized string HiddenAchievementString;

function AchievementTest()
{
	Level.EvaluateAchievement(None,'TEST_ACHIEVEMENT');
}

// Some basic functions for MenuAchievementList.
function string GetAchievementName(int i)
{
	while (i < Achievements.Length)
	{
		if (Achievements[i].bIgnore)
			//i++;
			return "";
		else
			//ErikFOV Change: for localization
			//return Achievements[i].DisplayName;
			return AchievementsDisplayName[i];
			//end
	}
	return "";
}
function string GetAchievementDescription(int i)
{

	while (i < Achievements.Length)
	{
		if (Achievements[i].bIgnore)
			i++;
		else if (Achievements[i].bHidden && !Achievements[i].bUnlocked)
			return HiddenAchievementString;
		else
			//ErikFOV Change: for localization
			//return Achievements[i].Description;
			return AchievementsDescription[i];
			//end
	}
	return "";
}
function string GetAchievementProgress(int i)
{
	while (i < Achievements.Length)
	{
		//log("get achievement"@i@"progress unlocked"@Achievements[i].bUnlocked@"ignore"@Achievements[i].bIgnore@"progstat"@Achievements[i].ProgressStat,'Debug');
		if (Achievements[i].bIgnore)
			i++;
		else if (Achievements[i].bUnlocked)
			return "";
		else if (Stats[Achievements[i].ProgressStat].APIName == '')
			return "(LOCKED)";
		else if (Stats[Achievements[i].ProgressStat].StatType == STATTYPE_Int)
			return "("$Stats[Achievements[i].ProgressStat].StatValue_int$"/"$Achievements[i].UnlockValue_int$")";
		else if (Stats[Achievements[i].ProgressStat].StatType == STATTYPE_Float)
			return "("$Stats[Achievements[i].ProgressStat].StatValue_float$"/"$Achievements[i].UnlockValue_float$")";
		else
			return "(???)";
			
	}
	return "";
}
function bool GetAchievement(name AchievementName)
{
	local int i;

	for (i = 0; i < Achievements.Length; i++)
	{
		if (Achievements[i].APIName == AchievementName)
			return Achievements[i].bUnlocked;
	}
	return false;
}
function int NumAchievements()
{
	return Achievements.Length;
}
function Texture GetAchievementIcon(int i)
{
	while (i < Achievements.Length)
	{
		if (Achievements[i].bIgnore)
			i++;
		else if (Achievements[i].bUnlocked)
			return Achievements[i].UnlockedTex;
		else
			return Achievements[i].LockedTex;
	}
	return None;
}

// ============================================================================
// PreBeginPlay
// DEBUG: Print out all stats and achievements.
// ============================================================================
event PreBeginPlay()
{
	Super.PreBeginPlay();
	//log(self@"PostBeginPlay",'Debug');
	//StatsDump();
}

function StatsDump()
{
	local int i;

	log("STATS DUMP ============================================================",'Debug');

	for (i=0; i<Stats.Length; i++)
		log(Stats[i].APIName,'Debug');

	for (i = 0; i < Achievements.Length; i++)
		log(Achievements[i].APIName,'Debug');
	
	log("DUMP COMPLETE =========================================================",'Debug');
}

// ============================================================================
// StatsReady
// Called by Entry's LevelInfo when the stats download is complete.
// ============================================================================
event StatsReady()
{
	Super.StatsReady();
	// Zero out any stats we want reset on each play session.
	
	Level.RequestUpdateStatInt('CrackSmoked', 0);
	Level.RequestUpdateStatInt('CatnipSmoked', 0);
	
	// Check if they're on Linux
	//if (Level.PlatformIsUnix())
	//	EvaluateAchievement()
	
	// Re-dump stats when Steam fills them in
	//StatsDump();
}

// Dude comments on grinding.
function CommentOnGrinding(PlayerController Statter)
{
	if (P2Player(Statter) != None)
		P2Player(Statter).CommentOnGrinding();
}

// ============================================================================
// EvaluateAchievement
// Attempt to unlock achievement. Check that cheats are disabled and that the
// necessary requirements to unlock the achievement are met.
// ============================================================================
function bool EvaluateAchievement(PlayerController Achiever, name AchievementName, optional bool bDisplayInConsole)
{
	local Inventory Inv;
	local P2PowerupInv Cats;
	local int i, AchNum;
	
	//log("Evaluating to unlock achievement"@AchievementName@"made by"@Achiever,'Debug');	
	
	// Test achievement always returns true.
	if (AchievementName == 'TEST_ACHIEVEMENT')
		return true;

	// Refuse any achievement or stat updates if cheats enabled.
	if (
		(AchievementName == 'None')	// Don't try to evaulate empty achievements
		|| (P2Player(Achiever) == None)
		|| P2GameInfoSingle(Achiever.Level.Game).TheGameState.DidPlayerCheat()
		
			// Even if they have cheats turned off, TheGameState now remembers when players cheat, and
			// marks that save file as a cheater (it would be too easy to spawn a bunch of shit with cheat codes
			// then reload the game with cheats off and whore achievements this way).
			// Must get Level.Game from the PlayerController, because to us, Level is Entry.
		)
		return false;

	// Check for achievement status and validity here. Return "true" if the achievement can be unlocked.
	AchNum = -1;

	for (i = 0; i < Achievements.Length; i++)
		if (AchievementName == Achievements[i].APIName)
		{
			AchNum = i;
			break;
		}
		
	if (AchNum == -1)
		return false;
		
	if (Achievements[AchNum].bUnlocked)
		return false;	// Don't unlock it again
		
	if (Achievements[AchNum].bIgnore)
		return false;
		
	// Validate achievements here
	
	// Cat Hoarder
	if (AchievementName == 'CatHoarder')
	{
		if (Achiever.Pawn != None)
			for (Inv = Achiever.Pawn.Inventory; Inv != None; Inv = Inv.Inventory)
				if (P2PowerupInv(Inv) != None && Inv.IsA('CatInv'))
				{
					Cats = P2PowerupInv(Inv);
					break;
				}
				
		if (Cats == None || Cats.Amount < Achievements[AchNum].UnlockValue_int)
			return false;
	}
	// Equal Opportunity Killer
	else if (AchievementName == 'EqualOpportunityKiller')
	{
		// For this one, make sure the number of kills for all three races matches.
		if (Stats[11].StatValue_int < Achievements[AchNum].UnlockValue_int
			|| Stats[12].StatValue_int < Achievements[AchNum].UnlockValue_int
			|| Stats[13].StatValue_int < Achievements[AchNum].UnlockValue_int)
			return false;
	}
	// Game Complete
	else if (AchievementName == 'GameComplete')
	{
		if (!P2GameInfoSingle(Achiever.Level.Game).FinallyOver()
			|| !P2GameInfoSingle(Achiever.Level.Game).GinallyOver()
			)
			return false;
	}
	// Other achievements with related stats
	else if (Stats[Achievements[AchNum].ProgressStat].StatType != STATTYPE_None)	// This should never happen, if it does it indicates that a progress stat does not exist
	{
		if (Stats[Achievements[AchNum].ProgressStat].StatType == STATTYPE_Int
			&& Stats[Achievements[AchNum].ProgressStat].StatValue_int < Achievements[AchNum].UnlockValue_int)
			return false;
		if (Stats[Achievements[AchNum].ProgressStat].StatType == STATTYPE_Float
			&& Stats[Achievements[AchNum].ProgressStat].StatValue_float < Achievements[AchNum].UnlockValue_float)
			return false;
	}
	
	
	//log("== DEBUG UNLOCK ACHIEVEMENT ==",'Debug');
	//log("Achievement Unlocked:"@AchievementName,'Debug');
	//Achiever.ClientMessage("=DEBUG= Achievement Unlocked:"@AchievementName@"'"$Achievements[AchNum].DisplayName$"'");
	
	// bDisplayInConsole is set for achievements that typically don't happen during actual gameplay. On Steam we won't care, but for this testing build
	// (and for the non-Steam version we'll release), display these achievements in the console so the player can be proud of themselves and not
	// wonder where this mystery achievement came from.
	if (bDisplayAchievements)
	{
		if (bDisplayInConsole)	
			//ErikFOV Change: for localization
			//Achiever.ClientMessage("Achievement Unlocked!"@Achievements[AchNum].DisplayName);
			Achiever.ClientMessage("Achievement Unlocked!"@AchievementsDisplayName[AchNum]);
			//end
		else
		{
			//Achiever.ReceiveLocalizedMessage(class'AchievementUnlockMessage', AchNum);
			//Achiever.ReceiveLocalizedMessage(class'AchievementUnlockChildMessage', AchNum);
			//ErikFOV Change: for localization
			//AchievementHUD(Achiever.MyHud).AchievementUnlocked(Achievements[AchNum].DisplayName,Achievements[AchNum].Description,Achievements[AchNum].UnlockedTex);
			AchievementHUD(Achiever.MyHud).AchievementUnlocked(AchievementsDisplayName[AchNum],AchievementsDescription[AchNum],Achievements[AchNum].UnlockedTex);
			//end
		}
		if (!Achievements[AchNum].bNoComment)
			P2Player(Achiever).CommentOnAchievement(AchNum);
	}
		
	Achievements[AchNum].bUnlocked = True;
	AchievementValues[AchNum].bUnlocked = Achievements[AchNum].bUnlocked;
	SaveConfig();
	return true;
}

// ============================================================================
// UpdateStatInt
// Updates an int-based stat.
// ============================================================================
function UpdateStatInt(PlayerController Statter, name StatName, int Delta, optional bool bUnlockAchievement)
{
	// Refuse any achievement or stat updates if cheats enabled.
	if ((P2Player(Statter) == None) /* || (P2Player(Statter).CheatsAllowed()) */ 
		|| (P2GameInfoSingle(Statter.Level.Game).TheGameState.DidPlayerCheat())
		)
		return;
	else
		Super.UpdateStatInt(Statter, StatName, Delta, bUnlockAchievement);
}

// ============================================================================
// UpdateStatFloat
// Updates a float-based stat.
// ============================================================================
function UpdateStatFloat(PlayerController Statter, name StatName, float Delta, optional bool bUnlockAchievement)
{
	// Refuse any achievement or stat updates if cheats enabled.
	if ((P2Player(Statter) == None) /* || (P2Player(Statter).CheatsAllowed()) */ 
		|| (P2GameInfoSingle(Statter.Level.Game).TheGameState.DidPlayerCheat())
		)
		return;
	else
		Super.UpdateStatFloat(Statter, StatName, Delta, bUnlockAchievement);
}

// All Stats and Achievements go here.

// Decompiled with UE Explorer.
defaultproperties
{
    bDisplayAchievements=true
    HiddenAchievementString="????????????????????"
    Stats=/* Array type was not detected. */
    Achievements=/* Array type was not detected. */
    AchievementsDisplayName[0]="R. Kelly's Protege"
    AchievementsDisplayName[1]="Fuck Duck Dynasty!"
    AchievementsDisplayName[2]="Here, Wilfred"
    AchievementsDisplayName[3]="Chapelle's Show"
    AchievementsDisplayName[4]="Taxidermy with Chuck Testa"
    AchievementsDisplayName[5]="Michonne ain't got shit on me"
    AchievementsDisplayName[6]="Someone's got a case of the Mondays!"
    AchievementsDisplayName[7]="C U Next Tuesday"
    AchievementsDisplayName[8]="OMG, NEW MODERN FAMILY TONIGHT!"
    AchievementsDisplayName[9]="It must be Thursday, I could never get the hang of Thursdays"
    AchievementsDisplayName[10]="Workin' For The Weekend"
    AchievementsDisplayName[11]="Screw Bill Lumbergh!"
    AchievementsDisplayName[12]="I swear, I thought it was a home fill"
    AchievementsDisplayName[13]="Thanks for the Money!"
    AchievementsDisplayName[14]="Cesar Millan is Gay"
    AchievementsDisplayName[15]="OMG WE'RE HAVING A FIRE...sale"
    AchievementsDisplayName[16]="Rebecca Black's Nightmare"
    AchievementsDisplayName[17]="Hello, Newman"
    AchievementsDisplayName[18]="Darth Maul'd and shit!"
    AchievementsDisplayName[19]="Reddit would be proud."
    AchievementsDisplayName[20]="Pussy on a pedestal"
    AchievementsDisplayName[21]="I swear, I am NOT Marcellus Wallace"
    AchievementsDisplayName[22]="Uncle T-Bag"
    AchievementsDisplayName[23]="Do you even Enzyte, bro?"
    AchievementsDisplayName[24]="Running With Scissors"
    AchievementsDisplayName[25]="Hutton Gibson Can't Deny This!"
    AchievementsDisplayName[26]="And THAT'S why you never get out of the tree."
    AchievementsDisplayName[27]="Lieberman is our Leader!"
    AchievementsDisplayName[28]="Sheriff Arpaio would be proud."
    AchievementsDisplayName[29]="Can't Touch This"
    AchievementsDisplayName[30]="Fear and Loathing"
    AchievementsDisplayName[31]="Senor Cornballer"
    AchievementsDisplayName[32]="GOOD MORNING VIETNAM!"
    AchievementsDisplayName[33]="Rick Grimes 4 Life"
    AchievementsDisplayName[34]="Anustart!"
    AchievementsDisplayName[35]="40 Year Old Virgin"
    AchievementsDisplayName[36]="CAN YOU DIG IT!"
    AchievementsDisplayName[37]="Planet Of The Apes: The Musical"
    AchievementsDisplayName[38]="Scientology Level OT VIII"
    AchievementsDisplayName[39]="Fur Sure!"
    AchievementsDisplayName[40]="Mr. POSTAL's Penguins"
    AchievementsDisplayName[41]="It's not cheating, because it's YOUR dog"
    AchievementsDisplayName[42]="Where's Mr. McGibblets"
    AchievementsDisplayName[43]="Finkle is Einhorn"
    AchievementsDisplayName[44]="Anger Management with Roger Clemens"
    AchievementsDisplayName[45]="Shiva Blast"
    AchievementsDisplayName[46]="Don't Taze Me Bro"
    AchievementsDisplayName[47]="I Am Legend"
    AchievementsDisplayName[48]="One time, at band camp..."
    AchievementsDisplayName[49]="I should buy a boat"
    AchievementsDisplayName[50]="Friend of Dorothy"
    AchievementsDisplayName[51]="Officer McLovin'"
    AchievementsDisplayName[52]="Paid the Piper"
    AchievementsDisplayName[53]="Well, aren't YOU a badass"
    AchievementsDisplayName[54]="I don't know whether to kiss you or kill you"
    AchievementsDisplayName[55]="It's sterile and I like the taste"
    AchievementsDisplayName[56]="It's OK, we got Greenlit anyway"
    AchievementsDisplayName[57]="FAB-U-LOUS"
    AchievementsDisplayName[58]="I don't need virgins for this"
    AchievementsDisplayName[59]="A-Rod Who?"
    AchievementsDisplayName[60]="Door Mat"
    AchievementsDisplayName[61]="Chuck Norris'd!"
    AchievementsDisplayName[62]="There's always money in the banana stand"
    AchievementsDisplayName[63]="Screw that game!"
    AchievementsDisplayName[64]="Found 'em faster than GWB"
    AchievementsDisplayName[65]="Gotta pay the Troll Toll"
    AchievementsDisplayName[66]="John Rambo'd!"
    AchievementsDisplayName[67]="Gary vs. a Giant Penis"
    AchievementsDisplayName[68]="You are not alone"
    AchievementsDisplayName[69]="RAFIBOMB!!!"
    AchievementsDisplayName[70]="I'm not even supposed to be here today!"
    AchievementsDescription[0]="Pissed in someone's face until they puked from it."
    AchievementsDescription[1]="Used a Bass Sniffer Radar."
    AchievementsDescription[2]="Gained your first dog helper."
    AchievementsDescription[3]="Lured a police officer with a piss-soaked donut."
    AchievementsDescription[4]="Used a cat to 'accessorize' your gun."
    AchievementsDescription[5]="Resurrected a zombie corpse for your own nefarious purposes."
    AchievementsDescription[6]="Survived Monday."
    AchievementsDescription[7]="Survived Tuesday."
    AchievementsDescription[8]="Survived Wednesday."
    AchievementsDescription[9]="Survived Thursday."
    AchievementsDescription[10]="Survived Friday."
    AchievementsDescription[11]="Survived Saturday."
    AchievementsDescription[12]="Exploded a nuclear bomb."
    AchievementsDescription[13]="Completed both POSTAL 2 and Apocalypse Weekend."
    AchievementsDescription[14]="Mauled 30 people with your dog."
    AchievementsDescription[15]="Roasted 30 people with fire."
    AchievementsDescription[16]="Totaled 30 cars."
    AchievementsDescription[17]="Kicked 30 dogs."
    AchievementsDescription[18]="Sliced 30 people in half with the scythe."
    AchievementsDescription[19]="Hoarded 15 or more cats at a time."
    AchievementsDescription[20]="Slaughtered 10 dogs with a kitty-silenced shotgun."
    AchievementsDescription[21]="Killed 10 bystanders while wearing the gimp outfit."
    AchievementsDescription[22]="Escaped from the maximum-security jail cell."
    AchievementsDescription[23]="Unzipped your pants and got 3 women to laugh at it."
    AchievementsDescription[24]="Ran 30 miles while holding the scissors."
    AchievementsDescription[25]="Killed 1,000 people."
    AchievementsDescription[26]="Killed all of the book protestors in the library."
    AchievementsDescription[27]="Killed all of the video game protestors at the RWS Office."
    AchievementsDescription[28]="Killed 30 or more people of each skin color."
    AchievementsDescription[29]="Exploded 30 heads via sledgehammer to the face."
    AchievementsDescription[30]="Smoked over 10 'health' pipes and 10 tins of catnip in one play session."
    AchievementsDescription[31]="Ate 30 donuts while wearing the police officer's uniform."
    AchievementsDescription[32]="Burned 5 people with one can of napalm."
    AchievementsDescription[33]="Made 30 zombies lose their heads."
    AchievementsDescription[34]="Completed POSTAL 2 with no kills."
    AchievementsDescription[35]="Completed POSTAL 2, normal mode, with a total play time under 1:30:00. (Excludes cutscenes and load times.)"
    AchievementsDescription[36]="Completed POSTAL 2 using only the Shovel to kill. (Must kill at least 30 people.)"
    AchievementsDescription[37]="Finished POSTAL 2 or Apocalypse Weekend on Hestonworld difficulty."
    AchievementsDescription[38]="Finished A Week In Paradise on POSTAL difficulty."
    AchievementsDescription[39]="Showed Vince and Mike J. what you thought of them."
    AchievementsDescription[40]="Played the Linux version of the game."
    AchievementsDescription[41]="Played 'fetch' with your dog... using a severed human head."
    AchievementsDescription[42]="Gave Krotchy the bad touch."
    AchievementsDescription[43]="Gave a kickoff to a severed head."
    AchievementsDescription[44]="Flung a sledgehammer at a fleeing bystander."
    AchievementsDescription[45]="'Lost' your sledgehammer to a cow."
    AchievementsDescription[46]="Zapped 20 innocent bystanders with the tazer while wearing the police officer's uniform."
    AchievementsDescription[47]="Committed suicide... the Taliban way."
    AchievementsDescription[48]="Saved the marching band from explody death."
    AchievementsDescription[49]="Read the newspaper every day."
    AchievementsDescription[50]="Successfully hid from the police at max wanted level."
    AchievementsDescription[51]="Asked a police officer to sign your petition."
    AchievementsDescription[52]="Successfully bribed a police officer when arrested."
    AchievementsDescription[53]="Kicked open a door."
    AchievementsDescription[54]="Put out someone that's on fire."
    AchievementsDescription[55]="Choked on your own piss."
    AchievementsDescription[56]="Killed someone who refused to sign the petition."
    AchievementsDescription[57]="Wore all three outfits."
    AchievementsDescription[58]="Suicide-bombed a Taliban member."
    AchievementsDescription[59]="Whacked a severed head 50 meters or more with a shovel."
    AchievementsDescription[60]="Severed all of somebody's limbs without killing them."
    AchievementsDescription[61]="Killed someone with a jump kick to the head."
    AchievementsDescription[62]="Found the secret bank exit on Monday."
    AchievementsDescription[63]="Found the hidden copy of POSTAL III and pissed on it."
    AchievementsDescription[64]="Discovered the hidden Taliban base."
    AchievementsDescription[65]="Found one of the hidden underground sewers."
    AchievementsDescription[66]="Made a very long killing spree."
    AchievementsDescription[67]="Discovered the Gary vs. Krotchy arena during the Apocalypse."
    AchievementsDescription[68]="Observed an NPC going POSTAL!"
    AchievementsDescription[69]="Kicked 10 people in the balls."
    AchievementsDescription[70]="Waited 13 real world years to see an in-game Easter egg. Thanks for sticking with us!"
}