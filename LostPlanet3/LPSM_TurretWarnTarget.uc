class LPSM_TurretWarnTarget extends SPSpecialMove
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], Turret;

    super.SpecialMoveStarted(bForced, PrevMove);
    Turret = LPAIPawnTurret(MySPPawn);
    // End:0x106
    if(Turret != none)
    {
        Turret.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('TurretWarning', 'None', Turret, none, none);
        Turret.SetTimer(Turret.TuneDataTurret.DelayBetweenIdleAndFirstShot.GetValue(), false, 'EndWarning', self);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPAIPawnTurret(MySPPawn).ClearTimer('EndWarning', self);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function EndWarning()
{
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}
