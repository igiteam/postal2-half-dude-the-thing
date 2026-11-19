class LPSM_TurretScanForEnemies extends SPSpecialMove
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], Turret;

    super.SpecialMoveStarted(bForced, PrevMove);
    Turret = LPAIPawnTurret(MySPPawn);
    // End:0x69
    if(Turret != none)
    {
        Turret.SetTurretTrackingMode(2);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, Turret;

    super.SpecialMoveEnded(PrevMove, NextMove);
    Turret = LPAIPawnTurret(MySPPawn);
    // End:0x68
    if(Turret != none)
    {
        Turret.SetTurretTrackingMode(0);
    }
    //return;    
}
