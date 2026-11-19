///////////////////////////////////////////////////////////////////////////////
// SlotInfoMgr.uc
// Copyright 2023 Running With Scissors Studios LLC.  All Rights Reserved.
//
// Simple class for keeping track of slot information.  The only reason this
// is in a separate class is because we want this info to be in a separate
// ini file so that the info isn't lost when the other ini files are deleted.
//
///////////////////////////////////////////////////////////////////////////////
class SlotInfoMgr extends Info
	config(SavedGameInfo);


///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////

struct SlotInfo
{
	var string	Name;		// Name assigned by user.
	var int		Day;		// Current day when game was saved
	var string	Time;		// Time of last save.
	var	int		lTime;		// C Time used as sort key.
	var string	LoadScreen;	// Texture of loading screen to use when loading this slot.
};

var globalconfig array<SlotInfo> Slots;

// If we spawn with the pre-Steam 10 slots then update our slots
event PostBeginPlay()
{
	Super.PostBeginPlay();
	if (Slots.Length < 22)
	{
		Slots.Length = 22;
		SaveConfig();
	}
}

///////////////////////////////////////////////////////////////////////////////
// Fill in the info
///////////////////////////////////////////////////////////////////////////////
function SetInfo(int Slot, string Name, int Day, string Time, int lTime, string LoadScreen)
	{
	Slots[Slot].Name  = Name;
	Slots[Slot].Day = Day;
	Slots[Slot].Time  = Time;
	Slots[Slot].lTime = lTime;
	Slots[Slot].LoadScreen = LoadScreen;
	SaveConfig();
	}

function SlotInfo GetInfo(int Slot)
	{
	return Slots[Slot];
	}

function int NumSlots()
	{
	return Slots.length;
	}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Slots[0]=none
    Slots[1]=none
    Slots[2]=none
    Slots[3]=none
    Slots[4]=none
    Slots[5]=none
    Slots[6]=none
    Slots[7]=none
    Slots[8]=none
    Slots[9]=none
    Slots[10]=none
    Slots[11]=none
    Slots[12]=none
    Slots[13]=none
    Slots[14]=none
    Slots[15]=none
    Slots[16]=none
    Slots[17]=none
    Slots[18]=none
    Slots[19]=none
    Slots[20]=none
    Slots[21]=none
}