class LPAICmd_NushiSporeStalkLaunchSpore extends LPAICmd_DefenderHiveLaunchDefenders within LPAIControllerNushiSporeStalk;

function Pushed()
{
    super.Pushed();
    TimeLastSpecialMoveStarted = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function NotifyAnimReadyToLaunchDefenders()
{
    NumToLaunchThisEvolution = Outer.NushiSporeStalkPawn.IntendedDefendersLaunched.Length;
    J0x3E:

    // End:0x62 [Loop If]
    if(NumLaunchedSoFarThisEvolution < NumToLaunchThisEvolution)
    {
        LaunchDefender();
        // [Loop Continue]
        goto J0x3E;
    }
    Outer.NushiSporeStalkPawn.IntendedDefendersLaunched.Length = 0;
    Outer.NotifyOfDoneLaunchingDefendersForThisEvolution();
    //return;    
}

function On_LaunchSpore_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentLaunchDefendersState = 0;
    //return;    
}

function IsDoneWithThisLaunchState()
{
    local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x32
    if(int(Outer.CurrentLaunchDefendersState) != int(StateToTest))
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

state StateCmdActive
{
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
Begin:

    NumToTryAndSpawnThisEvolution = 1;
SpawningDefenders:


    Outer.CurrentLaunchDefendersState = 4;
    J0x2C:

    // End:0x6D [Loop If]
    if(NumAtteptedToSpawnSoFarThisEvolution < NumToTryAndSpawnThisEvolution)
    {
        SpawnDefender();
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x2C;
    }
    goto 'LaunchSpore';
LaunchSpore:


    Outer.CurrentLaunchDefendersState = 4;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.NushiSporeStalkPawn.DoSpecialMove(Class'LPSM_NushiSporeStalkLaunchSpore', true, true, On_LaunchSpore_Finished);
    J0x126:

    // End:0x15C [Loop If]
    if(!IsDoneWithThisLaunchState(4, 2.0000000))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x126;
    }
    goto 'EndCommand';
EndCommand:


    Outer.PopCommand(self);
    stop;        
}
