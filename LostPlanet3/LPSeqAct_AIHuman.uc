class LPSeqAct_AIHuman extends LPSeqAct_AILatent
    hidecategories(Object);

enum EHSKismetAction
{
    HKA_MoveTo,                     // 0
    HKA_ShootAt,                    // 1
    HKA_ShootAtInPos,               // 2
    HKA_Flee,                       // 3
    HKA_Wander,                     // 4
    HKA_Deprecated,                 // 5
    HKA_Melee,                      // 6
    HKA_Stop,                       // 7
    HKA_MAX                         // 8
};

var(0.25_Pct) /*0x94630000-0x00000000*/ private @NULL MoveTo[65537];
var(0.25_Pct) /*0x94630000-0x00000000*/ private int CoverSlotIdx[65537];
var(0.25_Pct) /*0x94630000-0x00000000*/ private @NULL ShootAt[65537];
var(0.25_Pct) /*0x94630000-0x00000000*/ private float SpeedScale[65537];
var(0.25_Pct) /*0x583C0000-0x00000000*/ private editfixedsize array FleeFrom[65537];
var(0.25_Pct) /*0x583C0000-0x00000000*/ private float DistanceFlee[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private @NULL MeleeAt[65537];
var(0.25_Pct) /*0x82610000-0x00000000*/ private float MaxTimeAction[65537];
var(0.25_Pct) /*0x82610000-0x00000000*/ private bool TurnOnAIOnFinished[65537];

event GetStopInputLink()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 7;
    //return ReturnValue;    
}

function GetCoverInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutCoverInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    OutCoverInfo.Link = CoverLink(MoveTo);
    OutCoverInfo.SlotIdx = CoverSlotIdx;
    // End:0x79
    if(OutCoverInfo.Link == none)
    {
        return false;
    }
    // End:0x10E
    if((OutCoverInfo.SlotIdx < 0) || OutCoverInfo.SlotIdx >= OutCoverInfo.Link.Slots.Length)
    {
        OutCoverInfo.SlotIdx = 0;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    DistanceFlee=1500.0000000
    InputLinks[0]=(LinkDesc="MoveTo",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="ShootAt",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="ShootAtInPos",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[3]=(LinkDesc="Flee",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[4]=(LinkDesc="Wander",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[5]=(LinkDesc="Deprecated",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[6]=(LinkDesc="Melee",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[7]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="MoveTo",LinkVar="None",PropertyName="MoveTo",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="ShootAt",LinkVar="None",PropertyName="ShootAt",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[3]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="FleeFrom",LinkVar="None",PropertyName="FleeFrom",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[4]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="MeleeAt",LinkVar="None",PropertyName="MeleeAt",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Human AI Orders"
}