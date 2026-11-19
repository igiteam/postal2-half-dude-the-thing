class LPSeqAct_Interp extends SPCameraSeqAct_Interp
    config(Engine)
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82C80000-0x00000000*/ private bool bAllowPlayerToCancel[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerCanceled[536870913];
var(0.25_Pct) /*0x82C80000-0x00000000*/ private float MinPlayerCancelTime[65537];

// Export ULPSeqAct_Interp::execPlayerTryingToCancel(FFrame&, void* const)
native final function PlayerTryingToCancel();

defaultproperties
{
    MinPlayerCancelTime=1.0000000
    ReplicatedActorClass=Class'LPMatineeActor'
    ObjName="Matinee (LP)"
}