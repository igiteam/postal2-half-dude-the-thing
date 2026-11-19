class LPSeqAct_AIMoveToActor extends SPSeqAct_AIMoveToActor
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82640000-0x00000000*/ private bool WalkToDestination[65537];
var(0.25_Pct) /*0x82640000-0x00000000*/ private bool FaceTargetActorRotationOnArrival[65537];
var(0.25_Pct) /*0x82640000-0x00000000*/ private bool bAllowFiringWhileMoving[65537];
var(0.25_Pct) /*0x82640000-0x00000000*/ private float DistanceFaceDestinationOnArrival[65537];
var(0.25_Pct) /*0x82640000-0x00000000*/ private byte ArrivalStopType[65537];
var(0.25_Pct) /*0x82640000-0x00000000*/ private float DistanceConsiderReached[65537];

defaultproperties
{
    ObjName="Move To Actor (Latent) (LP)"
}