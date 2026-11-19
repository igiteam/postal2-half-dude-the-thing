///////////////////////////////////////////////////////////////////////////////
// Spawner
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Spawns special people for backup situations.
//
///////////////////////////////////////////////////////////////////////////////

class BackupSpawner extends PawnSpawner;

var () array<class<Pawn> > ClassForDay;		// Class to be spawned for this day.

///////////////////////////////////////////////////////////////////////////////
// Get the class of backup guy to spawn for this particular day
///////////////////////////////////////////////////////////////////////////////
function class<Actor> GetSpawnClass()
{
	return ClassForDay[P2GameInfoSingle(Level.Game).TheGameState.CurrentDay];
}



// Decompiled with UE Explorer.
defaultproperties
{
    ClassForDay[0]=Class'BasePeople.CopBlue'
    ClassForDay[1]=Class'BasePeople.CopBlack'
    ClassForDay[2]=Class'BasePeople.CopBrown'
    ClassForDay[3]=Class'BasePeople.Military'
    ClassForDay[4]=Class'BasePeople.SWAT'
}