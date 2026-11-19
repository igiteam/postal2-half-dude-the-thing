class LPAICmd_DefenderOrbitFvs extends LPAICmd_DefenderOrbitBaseVs within LPAIControllerDefender;

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

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    Outer.CmdReactiveAttackFvs(TheVs);
    //return;    
}

function GetSpecialMoveForLandingOnVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderFvsLandOn';
    //return ReturnValue;    
}

function GetSpecialMoveForAttachedToVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderFvsSucking';
    //return ReturnValue;    
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
        CurrentAttackCmd = Outer.CmdRamAttackFvs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);
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
        CurrentAttackCmd = Outer.CmdReactiveAttackFvs(PawnToPerformRactiveAttackOn,, 1);
    }
    //return;    
}
