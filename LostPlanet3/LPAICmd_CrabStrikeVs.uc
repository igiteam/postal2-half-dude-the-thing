class LPAICmd_CrabStrikeVs extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStrikeFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStrikingWithRightClaw[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeClawStrikeStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepTimeInSecsDuringAttackUpdate[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bStrikeFinished = false;
    TimeClawStrikeStarted = -1.0000000;
    Outer.bStruckVsWithClawWhileVsWasBlocking = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    // End:0x123
    if(Outer.CrabPawn != none)
    {
        // End:0xB8
        if(Outer.CrabPawn.DidTheRightClawJustStartStrike())
        {
            Outer.CrabPawn.ClawRightSetToStrikeDoneWith();
        }
        // End:0x123
        if(Outer.CrabPawn.DidTheLeftClawJustStartStrike())
        {
            Outer.CrabPawn.ClawLeftSetToStrikeDoneWith();
        }
    }
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], PawnHit;

    // End:0xF2
    if(!Outer.bStruckVsWithClawWhileVsWasBlocking && LPPawn(Info.Impact.HitActor) != none)
    {
        PawnHit = LPPawn(Info.Impact.HitActor);
        // End:0xF2
        if(PawnHit.IsDoingSpecialMove(Class'LPSM_VSShieldBlock'))
        {
            Outer.bStruckVsWithClawWhileVsWasBlocking = true;
        }
    }
    //return;    
}

function On_LPSM_SnowCrabAttackVS_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bStrikeFinished = true;
    //return;    
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
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ExitStrike();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ExitStrike();
        //return;        
    }

    function ExitStrike()
    {
        Outer.MeleeFinished();
        //return;        
    }

    event HandleDismemberment()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
        local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StartMeleeVs()
    {
        TimeClawStrikeStarted = Outer.WorldInfo.TimeSeconds;
        // End:0xD0
        if(Outer.CrabPawn.DidTheRightClawJustStartStrike())
        {
            Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackVS', true, false, On_LPSM_SnowCrabAttackVS_Finished, EnemyForStrike);            
        }
        else
        {
            // End:0x163
            if(Outer.CrabPawn.DidTheLeftClawJustStartStrike())
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackVSLeftClaw', true, false, On_LPSM_SnowCrabAttackVS_Finished, EnemyForStrike);                
            }
            else
            {
                bStrikeFinished = true;
            }
        }
        //return;        
    }

    function IsClawStrikeDone()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeInStrike;

        // End:0x0F
        if(bStrikeFinished)
        {
            return true;
        }
        timeInStrike = Outer.WorldInfo.TimeSeconds - TimeClawStrikeStarted;
        // End:0xC5
        if(timeInStrike > Outer.CrabPawn.TuneDataIceCrab.MaxTimeToWaitForClawStrikeToFinish_Tunable.GetValue())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = EnemyForStrike;
    // End:0xA2
    if(Outer.DetermineWhichClawToAttackWith())
    {
        StartMeleeVs();
        J0x54:

        // End:0x83 [Loop If]
        if(!IsClawStrikeDone())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x54;
        }
        Outer.MeleeFinished();
    }
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}