class LPSM_VsLarocheStrikeVsBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsLaPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyVsLaPawn = LPAIPawnVsLaroche(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, OtherPawn;

    OtherPawn = LPPawn(MyVsLaPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x8E
    if(OtherPawn != none)
    {
        OtherPawn.RemoveActiveCombatWindows(MyVsLaPawn);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], OtherPawn;

    OtherPawn = LPPawn(MyVsLaPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    super.AnimationStartedPlaying(SeqNode);
    // End:0xAD
    if(OtherPawn != none)
    {
        MyVsLaPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPawn);        
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}