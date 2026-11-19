class SeqEvent_Touch extends SequenceEvent
    hidecategories(Object);

var(*) /*0x4D450000-0x00000000*/ private editfixedsize array ClassProximityTypes[65537];
var(*) /*0x4D450000-0x00000000*/ private editfixedsize array IgnoredClassProximityTypes[65537];
var(*) /*0x447D0000-0x00000000*/ private bool bForceOverlapping[65537];
var(*) /*0x447D0000-0x00000000*/ private bool bUseInstigator[65537];
var(*) /*0x447D0000-0x00000000*/ private bool bAllowDeadPawns[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TouchedList;

// Export USeqEvent_Touch::execCheckTouchActivate(FFrame&, void* const)
native final function CheckTouchActivate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x35EA0000-0x00000000*/ private bool bTest[9437185], ReturnValue;


}

// Export USeqEvent_Touch::execCheckUnTouchActivate(FFrame&, void* const)
native final function CheckUnTouchActivate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x35EA0000-0x00000000*/ private bool bTest[9437185], ReturnValue;


}

event Toggled()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;

    // End:0xA1
    if(bEnabled)
    {
        // End:0x9E
        if(Originator != none)
        {
            Idx = 0;
            J0x27:

            // End:0x9E [Loop If]
            if(Idx < Originator.Touching.Length)
            {
                CheckTouchActivate(Originator, Originator.Touching[Idx]);
                Idx++;
                // [Loop Continue]
                goto J0x27;
            }
        }        
    }
    else
    {
        TouchedList.Length = 0;
    }
    //return;    
}

function NotifyTouchingPawnDied()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x2C
    if(!bAllowDeadPawns)
    {
        CheckUnTouchActivate(Originator, P);
    }
    //return;    
}

function FireTouchEventsOnSwap()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inPawn[8388609], InOriginator;
    local /*0x35EA0000-0x00000000*/ private bool bUnTouch[8388609];
    local /*0x35EA0000-0x00000000*/ private int foundIdx;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivatedIndices;

    foundIdx = TouchedList.Find(inPawn);    
    // End:0x77
    if(foundIdx != -1)
    {
        ActivatedIndices[0] = ((bUnTouch) ? 1 : 0);
        CheckActivate(InOriginator, inPawn, false, ActivatedIndices, false);
    }
    //return;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    ClassProximityTypes=/* Array type was not detected. */
    bForceOverlapping=true
    ReTriggerDelay=0.1000000
    OutputLinks[0]=(Links=none,LinkDesc="Touched",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="UnTouched",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Empty",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Touch"
}