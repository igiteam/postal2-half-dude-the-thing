class LPAICmd_LeechMeleePof extends LPAICmd_LeechMelee within LPAIControllerLeech;

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
    local /*0x97E50000-0x00000000*/ private @NULL strikeDensityRes;

    // End:0x26
    if(!Outer.HaveAttackAccess())
    {
        return false;
    }
    // End:0xCD
    if(EnemyForAttack != none)
    {
        strikeDensityRes = LPAIResLeechStrike(EnemyForAttack.AIResourceManager.GetResource(Outer.StrikeResourceName));
        // End:0xCD
        if(strikeDensityRes != none)
        {
            // End:0xCD
            if(strikeDensityRes.IsDensityOfStrikesOverTimeTooHighToAllowAnotherStrike())
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    Outer.GetAttackAccess(EnemyForAttack);
    //return;    
}

function AttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    // End:0x286
    if(Outer.LeechPawn != none)
    {
        ResLoc = none;
        // End:0x98
        if(Outer.HaveMeleeAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.MeleeAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        Outer.CmdDirectAttackPof(EnemyForAttack, int(Outer.LeechPawn.TuneDataLeech.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.LeechPawn.TuneDataLeech.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.LeechPawn.TuneDataLeech.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.LeechPawn.TuneDataLeech.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_LeechAttack, 1);
    }
    //return;    
}
