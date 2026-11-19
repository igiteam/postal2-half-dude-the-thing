class LPSM_PlayerVSWinchArmFire extends LPSM_PlayerVSWinchFireBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPVP, Winch;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPVP = LPBaseVSPlayerPawn(MySPPawn);
    Winch = LPWeaponVSWinch(LPVP.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xA7
    if(Winch != none)
    {
        Winch.GotoState('Firing');
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x3B
    if(!bSpecialMoveEnded)
    {
        MySPPawn.DoSpecialMove(Class'LPSM_PlayerVSWinchFireHold', true);
    }
    //return;    
}

defaultproperties
{
    bEndSpecialMoveOnAnimFinish=false
    AnimFinishedDelegate=AnimFinished
    AnimationTemplateNodeNames=/* Array type was not detected. */
}