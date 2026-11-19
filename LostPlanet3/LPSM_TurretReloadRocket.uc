class LPSM_TurretReloadRocket extends LPSM_ReloadWeaponBase
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPAIPawnTurret(MySPPawn).ClearTimer('ReloadDelayFinished', self);
    super(SPSM_ReloadWeaponBase).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PlayReloadAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL Turret;

    Turret = LPAIPawnTurret(MySPPawn);
    // End:0xE9
    if(Turret != none)
    {
        Turret.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('TurretReload', 'None', Turret, none, none);
        Turret.SetTimer(Turret.TuneDataTurret.ReloadDelay.GetValue(), false, 'ReloadDelayFinished', self);
    }
    //return;    
}

function ReloadDelayFinished()
{
    ReloadAnimFinished(none, 0, false);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}