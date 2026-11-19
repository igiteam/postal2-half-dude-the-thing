class LPSM_VsLarocheArmSwingBase extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ComboSpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class EndSpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AttackIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartsComboSpecialMoveInstantly;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreventChain[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class NextSpecialMoveClass[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsLaPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyVsLaPawn = LPAIPawnVsLaroche(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    MyVsLaPawn.StartRightArmPartAction(1);
    MyVsLaPawn.NotifyAIOfMeleeSwingStart();
    NextSpecialMoveClass = none;
    bPreventChain = false;
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
    MyVsLaPawn.StopRightArmPartAction(1);
    // End:0x106
    if(MyVsLaPawn.IsLocallyControlled() && NextMove == none)
    {
        // End:0x106
        if(NextSpecialMoveClass == none)
        {
            NextSpecialMoveClass = EndSpecialMoveClass;
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    DoNextSpecialMove();
    //return;    
}

function SpecialMoveEndedStopAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x59
    if((NextMove == none) || NextSpecialMoveClass != NextMove.Class)
    {
        super.SpecialMoveEndedStopAnimation(PrevMove, NextMove);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            CheckKnockOut();
            // End:0x44
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function CheckKnockOut()
{
    //return;    
}

function IsAnimTimeInRangeForCombo()
{
    local /*0x97E50000-0x00000000*/ private float AnimPercent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoNextSpecialMove()
{
    // End:0x0F
    if(bPreventChain)
    {
        return;
    }
    // End:0x8D
    if(NextSpecialMoveClass != none)
    {
        MyVsLaPawn.DoSpecialMove(NextSpecialMoveClass, true, true,, MyVsLaPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    }
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], OtherPawn;

    OtherPawn = LPPawn(MyVsLaPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    super.AnimationStartedPlaying(SeqNode);
    // End:0xAA
    if(OtherPawn != none)
    {
        MyVsLaPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPawn);
    }
    //return;    
}
