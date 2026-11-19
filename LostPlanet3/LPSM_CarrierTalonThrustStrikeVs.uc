class LPSM_CarrierTalonThrustStrikeVs extends LPSM_CarrierStrikeVsBase
    config(Game);

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;
    local /*0x97E50000-0x00000000*/ private bool bCanDoRight, bCanDoLeft;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0xC5
    if(CarrierPawn != none)
    {
        bCanDoRight = CarrierPawn.DoesHaveVulnerableCellsOnSide(0);
        bCanDoLeft = CarrierPawn.DoesHaveVulnerableCellsOnSide(1);
        // End:0xA4
        if(bCanDoRight == bCanDoLeft)
        {
            return Rand(2);            
        }
        else
        {
            // End:0xB6
            if(bCanDoRight)
            {
                return 1;                
            }
            else
            {
                // End:0xC5
                if(bCanDoLeft)
                {
                    return 0;
                }
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}