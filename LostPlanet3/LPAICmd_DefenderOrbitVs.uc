class LPAICmd_DefenderOrbitVs extends LPAICmd_DefenderOrbitBaseVs within LPAIControllerDefender;

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

    Outer.CmdReactiveAttackVs(TheVs);
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
        CurrentAttackCmd = Outer.CmdRamAttackVs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);
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
        CurrentAttackCmd = Outer.CmdReactiveAttackVs(PawnToPerformRactiveAttackOn,, 1);
    }
    //return;    
}
