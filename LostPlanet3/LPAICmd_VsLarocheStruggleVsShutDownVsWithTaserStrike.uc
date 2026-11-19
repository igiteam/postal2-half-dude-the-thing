class LPAICmd_VsLarocheStruggleVsShutDownVsWithTaserStrike extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Popped()
{
    EnemyForStrike.EnableLineSweepHitTester(false);
    Outer.VsLarochePawn.CurrentPawnToApplyStruggleModeDamageTo = none;
    super.Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Strike).SetDesiredEnemy(InEnemy);
    Outer.VsLarochePawn.CurrentPawnToApplyStruggleModeDamageTo = InEnemy;
    EnemyForStrike.EnableLineSweepHitTester(true);
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsShuttingDownUrWithTaser';
    //return ReturnValue;    
}
