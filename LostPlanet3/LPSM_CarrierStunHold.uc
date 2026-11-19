class LPSM_CarrierStunHold extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], CarrierPawn;

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0xC7
    if(CarrierPawn != none)
    {
        // End:0xC7
        if(CarrierPawn.bAllHiveCellsDestroyed)
        {
            CarrierPawn.SetGrabPointEnabledByIndex(2, true);
        }
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.bSemiGodMode = true;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x4D
    if(CarrierPawn != none)
    {
        CarrierPawn.SetGrabPointEnabledByIndex(2, false);
    }
    MySPPawn.bSemiGodMode = false;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}