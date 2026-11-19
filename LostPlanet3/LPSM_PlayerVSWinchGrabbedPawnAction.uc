class LPSM_PlayerVSWinchGrabbedPawnAction extends SPSpecialMove
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDroppedPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingTossAnim[536870913];

function GetPawnSpecialMoveStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    //return ReturnValue;    
}

function GetTouchedEventIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}

function GetSMMessageType()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    //return ReturnValue;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn;

    bDroppedPawn = false;
    bPlayingTossAnim = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x1DD
    if(vsPawn.GrabbedPawn != none)
    {
        vsPawn.GetMyPlayerController().EnableGrabPointsDisplay(false);
        vsPawn.TemplateLogicData.TargetPawn = vsPawn.GrabbedPawn;
        PlayStartAnim(vsPawn.GrabbedPawn);
        vsPawn.GrabbedPawn.DoSpecialMove(GetPawnSpecialMoveStart(vsPawn.GrabbedPawn), true,,, MySPPawn);
        MySPPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', vsPawn.GrabbedPawn, GetTouchedEventIndex());
    }
    //return;    
}

function PlayStartAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609], S;

    S = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), PlayEndAnim,, 1.0000000, 0.2000000, 0.1000000, false, true);
    S.SetIssueAnimFinishedCallbackOnInterruption(true);
    //return;    
}

function PlayEndAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL S;

    // End:0x2C
    if(bInterrupted)
    {
        EndSpecialMove(Node, InUserData, true);
        return;
    }
    bPlayingTossAnim = true;
    S = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), EndSpecialMove,, 1.0000000, 0.1000000, 0.2500000, false, true);
    S.SetIssueAnimFinishedCallbackOnInterruption(true);
    LPVSPlayerPawn(MySPPawn).GrabbedPawn.BroadcastSMMessage(GetSMMessageType());
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

event AnimNotifySpecialMove()
{
    // End:0x17
    if(bPlayingTossAnim)
    {
        DoRelease();
    }
    //return;    
}

function DoRelease()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch, vsPawn;

    // End:0x184
    if(!bDroppedPawn)
    {
        bDroppedPawn = true;
        vsPawn = LPVSPlayerPawn(MySPPawn);
        Winch = LPWeaponVSWinch(vsPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
        // End:0xA8
        if(Winch != none)
        {
            Winch.GotoState('Idle');            
        }
        else
        {
            vsPawn.EndHoldingPawn();
        }
        // End:0x184
        if((vsPawn.GrabbedPawn != none) && !vsPawn.GrabbedPawn.IsPendingKill())
        {
            vsPawn.GrabbedPawn.DoVSCrushTossAction(vsPawn);
            vsPawn.GrabbedPawn = none;
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    DoRelease();
    LPVSPlayerPawn(MySPPawn).GetMyPlayerController().EnableGrabPointsDisplay(true);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x6B
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            // End:0x69
            if(LPVSPlayerPawn(MySPPawn).ShouldAllowHitReaction())
            {
                PlayAdditiveHitReaction();
            }
            return true;
        // End:0xFFFF
        default:
            // End:0x71
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function PlayAdditiveHitReaction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAnimParams;

    NewAnimParams.SequenceTemplate = GetBestSequenceTemplateByIndex(2);
    NewAnimParams.Rate = 1.0000000;
    NewAnimParams.BlendInTime = 0.1000000;
    NewAnimParams.BlendOutTime = 0.1000000;
    NewAnimParams.bOverride = false;
    MySPPawn.PlayAdditiveAnimationFromParams(NewAnimParams);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}