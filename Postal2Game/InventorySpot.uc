//=============================================================================
// InventorySpot.
//=============================================================================
class InventorySpot extends SmallNavigationPoint
	native;


var Pickup markedItem;

/* GetMoveTargetFor()
Possibly return pickup rather than self as movetarget
*/
function Actor GetMoveTargetFor(AIController B, float MaxWait)
{
	if ( (markedItem != None) && markedItem.ReadyToPickup(MaxWait) && (B.Desireability(markedItem) > 0) )
		return markedItem;
	
	return self;
}


// Decompiled with UE Explorer.
defaultproperties
{
    bCollideWhenPlacing=false
    bHiddenEd=true
}