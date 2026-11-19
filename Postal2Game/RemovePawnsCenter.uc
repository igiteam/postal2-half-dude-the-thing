///////////////////////////////////////////////////////////////////////////////
// RemovePawnsCenter
// Copyright 2014, Running With Scissors, Inc. All Rights Reserved.
//
// Easily-identifiable marker for ACTION_RemoveNonMoviePawns
///////////////////////////////////////////////////////////////////////////////
class RemovePawnsCenter extends Keypoint
	hidecategories(Movement,Lighting,LightColor,Karma,Force,Shadow);


// Decompiled with UE Explorer.
defaultproperties
{
    Texture=Texture'PostEd.Icons_256.RemovePawn'
    CollisionRadius=50.0000000
    CollisionHeight=50.0000000
    bCollideActors=true
    bBlockZeroExtentTraces=false
    bBlockNonZeroExtentTraces=false
    bUseCylinderCollision=true
}