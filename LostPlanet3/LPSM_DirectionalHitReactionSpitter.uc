class LPSM_DirectionalHitReactionSpitter extends LPSM_DirectionalHitReactionAI
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
    local /*0x97E50000-0x00000000*/ private @NULL Spitter;

    Spitter = LPAIPawnSpitter(MySPPawn);
    // End:0x4F
    if(Spitter != none)
    {
        // End:0x4F
        if(Spitter.IsStunned())
        {
            return 1;
        }
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}