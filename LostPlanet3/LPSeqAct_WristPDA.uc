class LPSeqAct_WristPDA extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EPDAStates
{
    PDAState_Incoming,              // 0
    PDAState_Playback,              // 1
    PDAState_MAX                    // 2
};

enum EPDASpeeds
{
    PDASpeed_Slow,                  // 0
    PDASpeed_Medium,                // 1
    PDASpeed_Fast,                  // 2
    PDASpeed_MAX                    // 3
};

var(0.25_Pct) /*0x83810000-0x00000000*/ private byte State[65537];
var(0.25_Pct) /*0x83810000-0x00000000*/ private byte Speed[65537];

defaultproperties
{
    State=EPDAStates.PDAState_Playback
    Speed=EPDASpeeds.PDASpeed_Medium
    InputLinks[0]=(LinkDesc="Open",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Close",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Done",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Wrist PDA (LP)"
}