class LPSM_PlayerVSDrillArmSwingTwoHandBash extends LPSM_PlayerVSArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPVSPlayerPawn.SetPitchControllerTarget(0, 0.2500000);
    MyLPVSPlayerPawn.SetPitchControllerLock(true);
    // End:0xB7
    if(MyLPVSPlayerPawn.SubscribedOnArmAction != none)
    {
        MyLPVSPlayerPawn.OnArmAction('TwoHandBash');
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MyLPVSPlayerPawn.SetPitchControllerLock(false);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function NotifyEnablePlayerMovement()
{
    MyLPVSPlayerPawn.SetPitchControllerLock(false);
    super.NotifyEnablePlayerMovement();
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}