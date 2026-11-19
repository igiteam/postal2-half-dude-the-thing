//=============================================================================
// AWAuthorityFigure
// Copyright 2023 Running With Scissors Studios LLC.  All Rights Reserved.
//
// Base class for all authority figures in AW.
//
//=============================================================================
class AWAuthorityFigure extends AWPerson
	notplaceable;


///////////////////////////////////////////////////////////////////////////////
// Setup
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
	{
	Super.PostBeginPlay();

	Cowardice=0.0;
	}


// Decompiled with UE Explorer.
defaultproperties
{
    bIsTrained=true
    ChamelHeadSkins=/* Array type was not detected. */
    RandomizedBoltons=/* Array type was not detected. */
    bAuthorityFigure=true
}