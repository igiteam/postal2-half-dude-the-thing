class LPSM_DirectionalHitReactionAI_Interrupt_Carrier extends LPSM_DirectionalHitReactionAI_Interrupt
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0xBA
    if(CarrierPawn != none)
    {
        // End:0xBA
        if(CarrierPawn.TemplateLogicData.CombatWindowName == 'Interrupt_Bash')
        {
            // End:0x93
            if(CarrierPawn.AreCellsOnSideDestroyed(0))
            {
                return 1;                
            }
            else
            {
                // End:0xBA
                if(CarrierPawn.AreCellsOnSideDestroyed(1))
                {
                    return 2;
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