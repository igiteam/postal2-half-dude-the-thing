/*=============================================================================
// Ladders are associated with the LadderVolume that encompasses them, and provide AI navigation 
// support for ladder volumes.  Direction should be the direction that climbing pawns
// should face
============================================================================= */

class Ladder extends SmallNavigationPoint
	placeable
	native;

#exec Texture Import File=Textures\ladder_new.bmp Name=S_Ladder Mips=Off MASKED=1 ALPHA=1

var LadderVolume MyLadder;
var Ladder LadderList;

/* 
Check if ladder is already occupied
*/
event bool SuggestMovePreparation(Pawn Other)
{
	if ( MyLadder == None )
		return false;

	if ( !MyLadder.InUse(Other) )
	{
		MyLadder.PendingClimber = Other;
		return false;
	}

	Other.Controller.bPreparingMove = true;
	Other.Acceleration = vect(0,0,0);
	return true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    bSpecialMove=true
    bNotBased=true
    Texture=Texture'S_Ladder'
    DrawScale=0.2500000
    bDirectional=true
}