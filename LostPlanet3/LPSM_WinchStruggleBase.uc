class LPSM_WinchStruggleBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Target[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myAIPawn, LPAIC;

    super.SpecialMoveStarted(bForced, PrevMove);
    myAIPawn = LPAIPawn(MySPPawn);
    Target = LPBaseVSPlayerPawn(myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    myAIPawn.NotifyJustGotGrabbed(Target);
    myAIPawn.TriggerEventClass(Class'LPSeqEvent_VSPickedUp', Target);
    // End:0x289
    if(Target != none)
    {
        Target.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', myAIPawn, 0);
        // End:0x289
        if(!myAIPawn.TuneDataAIPawn.bCanBeThrownByVS)
        {
            LPAIC = LPAIController(MySPPawn.Controller);
            // End:0x223
            if(LPAIC != none)
            {
                LPAIC.Focus = Target;
                LPAIC.AILog_Internal("Focus set to: " @ string(LPAIC.Focus));
            }
            myAIPawn.Velocity = Normal(Target.Location - myAIPawn.Location) * 1000.0000000;
        }
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x39
        case Class'LPSMMTypes'.default.SMM_IsPawnGrabbed:
            return true;
            // End:0x9A
            break;
        // End:0x94
        case Class'LPSMMTypes'.default.SMM_PlayDying:
            // End:0x91
            if(Target != none)
            {
                LPVSPlayerPawn(Target).ClearHoldingPawn();
            }
            // End:0x9A
            break;
        // End:0xFFFF
        default:
            // End:0x9A
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}