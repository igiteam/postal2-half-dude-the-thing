///////////////////////////////////////////////////////////////////////////////
// KrotchyInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Krotchy toy in a box.
//
///////////////////////////////////////////////////////////////////////////////

class KrotchyInv extends OwnedInv;
//////////
// vars
var array<Sound> KrotchyToyVoice;		// Sounds for the toy to play, that's his voice

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	ignores Activate;

	function float TouchHim()
	{
		local int PlayI;

		TurnOffHints();	// When you use it, turn off the hints

		PlayI = Rand(KrotchyToyVoice.Length);

		if (Owner != None)
			//ErikFOV change: for correct subtitles name
			//Owner.PlaySound(KrotchyToyVoice[PlayI]);
		{
			SetLocation(Owner.Location);
			SetBase(Owner);
			PlaySound(KrotchyToyVoice[PlayI]);
		}
			//end
		return GetSoundDuration(KrotchyToyVoice[PlayI]);
	}
Begin:
	Sleep(TouchHim());
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    KrotchyToyVoice[0]=none
    KrotchyToyVoice[1]=none
    KrotchyToyVoice[2]=none
    bPaidFor=true
    LegalOwnerTag="Krotchy"
    UseForErrands=1
    Hint1="Press %KEY_InventoryActivate% to touch me!"
    PowerupName="Bad Touch Krotchy"
    PowerupDesc="The hottest toy sensation!"
    InventoryGroup=102
    GroupOffset=8
    PickupClass=Class'KrotchyPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Krotchy'
}