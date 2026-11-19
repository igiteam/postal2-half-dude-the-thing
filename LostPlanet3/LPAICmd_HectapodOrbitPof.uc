class LPAICmd_HectapodOrbitPof extends LPAICmd_HectapodOrbit within LPAIControllerHectapod;

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

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Melee).CanStrike())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function AttackEnemyFromOrbitSlot()
{
    // End:0x23C
    if(Outer.HectapodPawn != none)
    {
        Outer.bMeleeFinished = false;
        Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.HectapodPawn.TuneDataHectapod.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.HectapodPawn.TuneDataHectapod.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.HectapodPawn.TuneDataHectapod.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.HectapodPawn.TuneDataHectapod.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, None, Outer.CmdStatus_Strike, 1);
    }
    //return;    
}
