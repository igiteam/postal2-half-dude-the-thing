class LPSM_VsLarocheWinched extends LPSM_LargePawnWinched
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL larocheVsPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    larocheVsPawn = LPAIPawnVsLaroche(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x102
    if(larocheVsPawn != none)
    {
        // End:0xA5
        if(larocheVsPawn.GetCoreHealth(11) > float(0))
        {
            larocheVsPawn.MyVsLarocheController.DestroyRightShoulder();
        }
        // End:0x102
        if(larocheVsPawn.GetCoreHealth(27) > float(0))
        {
            larocheVsPawn.MyVsLarocheController.DestroyRightShoulderLight();
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function EndAnimationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SavedLeaderLPPawn;

    // End:0x85
    if(!bInterrupted && InUserData == 2)
    {
        SavedLeaderLPPawn = LPPawn(LeaderPawn);
        larocheVsPawn.EndCurrentSpecialMove(self);
        SavedLeaderLPPawn.EndCurrentSpecialMove(LeaderSMInstance);
    }
    //return;    
}

function StartAnimation()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    AnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(Index),, Index,, 0.2000000, 0.2500000, false,, 2, 2, true);
    // End:0x6D
    if(AnimSeq != none)
    {
        return true;        
    }
    else
    {
        ScriptTrace();
        return false;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}