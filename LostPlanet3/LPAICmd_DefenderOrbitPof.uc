class LPAICmd_DefenderOrbitPof extends LPAICmd_DefenderOrbit within LPAIControllerDefender;

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

function CanStillAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Orbit).CanStillAttack())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttackFromOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    //return;    
}

function AttackEnemyFromOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    super(LPAICmd_Orbit).AttackEnemyFromOrbitSlot();
    // End:0x5AE
    if(Outer.DefenderPawn != none)
    {
        ResLoc = none;
        // End:0xA3
        if(Outer.HaveOrbitAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.OrbitAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        // End:0x2DC
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
        else
        {
            // End:0x4CA
            if(int(TypeOfAttackToldToPerform) == int(13))
            {
                CurrentAttackCmd = Outer.CmdDirectPhysicalAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_Strike, 1);                
            }
            else
            {
                // End:0x5AE
                if(int(TypeOfAttackToldToPerform) == int(21))
                {
                    CurrentAttackCmd = Outer.CmdRamAttackPof(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);                    
                }
            }
        }
    }
    //return;    
}

function FlyAttackEnemyFromHere()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    super(LPAICmd_Orbit).FlyAttackEnemyFromHere();
    // End:0x7C6
    if(Outer.DefenderPawn != none)
    {
        ResLoc = none;
        // End:0xA3
        if(Outer.HaveOrbitAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.OrbitAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        // End:0x2DC
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
        else
        {
            // End:0x4F4
            if(int(TypeOfAttackToldToPerform) == int(5))
            {
                CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);                
            }
            else
            {
                // End:0x6E2
                if(int(TypeOfAttackToldToPerform) == int(13))
                {
                    CurrentAttackCmd = Outer.CmdDirectPhysicalAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_Strike, 1);                    
                }
                else
                {
                    // End:0x7C6
                    if(int(TypeOfAttackToldToPerform) == int(21))
                    {
                        CurrentAttackCmd = Outer.CmdRamAttackPof(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);                        
                    }
                }
            }
        }
    }
    //return;    
}

function FlyAttackHammerTheEnemyWithPhysicalAttackFromHere()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    super(LPAICmd_Orbit).FlyAttackHammerTheEnemyWithPhysicalAttackFromHere();
    // End:0x191
    if(Outer.DefenderPawn != none)
    {
        ResLoc = none;
        // End:0xA3
        if(Outer.HaveOrbitAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.OrbitAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        CurrentAttackCmd = Outer.CmdRamAttackPof(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);
    }
    //return;    
}

function PerformFlyerReactionPhysicalAttackCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToPerformRactiveAttackOn[8388609];

    super(LPAICmd_Orbit).PerformFlyerReactionPhysicalAttackCmd(PawnToPerformRactiveAttackOn);
    // End:0x6C
    if(Outer.DefenderPawn != none)
    {
        CurrentAttackCmd = Outer.CmdReactiveAttackPoF(PawnToPerformRactiveAttackOn,, 1);
    }
    //return;    
}
