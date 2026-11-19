class LPSM_ForkArmGrab_HoldSpitterTailNeutral extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartSpitDelayTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpitterIsSpitting[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    StartSpitDelayTime = SpitterPawn.TuneDataSpitter.TailHold_TimeoutToSpit.GetValue();
    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0xD2
    if(LPPC != none)
    {
        LPPC.SetTutorialMode(7);
    }
    // End:0x10D
    if(SpitterPawn.IsSpitting())
    {
        StartTargetedSpit();
        bSpitterIsSpitting = true;        
    }
    else
    {
        bSpitterIsSpitting = false;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x8D
    if(NextMove.Class == Class'LPSM_ForkArmGrab_HoldSpitterTailUp')
    {
        // End:0x8D
        if(LPPC != none)
        {
            LPPC.CompletedTutorialMode(7);
        }
    }
    LPPC.SetTutorialMode(0);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartInteraction()
{
    super(LPSM_ForkArmGrab_HoldStateBased).StartInteraction();
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x83
    if(!bSpitterIsSpitting)
    {
        StartSpitDelayTime -= DeltaTime;
        // End:0x83
        if(StartSpitDelayTime <= 0.0000000)
        {
            // End:0x83
            if(SpitterPawn.MySpitterController.IsSpitPossible())
            {
                StartTargetedSpit();
                bSpitterIsSpitting = true;
            }
        }
    }
    super(LPSM_ForkArmGrab_HoldStateBased).Tick(DeltaTime);
    //return;    
}

defaultproperties
{
    bIgnoreSpitDamage=false
    bLoopAnimation=true
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_Neutral
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutral.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutral.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutral.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}