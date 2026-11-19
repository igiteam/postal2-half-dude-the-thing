//=============================================================================
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
// 
// This is the one and only Bryan in the Vince's House level in AW. There should
// only be one of him in the whole game.
//=============================================================================
class AWRWSBryan extends AWRWSStaff
	placeable;

const STOP_VAL = 5;

///////////////////////////////////////////////////////////////////////////////
//	PostBeginPlay
///////////////////////////////////////////////////////////////////////////////
simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(1.0,false);
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Timer()
{
	// Redo some variables
	AWGameState(AWGameSP(Level.Game).TheGameState).BryanSurvived=1;
	log(Self$" cheattest new multi cast "$AWGameSP(Level.Game).MultCast);
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	// When you die, tell the gamestate you died so it can count it for the summary.
	AWGameState(AWGameSP(Level.Game).TheGameState).BryanSurvived=0;
	AWGameSP(Level.Game).MultCast = STOP_VAL - 1;
	log(Self$" cheattest, died, setting multi cast "$AWGameSP(Level.Game).MultCast);
	
	// Normal death stuff
	Super.Died(Killer, damageType, HitLocation);
}


// Decompiled with UE Explorer.
defaultproperties
{
    HeadSkin=Texture'ChamelHeadSkins.Male.MWA__021__AVgMaleBig'
    ChameleonSkins=/* Array type was not detected. */
    HealthMax=5.0000000
    ActorID="Bryan"
}