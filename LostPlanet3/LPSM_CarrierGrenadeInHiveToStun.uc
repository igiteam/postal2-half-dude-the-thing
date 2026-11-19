class LPSM_CarrierGrenadeInHiveToStun extends LPSM_CarrierStunStart
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myLPAIPawnCarrier;

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveStarted(bForced, PrevMove);
    myLPAIPawnCarrier = LPAIPawnCarrier(MySPPawn);
    // End:0xDF
    if(myLPAIPawnCarrier != none)
    {
        myLPAIPawnCarrier.AttachedGrenadeJustExploded(int(myLPAIPawnCarrier.LastHiveCellToHaveGrenadeStuckToIt));
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}