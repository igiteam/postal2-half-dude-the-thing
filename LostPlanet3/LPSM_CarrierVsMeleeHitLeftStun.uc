class LPSM_CarrierVsMeleeHitLeftStun extends LPSM_CarrierDefaultStandingStun
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], CarrierPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0xF4
    if(CarrierPawn != none)
    {
        CarrierPawn.SetGrabPointEnabledByIndex(0, true);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x4C
    if(CarrierPawn != none)
    {
        CarrierPawn.SetGrabPointEnabledByIndex(0, false);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}