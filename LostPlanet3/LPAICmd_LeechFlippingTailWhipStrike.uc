class LPAICmd_LeechFlippingTailWhipStrike extends LPAICmd_LeechStaticStrikeBase within LPAIControllerLeech;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJumpingBack;

function Pushed()
{
    bJumpingBack = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    super.Popped();
    Outer.LeechPawn.SetInverted();
    Outer.UseAnimationInverted();
    Outer.Focus = none;
    //return;    
}

function On_LPSM_StaticStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x1A
    if(bJumpingBack)
    {
        StartStaticStrikeSpecialMove();        
    }
    else
    {
        bSpecialMovePlaying = false;
    }
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy2D;

    rangeToEnemy2D = EnemyRange2D();
    // End:0x51
    if((rangeToEnemy2D < 150.0000000) && !bJumpingBack)
    {
        bJumpingBack = true;
        return Class'LPSM_LeechJumpBackBeforeDamageAssessment';        
    }
    else
    {
        bJumpingBack = false;
        return Class'LPSM_LeechFlippingTailWhipStrike';
    }
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x58
    if(Outer.LeechPawn != none)
    {
        return Outer.LeechPawn.MaxTimeForFlippingTailWhipAnimation;
    }
    return 10.0000000;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}
