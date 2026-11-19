class LPSM_PlayerVSWinchStunCarrier extends LPSM_PlayerVSWinchStun
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidShock[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], CarrierPawn, Winch;

    bDidShock = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    CarrierPawn = LPAIPawnCarrier(FollowerPawn);
    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    CarrierPawn.TemplateLogicData.GrabPointIndex = Winch.GrabbedPawnWinchPointIndex;
    CarrierPawn.TemplateLogicData.TargetPawn = LPPawn(MySPPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, Winch;

    // End:0x19
    if(!bDidShock)
    {
        DoKnockDown();
    }
    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x84
    if(Winch != none)
    {
        Winch.FinishInteractingWithLargePawn(false);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function DoVSShock()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, MyPlayingAnimSeq;

    // End:0x1B0
    if(!bDidShock)
    {
        bDidShock = true;
        bEndSpecialMoveOnInvalidFollower = false;
        LPVSPlayerPawn(MySPPawn).TaserLineCreateParticleSystem();
        LPC = LPAIController(FollowerPawn.Controller);
        // End:0x12E
        if(LPC != none)
        {
            LPC.CmdHitReactionToStun(LPAIPawn(FollowerPawn).TuneDataAIPawn.DurationOfShockStun.GetValue(), Class'LPSM_CarrierTazed', Class'LPSM_CarrierTazedStunStart', Class'LPSM_CarrierTazedStunFinish', LPPawn(MySPPawn));
        }
        MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), EndTazerIn,,, 0.2500000);
        // End:0x1B0
        if(MyPlayingAnimSeq == none)
        {
            MySPPawn.EndCurrentSpecialMove(self);
        }
    }
    //return;    
}

function EndTazerIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), EndTazerCycle);
    // End:0x7E
    if(MyPlayingAnimSeq == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

function EndTazerCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq, Winch;

    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x6B
    if(Winch != none)
    {
        Winch.FinishInteractingWithLargePawn(false);
    }
    MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), EndTazerOut,,,, 0.2500000);
    // End:0xEE
    if(MyPlayingAnimSeq == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

function EndTazerOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function DoKnockDown()
{
    LPAIController(FollowerPawn.Controller).CmdHitReactionToStun(LPAIPawnCarrier(FollowerPawn).TuneDataCarrier.DurationOfTripStun.GetValue(), Class'LPSM_CarrierTripped', Class'LPSM_CarrierTrippedStunStart', Class'LPSM_CarrierTrippedStunFinish', LPPawn(MySPPawn));
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
        // End:0x46
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            // End:0x43
            if(bDidShock)
            {
                return true;
            }
            // End:0x4C
            break;
        // End:0xFFFF
        default:
            // End:0x4C
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}