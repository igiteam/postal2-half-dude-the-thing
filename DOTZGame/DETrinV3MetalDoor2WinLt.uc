//////////////////////////////////////////////////////////////////////////////
// TrinV3MetalDoor2WinLt
//
// Description:
//    
//    This is a netfixed version of the original door class. It also fixes 
//    the sound so it is more localized to the door's area.
//
// Written by: Jeff Shutts (aka Trin)
// Date:       5/3/2007
//
// Copyright 2007  Jeff Shutts   All rights reserved.
//
// Mod Package: TrinNetFixV3.u
// Game:        Land of the Dead:Road to Fiddler's Green - Version 1.1
// Engine:      Unreal Tournament 2003 - Build 2226
//
// Website:     Please visit www.trinserver.com  or  undeadgames.com
//////////////////////////////////////////////////////////////////////////////

//======================================================================================
// Modified for DE use, thanks to trin for the code.
//======================================================================================

class DETrinV3MetalDoor2WinLt extends DETrinV3MetalDoor
    implements(Smashable)
    placeable;

var vector TrinBasePos;
var rotator TrinBaseRot;

replication
{
	// Things the server should send to the client.
	reliable if( Role==ROLE_Authority )
		TrinBaseRot, TrinBasePos;
}

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    if (Level.NetMode != NM_CLIENT)
    {
       TrinBasePos=BasePos;
       TrinBaseRot=BaseRot;
    }
}

simulated function PostNetBeginPlay()
{
    if (Level.NetMode == NM_CLIENT)
    {
        BasePos=TrinBasePos;
        BaseRot=TrinBaseRot;
    }

    Super.PostNetBeginPlay();
}


// Decompiled with UE Explorer.
defaultproperties
{
    StaticMesh=StaticMesh'DOTZSObjects.Doors.MetalDoor2WinLt'
    DrawScale3D=(X=1.0000000,Y=-1.0000000,Z=1.0000000)
    Skins[0]=Texture'COTDMainTX.Walls.UTA38'
    Skins[1]=FinalBlend'DOTZTObjects.Doors.SafetyGlassFinal'
    Skins[2]=Texture'COTDMainTX.Walls.UTA38'
}