class GameReplicationInfo extends ReplicationInfo
    nativereplication
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private travel class GameClass[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bStopCountDown[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bMatchHasBegun[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bMatchIsOver[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldReplicateRemainingSeconds;
var(*) /*0x35EA0000-0x00000000*/ private int RemainingTime[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int ElapsedTime[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int RemainingMinute[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int GoalScore[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int TimeLimit[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Teams;
var(*) /*0x25700000-0x00000000*/ private editfixedsize input string ServerName[1075904513];
var(*) /*0x35EA0000-0x00000000*/ private Actor Winner[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PRIArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InactivePRIArray;

simulated event PostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI, TI;

    // End:0x35
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        ServerName = "";
    }
    SetTimer(WorldInfo.TimeDilation, true);
    WorldInfo.SetGRI(self);
    // End:0xA6
    foreach DynamicActors(Class'PlayerReplicationInfo', PRI)
    {
        AddPRI(PRI);        
    }    
    // End:0x116
    foreach DynamicActors(Class'TeamInfo', TI)
    {
        // End:0x115
        if(TI.TeamIndex >= 0)
        {
            SetTeam(TI.TeamIndex, TI);
        }        
    }    
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x49
    if(VarName == 'bMatchHasBegun')
    {
        // End:0x46
        if(bMatchHasBegun)
        {
            WorldInfo.NotifyMatchStarted();
        }        
    }
    else
    {
        // End:0x7A
        if(VarName == 'bMatchIsOver')
        {
            // End:0x77
            if(bMatchIsOver)
            {
                EndGame();
            }            
        }
        else
        {
            // End:0x9E
            if(VarName == 'GameClass')
            {
                ReceivedGameClass();                
            }
            else
            {
                super(Actor).ReplicatedEvent(VarName);
            }
        }
    }
    //return;    
}

simulated function ReceivedGameClass()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    UpdateStreamingPauseCachedReplicatedGameClass();
    // End:0x52
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        PC.ReceivedGameClass(GameClass);        
    }    
    //return;    
}

// Export UGameReplicationInfo::execUpdateStreamingPauseCachedReplicatedGameClass(FFrame&, void* const)
native final simulated function UpdateStreamingPauseCachedReplicatedGameClass();

function Reset()
{
    super(Actor).Reset();
    Winner = none;
    //return;    
}

simulated event Timer()
{
    // End:0x68
    if((WorldInfo.Game == none) || WorldInfo.Game.MatchIsInProgress())
    {
        ElapsedTime++;
    }
    // End:0xCC
    if(bShouldReplicateRemainingSeconds)
    {
        // End:0xC9
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            // End:0xC9
            if((RemainingTime > 0) && !bStopCountDown)
            {
                RemainingTime--;
            }
        }        
    }
    else
    {
        // End:0x122
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            // End:0x122
            if(RemainingMinute != 0)
            {
                RemainingTime = RemainingMinute;
                RemainingMinute = 0;
            }
        }
        // End:0x19C
        if((RemainingTime > 0) && !bStopCountDown)
        {
            RemainingTime--;
            // End:0x19C
            if(int(WorldInfo.NetMode) != int(NM_Client))
            {
                // End:0x19C
                if((RemainingTime % 60) == 0)
                {
                    RemainingMinute = RemainingTime;
                }
            }
        }
    }
    SetTimer(WorldInfo.TimeDilation, true);
    //return;    
}

// Export UGameReplicationInfo::execOnSameTeam(FFrame&, void* const)
native simulated function OnSameTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function AddPRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x99
    if(!PRI.bIsInactive)
    {
        I = 0;
        J0x2F:

        // End:0x78 [Loop If]
        if(I < PRIArray.Length)
        {
            // End:0x6A
            if(PRIArray[I] == PRI)
            {
                return;
            }
            I++;
            // [Loop Continue]
            goto J0x2F;
        }
        PRIArray[PRIArray.Length] = PRI;        
    }
    else
    {
        // End:0xD7
        if(InactivePRIArray.Find(PRI) == )
        {            
            InactivePRIArray[InactivePRIArray.Length] = PRI;
        }
    }
    //return;    
}

simulated function RemovePRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x69 [Loop If]
    if(I < PRIArray.Length)
    {
        // End:0x5B
        if(PRIArray[I] == PRI)
        {
            PRIArray.Remove(I, 1);            
            return;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function SetTeam()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL TI[8388609];

    // End:0x2C
    if(Index >= 0)
    {
        Teams[Index] = TI;
    }
    //return;    
}

simulated function StartMatch()
{
    bMatchHasBegun = true;
    //return;    
}

simulated function EndGame()
{
    bMatchIsOver = true;
    //return;    
}

simulated function IsMultiplayerGame()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(WorldInfo.NetMode) != int(NM_Standalone);
    //return ReturnValue;    
}

simulated function IsCoopMultiplayerGame()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event ShouldShowGore()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bStopCountDown=true
    TickGroup=ETickingGroup.TG_DuringAsyncWork
}