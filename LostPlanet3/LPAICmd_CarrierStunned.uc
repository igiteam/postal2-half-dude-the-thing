class LPAICmd_CarrierStunned extends LPAICmd_Stunned within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowHastyPincerBash[536870913];

function SetAllowHastyPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool bBash[8388609];

    bAllowHastyPincerBash = bBash;
    //return;    
}

function Pushed()
{
    super.Pushed();
    Outer.myAIPawn.EnableLineSweepHitTester(true);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.myAIPawn.EnableLineSweepHitTester(false);
    //return;    
}

function NotfiyEnemyChangedPawns()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;

    // End:0x30
    if(LPPlayerPawn(PawnSwitchingTo) != none)
    {
        DurrationOfStunInSecs += (GetExtraStunTimeForLeavingVS());        
    }
    else
    {
        // End:0x57
        if(LPBaseVSPlayerPawn(PawnSwitchingTo) != none)
        {
            DurrationOfStunInSecs = 0.0000000;
        }
    }
    //return;    
}

function GetExtraStunTimeForLeavingVS()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, DefenderPawn;
    local /*0x97E50000-0x00000000*/ private float ExtraStunTime;

    ExtraStunTime += Outer.CarrierPawn.TuneDataCarrier.StunDurationBoostWhenPlayerLeavesVS.GetValue();
    CurPawn = Outer.WorldInfo.PawnList;
    J0xA6:

    // End:0x1C1 [Loop If]
    if(CurPawn != none)
    {
        DefenderPawn = LPAIPawnDefender(CurPawn);
        // End:0x196
        if((DefenderPawn != none) && DefenderPawn.Health > 0)
        {
            // End:0x196
            if(DefenderPawn.LandOnVsAttackSlotSocketIdx >= 0)
            {
                ExtraStunTime += Outer.CarrierPawn.TuneDataCarrier.StunDurationBoostDefendersOnVS.GetValue();
                // [Explicit Break]
                goto J0x1C1;
            }
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0xA6;
    }
    J0x1C1:

    return ExtraStunTime;
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

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x93
        if(ClassIsChildOf(MyPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill') || ClassIsChildOf(MyPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSWelder'))
        {
            DurrationOfStunInSecs = 0.0000000;
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x7D
    if((LPBaseVSPlayerPawn(Outer.MyLPEnemy) != none) && Outer.MyLPEnemy.Controller == none)
    {
        DurrationOfStunInSecs += (GetExtraStunTimeForLeavingVS());
    }
    Outer.Focus = none;
    StunnedStatus.Cmd_Stunned_Status = 1;
    TimeStartedStun = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(StunnedSpecialMove, true, false);
    J0x127:

    // End:0x154 [Loop If]
    if(StillStunned())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x127;
    }
    StunnedStatus.Cmd_Stunned_Status = 2;
    Outer.PopCommand(self);
    stop;            
}
