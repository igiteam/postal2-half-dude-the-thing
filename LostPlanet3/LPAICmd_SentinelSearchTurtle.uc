class LPAICmd_SentinelSearchTurtle extends LPAICommand within LPAIControllerSentinel;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SearchAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySentPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTurtleLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SearchResource;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSquadAlerted;

function Pushed()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    super.Pushed();
    MySentPawn = LPAIPawnSentinelAdroit(Outer.Pawn);
    // End:0x105
    foreach Outer.LocalPlayerControllers(Class'LPPlayerController', PC)
    {
        // End:0x104
        if(PC.Pawn != none)
        {
            SearchResource = LPAIResSentinelSearch(LPPlayerPawn(PC.MySPPawn).AIResourceManager.GetResource('SentinelStealthSearch'));
            // End:0x105
            break;
        }        
    }    
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetResourceAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0xF3
    foreach Outer.LocalPlayerControllers(Class'LPPlayerController', PC)
    {
        // End:0xF2
        if(PC.Pawn != none)
        {
            // End:0x6A
            if(SearchAccess != none)
            {                
            }
            else
            {
                SearchAccess = LPPlayerPawn(PC.MySPPawn).AIResourceManager.GetAccess('SentinelStealthSearch', Outer.myAIPawn);
            }
            // End:0xF3
            break;
        }        
    }    
    return SearchAccess != none;
    //return ReturnValue;    
}

function CanGetAccessToResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC, MyResource;

    // End:0x112
    foreach Outer.LocalPlayerControllers(Class'LPPlayerController', PC)
    {
        // End:0x111
        if(PC.Pawn != none)
        {
            MyResource = LPPlayerPawn(PC.MySPPawn).AIResourceManager.GetResource('SentinelStealthSearch');
            // End:0x10E
            if(MyResource != none)
            {                
                return MyResource.NumUsers() < MyResource.GetMaxUsers();
            }
            // End:0x112
            break;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function On_LPSM_GoingIntoTurtle_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTurtleState = 3;
    //return;    
}

function On_LPSM_ComingOutOfTurtle_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTurtleState = 6;
    //return;    
}

function On_LPSM_SearchFoundTarget_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, LPAIC;

    MySentPawn.HeadTrackComponent.LookInfo.Mode = 0;
    // End:0x95
    if(SearchResource != none)
    {
        SearchResource.RemoveAccessForUser(Outer.myAIPawn);
    }
    SearchAccess = none;
    // End:0xD5
    if(Outer.Enemy == none)
    {
        GotoState('Turtle');        
    }
    else
    {
        // End:0x1CF
        if(!bSquadAlerted)
        {
            // End:0x1CB
            foreach Outer.Squad.AllMembers(Class'LPAIControllerSentinel', LPAIC)
            {
                // End:0x19B
                if(LPAICmd_SentinelSearchTurtle(LPAIC.GetActiveCommand()) != none)
                {
                    LPAICmd_SentinelSearchTurtle(LPAIC.GetActiveCommand()).bSquadAlerted = true;
                }
                Outer.bFinishedSearch = false;
                GotoState('FoundEnemy');                
            }                        
        }
        else
        {
            GotoState('Turtle');
        }
    }
    //return;    
}

function On_LPSM_SearchAttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, LPAIC;

    // End:0x169
    if((Outer.Squad != none) && !bSquadAlerted)
    {
        // End:0x168
        foreach Outer.Squad.AllMembers(Class'LPAIControllerSentinel', LPAIC)
        {
            // End:0x167
            if(MyController != LPAIC)
            {
                LPAIC.SetEnemy(MyController.Enemy);
                // End:0x167
                if((int(LPAIC.CurrentTurtleState) == int(6)) || int(LPAIC.CurrentTurtleState) == int(0))
                {
                    LPAIC.bFinishedSearch = true;
                    LPAIC.PopCommand(self);
                }
            }            
        }        
    }
    Outer.bFinishedSearch = true;
    Outer.PopCommand(self);
    //return;    
}

function FinishTurtleLoopSpecialMove()
{
    Outer.SentinelPawn.EndSpecialMove(Class'LPSM_SentinelTurtleLoop');
    Outer.CurrentTurtleState = 4;
    //return;    
}

function GoIntoTurtle()
{
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelGoingIntoTurtle', true, true, On_LPSM_GoingIntoTurtle_Finished);
    //return;    
}

state StateCmdActive
{Begin:

    // End:0x79
    if(!Outer.bFinishedSearch && Outer.Enemy == none)
    {
        // End:0x68
        if(GetResourceAccess())
        {
            GotoState('Search');            
        }
        else
        {
            GotoState('Turtle');
        }        
    }
    else
    {
        // End:0xBE
        if(Outer.Enemy != none)
        {
            Outer.bFinishedSearch = true;
        }
        Outer.PopCommand(self);
    }
    stop;        
}

state Search
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.myAIPawn.DoSpecialMove(Class'LPSM_SentinelSearch', true, false, On_LPSM_SearchFoundTarget_Finished);
    stop;            
}

state FoundEnemy
{Begin:

    bSquadAlerted = true;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_SentinelAttackAnnounce', true, false, On_LPSM_SearchAttackAnnounce_Finished);
    stop;            
}

state Turtle
{
    function IsDoneWithThisState()
    {
        local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x32
        if(int(Outer.CurrentTurtleState) != int(StateToTest))
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
GoingIntoTurtle:

    Outer.CurrentTurtleState = 1;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    GoIntoTurtle();
    J0x68:

    // End:0xF7 [Loop If]
    if(!IsDoneWithThisState(1, Outer.SentinelPawn.TuneDataSentinel.MaxTimeForGoingIntoTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x68;
    }
LoopingTurtle:


    DurationOfTurtleLoop = 0.0000000;
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelTurtleLoop', true, true);
    Outer.Sleep(RandRange(1.0000000, 3.0000000));
    J0x173:

    // End:0x1C8 [Loop If]
    if(!GetResourceAccess() && Outer.Enemy == none)
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x173;
    }
    // End:0x21B
    if(Outer.Enemy != none)
    {
        Outer.Sleep(RandRange(0.0000000, 1.0000000));        
    }
    else
    {
        Outer.Sleep(RandRange(1.0000000, 3.0000000));
    }
    FinishTurtleLoopSpecialMove();
CommingOutOfTurtle:


    Outer.CurrentTurtleState = 5;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelComingOutOfTurtle', true, true, On_LPSM_ComingOutOfTurtle_Finished);
    J0x33D:

    // End:0x3CC [Loop If]
    if(!IsDoneWithThisState(5, Outer.SentinelPawn.TuneDataSentinel.MaxTimeForCommingOutOfTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x33D;
    }
    goto 'EndCommand';
EndCommand:


    Outer.Sleep(0.0100000);
    // End:0x45B
    if(Outer.Enemy != none)
    {
        Outer.bFinishedSearch = true;
        Outer.PopCommand(self);        
    }
    else
    {
        GotoState('StateCmdActive');
    }
    stop;            
}
