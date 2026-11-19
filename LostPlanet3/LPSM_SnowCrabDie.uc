class LPSM_SnowCrabDie extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyAkridPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    MyAkridPawn = LPAIPawnAkrid(MySPPawn);
    MyAkridPawn.BlendAllMaxCoreDamageFactors(1.0000000, -1.0000000);
    //return;    
}

defaultproperties
{
    BlendOutTime=-1.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}