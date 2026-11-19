class SeqAct_AIMoveToActor extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x43E70000-0x00000000*/ private bool bInterruptable[65537];
var(*) /*0x43E70000-0x00000000*/ private bool bPickClosest[65537];
var(*) /*0x43E70000-0x00000000*/ private editfixedsize array Destination[65537];
var(*) /*0x43E70000-0x00000000*/ private float MovementSpeedModifier[65537];
var(*) /*0x43E70000-0x00000000*/ private @NULL LookAt[65537];
var(*) /*0x35EA0000-0x00000000*/ private int LastDestinationChoice[536870913];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

function PickDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Requestor[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private float Dist, bestDist;
    local /*0x35EA0000-0x00000000*/ private @NULL Dest, BestDest;

    // End:0xCB
    if(bPickClosest)
    {
        // End:0xBD
        foreach Destination(Dest)
        {
            Dist = VSize(Dest.Location - Requestor.Location);
            // End:0xBC
            if((BestDest == none) || Dist < bestDist)
            {
                BestDest = Dest;
                bestDist = Dist;
            }            
        }        
        return BestDest;        
    }
    else
    {
        // End:0xFF
        if((LastDestinationChoice < 0) || LastDestinationChoice >= Destination.Length)
        {
            LastDestinationChoice = 0;
        }
        return Destination[LastDestinationChoice++];
    }
    //return ReturnValue;    
}

defaultproperties
{
    MovementSpeedModifier=1.0000000
    OutputLinks[0]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Destination",LinkVar="None",PropertyName="Destination",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Look At",LinkVar="None",PropertyName="LookAt",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Move To Actor"
}