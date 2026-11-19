class SeqEvent_Mover extends SequenceEvent
    hidecategories(Object,SequenceEvent);

var(*) /*0x44730000-0x00000000*/ private float StayOpenTime[65537];

event RegisterEvent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Mover;

    Mover = InterpActor(Originator);
    // End:0x53
    if(Mover != none)
    {
        Mover.StayOpenTime = StayOpenTime;
    }
    //return;    
}

function NotifyEncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Hit[8388609], ObjVar;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    ActivateIndices[0] = 3;
    // End:0x8C
    if(CheckActivate(Originator, Instigator, false, ActivateIndices, true))
    {
        // End:0x8B
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "Actor Hit")
        {
            ObjVar.SetObjectValue(Hit);            
        }        
    }
    //return;    
}

function NotifyAttached()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    // End:0x72
    if((Pawn(Other) != none) && IsZero(Originator.Velocity))
    {
        ActivateIndices[0] = 0;
        CheckActivate(Originator, Other, false, ActivateIndices);
    }
    //return;    
}

function NotifyDetached()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], P;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    // End:0x12
    if(Originator == none)
    {        
    }
    else
    {
        // End:0x90
        if(Pawn(Other) != none)
        {
            // End:0x5B
            foreach Originator.BasedActors(Class'Pawn', P)
            {                
                return;                
            }            
            ActivateIndices[0] = 1;
            CheckActivate(Originator, Instigator, false, ActivateIndices);
        }
    }
    //return;    
}

function NotifyFinishedOpen()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    ActivateIndices[0] = 2;
    CheckActivate(Originator, Instigator, false, ActivateIndices);
    //return;    
}

defaultproperties
{
    StayOpenTime=1.5000000
    MaxTriggerCount=0
    bPlayerOnly=false
    OutputLinks[0]=(Links=none,LinkDesc="Pawn Attached",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Pawn Detached",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Open Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Hit Actor",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Actor Hit",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Mover"
}