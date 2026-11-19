//=============================================================================
// BlockedPath.
// 
//=============================================================================
class BlockedPath extends NavigationPoint
	placeable;

function Trigger( actor Other, pawn EventInstigator )
{
	bBlocked = !bBlocked;
}


// Decompiled with UE Explorer.
defaultproperties
{
    bBlocked=true
}