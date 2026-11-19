class LPSM_DirectionalHitReactionCarrierVS extends LPSM_DirectionalHitReactionAI
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn, NewRotation, Dir;

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn.TakeDamageParams.InstigatedByPawn);
    // End:0x153
    if(vsPawn != none)
    {
        Dir = vsPawn.Location - MySPPawn.Location;
        Dir.Z = 0.0000000;
        NewRotation = Rotator(Dir);
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
        MySPPawn.SetRotation(NewRotation);
    }
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x7A
    if(CarrierPawn != none)
    {
        // End:0x54
        if(CarrierPawn.AreCellsOnSideDestroyed(0))
        {
            return 0;            
        }
        else
        {
            // End:0x7A
            if(CarrierPawn.AreCellsOnSideDestroyed(1))
            {
                return 1;
            }
        }
    }
    return Rand(2);
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}