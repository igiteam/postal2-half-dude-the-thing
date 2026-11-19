///////////////////////////////////////////////////////////////////////////////
// Tells everyone that will listen there's something 
// they really want here. 
//
// Started to be used for donut and money pickups that the player has dropped.
//
///////////////////////////////////////////////////////////////////////////////
class DesiredThingMarker extends BlipMarker;

var bool bRunToDesire;


// Decompiled with UE Explorer.
defaultproperties
{
    bNotifyOnStart=false
    NotifyTime=5
    CollisionRadius=1500.0000000
    CollisionHeight=400.0000000
}