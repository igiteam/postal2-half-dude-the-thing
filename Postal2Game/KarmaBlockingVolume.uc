///////////////////////////////////////////////////////////////////////////////
// KarmaBlockingVolume
// Copyright 2015, Running With Scissors, Inc. All Rights Reserved
//
// A volume that blocks Karma collision, nothing more, nothing less.
///////////////////////////////////////////////////////////////////////////////
class KarmaBlockingVolume extends BlockingVolume
	hidecategories(BlockingVolume);
	

// Decompiled with UE Explorer.
defaultproperties
{
    BrushColor=(R=192,G=192,B=192,A=255)
    bColored=true
    bWorldGeometry=false
    bCollideActors=false
    bBlockActors=false
    bBlockPlayers=false
    bBlockKarma=true
}