///////////////////////////////////////////////////////////////////////////////
// MadCowPawn for Postal 2 AW
//
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class MadCowPawn extends AWCowPawn
	placeable;

///////////////////////////////////////////////////////////////////////////////
// VARS
///////////////////////////////////////////////////////////////////////////////
var (PawnAttributes) float PickTargetFreq;
var (PawnAttributes) float PickDudeFreq;


// Decompiled with UE Explorer.
defaultproperties
{
    PickTargetFreq=0.5000000
    PickDudeFreq=1.0000000
    CalmDownFreq=0.2000000
    TakesSledgeDamage=0.1500000
    ExplodeHeadSound=Sound'WeaponSounds.flesh_explode'
    bZombie=true
    HeadClass=Class'AWHeadMadCow'
    ControllerClass=Class'MadCowController'
    LODBias=2.0000000
    Skins[0]=Texture'AW_Characters.Zombie_Cows.AW_Cow1'
}