class LPSM_SepiaStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove[1073741825];

function GetAutoShutOffTimeForThisStaticAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AutoShutOffTimeForStrikeSpecialMove;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], AIPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;

    super.AnimationStartedPlaying(SeqNode);
    AIPawn = LPAIPawn(MySPPawn);
    // End:0xC9
    if((AIPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0xC9
        if(NotifyArray.Length == 0)
        {
            AIPawn.HandleNotifyPlayerDodgeWindow(14, 0, none);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, AIPawn;

    AIPawn = LPAIPawn(MySPPawn);
    // End:0x6E
    if(AIPawn != none)
    {
        AIPawn.HandleNotifyPlayerDodgeWindow(12, 1, none);
        AIPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x141
    if(int(MySPPawn.Mesh.RootMotionMode) != int(2))
    {
        // End:0x141
        if(bManageRootMotionMode)
        {
            MySPPawn.Mesh.RootMotionMode = 2;
            MySPPawn.Mesh.RootMotionRotationMode = 0;
        }
    }
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    bManageRootMotionMode=true
}