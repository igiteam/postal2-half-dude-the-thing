class LPTeamInfo_MP extends LPTeamInfo
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxTeamLives[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int TeamLives[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTeamLives[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttackingTeam[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDualAttackers[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEngExtractionAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamCredits[2097153];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x4C
    if(VarName == 'TeamIndex')
    {
        TeamColor = Class'LPGameMP_Base'.static.GetTeamColor(TeamIndex);        
    }
    else
    {
        // End:0x6D
        if(VarName == 'TeamLives')
        {
            UpdateRespawnCounters();
        }
    }
    super(TeamInfo).ReplicatedEvent(VarName);
    //return;    
}

function ResetGame()
{
    TeamLives = MaxTeamLives;
    TEngExtractionAccumulator = 0.0000000;
    TeamCredits = 0;
    //return;    
}

simulated function GetRemainingLives()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x15
    if(!bUseTeamLives)
    {
        return -1;
    }
    return TeamLives;
    //return ReturnValue;    
}

simulated function UpdateRespawnCounters()
{
    local /*0x97E50000-0x00000000*/ private @NULL C;

    // End:0xE5
    if(TeamLives == 0)
    {
        // End:0xE4
        foreach WorldInfo.AllControllers(Class'LPPlayerController', C)
        {
            // End:0xE3
            if(C.IsLocalController() && C.myLPHUD != none)
            {
                C.MinRespawnDelay = 0.0000000;
                C.myLPHUD.RemoveRespawnInfo();
            }            
        }        
    }
    //return;    
}

function AccumulateTEnergyExtractionForScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];
    local /*0x97E50000-0x00000000*/ private float EnergyAmount[8388609], Integral;
    local /*0x97E50000-0x00000000*/ private bool bCheck;

    // End:0x240
    if(int(Role) >= int(ROLE_Authority))
    {
        // End:0x240
        if(EnergyAmount > float(0))
        {
            TEngExtractionAccumulator += EnergyAmount;
            // End:0x240
            if((TEngExtractionAccumulator + 0.0001000) >= float(1))
            {
                TEngExtractionAccumulator += 0.0001000;
                Integral = float(FFloor(TEngExtractionAccumulator));
                TEngExtractionAccumulator -= Integral;
                // End:0x240
                if(LPC.PlayerReplicationInfo != none)
                {
                    // End:0x157
                    if(LPGameMP_Base(WorldInfo.Game).bThermalExtractionAccumulateTeamScore)
                    {
                        LPC.PlayerReplicationInfo.Team.Score += Integral;
                        bCheck = true;
                    }
                    // End:0x1E1
                    if(LPGameMP_Base(WorldInfo.Game).bThermalExtractionAccumulateScore)
                    {
                        LPC.PlayerReplicationInfo.Score += Integral;
                        bCheck = true;
                    }
                    // End:0x240
                    if(bCheck)
                    {
                        WorldInfo.Game.CheckScore(LPC.PlayerReplicationInfo);
                    }
                }
            }
        }
    }
    //return;    
}

final function GetAliveAndWellTeamMembers()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, Num;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    I = 0;
    J0x0B:

    // End:0x123 [Loop If]
    if(I < TeamMembers.Length)
    {
        // End:0x115
        if(((TeamMembers[I] != none) && TeamMembers[I].Pawn != none) && !TeamMembers[I].IsDead())
        {
            LPP = LPPlayerPawn(TeamMembers[I].Pawn);
            // End:0x115
            if((LPP != none) && LPP.IsAliveAndWell())
            {
                Num++;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return Num;
    //return ReturnValue;    
}

defaultproperties
{
    MaxTeamLives=-1
    TeamLives=-1
}