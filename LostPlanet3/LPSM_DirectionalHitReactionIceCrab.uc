class LPSM_DirectionalHitReactionIceCrab extends LPSM_DirectionalHitReactionAI
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
    local /*0x97E50000-0x00000000*/ private @NULL Crab;

    Crab = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x76
    if(Crab != none)
    {
        // End:0x52
        if(Crab.IsClawLeftDismembered())
        {
            return 1;            
        }
        else
        {
            // End:0x76
            if(Crab.IsClawRightDismembered())
            {
                return 0;
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