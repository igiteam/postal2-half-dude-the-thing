///////////////////////////////////////////////////////////////////////////////
// VRReduxInv
// Copyright 2016 Running With Scissors, Inc.  All Rights Reserved.
//
// Buy POSTAL Redux in the game, and then buy it in real life!
//
///////////////////////////////////////////////////////////////////////////////

class VRReduxInv extends OwnedInv;

//////////
// vars
var array<Sound> DudeReduxVoice;		// Dyde remarks when you examien the game.

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	ignores Activate;

	function float ExamineGame()
	{
		local int PlayI;

		//TurnOffHints();	// When you use it, turn off the hints
		
		if(Level.NetMode != NM_DedicatedServer ) PlayerController(Instigator.Controller).GetEntryLevel().EvaluateAchievement(PlayerController(Instigator.Controller),'June2016Mall');

		PlayI = Rand(DudeReduxVoice.Length);

		if (Owner != None)
			//ErikFOV change: for correct subtitles name
			//Owner.PlaySound(DudeReduxVoice[PlayI]);
		{
			SetLocation(Owner.Location);
			SetBase(Owner);
			PlaySound(DudeReduxVoice[PlayI]);
		}
			//end
		return GetSoundDuration(DudeReduxVoice[PlayI]);
	}
Begin:
	Sleep(ExamineGame());
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DudeReduxVoice=/* Array type was not detected. */
    bCanThrow=false
    Hint1="An artifact marked 'POSTAL Redux', a"
    Hint2="precious and holy relic from future times!"
    PowerupName="POSTAL Redux"
    PowerupDesc="Available now for purchase in the real world!"
    InventoryGroup=102
    GroupOffset=11
    PickupClass=Class'VRReduxPickup'
    Icon=Texture'ReopeningJune2016TEX.Objects.HUD_VRRedux'
}