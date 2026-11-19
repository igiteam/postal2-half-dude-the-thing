class LPSM_CarrierTalonFlurryStrikeInPOF extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x54
    if(CarrierPawn != none)
    {
        // End:0x52
        if(CarrierPawn.bAllHiveCellsDestroyed)
        {
            return 1;            
        }
        else
        {
            return 0;
        }
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    bUseManualChoreography=true
    ManualChoreographySeparationDistance=300.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}