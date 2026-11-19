class LPAICmd_CrabUberStrikeVs extends LPAICmd_CrabUberStrike within LPAIControllerBaseSnowCrab;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function StartUberStrike()
{
    // End:0x89
    if(LPAIPawnKingCrab(Outer.CrabPawn) != none)
    {
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabUberStrike', true, false, OnLPSM_CrabUberStrikeHitEnd, EnemyForStrike);        
    }
    else
    {
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntAttack', true, false, OnLPSM_CrabUberStrikeHitEnd);
    }
    //return;    
}
