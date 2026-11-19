class LPAICmd_CrabTauntSimple extends LPAICmd_Attack within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTauntLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TauntTypePerforming[536870913];

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Simple Taunt";
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    //return;    
}

function On_LPSM_SnowCrabTauntRaise_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 4;
    //return;    
}

function OnLPSM_SnowCrabTauntLower_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 7;
    //return;    
}

function OnLPSM_LPSM_SnowCrabTauntAttack_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 9;
    //return;    
}

function FinishTauntLoopSpecialMove()
{
    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabTauntLoop');
    Outer.CurrentTauntState = 5;
    //return;    
}

function RaiseIntoTaunt()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntRaise', true, true, On_LPSM_SnowCrabTauntRaise_Finished);
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
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function IsDoneWithThisState()
    {
        local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x32
        if(int(Outer.CurrentTauntState) != int(StateToTest))
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x93
        if(durationOfAction > MaxDurationOfState)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function ShouldTurn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

        RelativeDirection = EnemyForAttack.Location - Outer.myAIPawn.Location;
        RelativeDirection.Z = 0.0000000;
        RelativeDirection = Normal(RelativeDirection);
        MyFacing = Vector(Outer.myAIPawn.Rotation);
        // End:0xF6
        if((MyFacing Dot RelativeDirection) < 0.7071000)
        {
            return true;            
        }
        else
        {
            return false;
        }
        //return ReturnValue;        
    }
Begin:

    // End:0x59
    if(ShouldTurn())
    {
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(1);
    }
    Outer.Sleep(0.0000000);
    // End:0x4DF
    if(Outer.CrabPawn.TimeForSimpleTaunt < Outer.CrabPawn.WorldInfo.TimeSeconds)
    {
        SetInterruptible(false);
        Outer.CurrentTauntState = 2;
        RaiseIntoTaunt();
        J0x12D:

        // End:0x1BC [Loop If]
        if(!IsDoneWithThisState(2, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForRaiseIntoTaunt_Tunable.GetValue()))
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x12D;
        }
        DurationOfTauntLoop = 1.0000000;
        TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLoop', true, true);
        J0x249:

        // End:0x283 [Loop If]
        if(!IsDoneWithThisState(4, DurationOfTauntLoop))
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x249;
        }
        FinishTauntLoopSpecialMove();
        Outer.CurrentTauntState = 6;
        TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLower', true, true, OnLPSM_SnowCrabTauntLower_Finished);
        J0x33C:

        // End:0x3CB [Loop If]
        if(!IsDoneWithThisState(6, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForLoweringOutOfTaunt_Tunable.GetValue()))
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x33C;
        }
        SetInterruptible(true);
        // End:0x430
        if(ShouldTurn())
        {
            Outer.Focus = EnemyForAttack;
            Outer.CmdTurnToFaceFocus(1);
        }
        Outer.Sleep(0.0000000);
        Outer.CrabPawn.TimeForSimpleTaunt = Outer.CrabPawn.WorldInfo.TimeSeconds + RandRange(4.0000000, 9.0000000);
    }
    Outer.Focus = none;
    Outer.PopCommand(self);
    stop;                    
}
