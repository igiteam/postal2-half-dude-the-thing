class LPSM_PlayerDeployMine extends LPSM_PlayerDeployDeployableBase
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPP;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPP = LPPlayerPawn(MySPPawn);
    // End:0x69
    if(LPP != none)
    {
        LPP.HandleNotifyShowProp(false, 1);
    }
    //return;    
}

defaultproperties
{
    PerkIndex=3
    AnimationTemplateNodeNames=/* Array type was not detected. */
}