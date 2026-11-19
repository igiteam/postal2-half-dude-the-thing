class LPAICmd_NushiSporeOrbitPof extends LPAICmd_NushiSporeOrbit within LPAIControllerNushiSpore;

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
    // End:0x1A8
    if(Outer.DefenderPawn != none)
    {
        ResLoc = none;
        // End:0xA3
        if(Outer.HaveOrbitAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.OrbitAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        // End:0x1A8
        if(int(TypeOfAttackToldToPerform) == int(21))
        {
            CurrentAttackCmd = Outer.CmdRamAttackPof(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);            
        }
    }
    //return;    
}

function FlyAttackEnemyFromHere()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    super(LPAICmd_Orbit).FlyAttackEnemyFromHere();
    // End:0x1A8
    if(Outer.DefenderPawn != none)
    {
        ResLoc = none;
        // End:0xA3
        if(Outer.HaveOrbitAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.OrbitAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        // End:0x1A8
        if(int(TypeOfAttackToldToPerform) == int(21))
        {
            CurrentAttackCmd = Outer.CmdRamAttackPof(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), ResLoc, Outer.CmdStatus_Strike, 1);            
        }
    }
    //return;    
}
