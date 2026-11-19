class LPGameInfo extends SPGameSP_Base
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

enum ELPTeams
{
    LPTeam_Nevec,                   // 0
    LPTeam_Pirates,                 // 1
    LPTeam_Akrid,                   // 2
    LPTeam_Neutral,                 // 3
    LPTeam_MAX                      // 4
};

struct native TeamNameContainer
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TeamName;

    structdefaultproperties
    {
        TeamName=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TeamNameList[1073741825];

function AllowCheats()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AtCapacity()
{
    local /*0x97E50000-0x00000000*/ private bool bSpectator[8388609], ReturnValue;

    return false;
    //return ReturnValue;    
}

event PostLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];

    super.PostLogin(NewPlayer);
    //return;    
}

function InitGameReplicationInfo()
{
    super(SPGameInfo).InitGameReplicationInfo();
    LPGRI(GetGRI()).InitServerDLCInfos();
    //return;    
}

function InitializeTeams()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x284 [Loop If]
    if(Idx < int(NumTeams))
    {
        Teams[Idx] = Spawn(Class'LPTeamInfo', self);
        Teams[Idx].TeamIndex = Idx;
        Teams[Idx].SetTeamName(Class'SPEngine.SPUtil'.static.GetLocalizedString(TeamNameList[Idx].TeamName));
        // End:0x23B
        if(TeamNameList[Idx].TeamName == "")
        {
            switch(Teams[Idx].TeamIndex)
            {
                // End:0x188
                case 0:
                    Teams[Idx].SetTeamName("NEVEC");
                    // End:0x23B
                    break;
                // End:0x1C6
                case 1:
                    Teams[Idx].SetTeamName("SNOW PIRATES");
                    // End:0x23B
                    break;
                // End:0x1FE
                case 2:
                    Teams[Idx].SetTeamName("AKRID");
                    // End:0x23B
                    break;
                // End:0x238
                case 3:
                    Teams[Idx].SetTeamName("NEUTRAL");
                    // End:0x23B
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            GameReplicationInfo.SetTeam(Idx, Teams[Idx]);
            Idx++;
            // [Loop Continue]
            goto J0x0B;
        }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x23B! */
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x00B! */
}

function PickTeam()
{
    local /*0x97E50000-0x00000000*/ private byte Current[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x17
    if(int(Current) == int(255))
    {
        return 1;
    }
    return Current;
    //return ReturnValue;    
}

function RestartPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];

    super(SPGameInfo).RestartPlayer(NewPlayer);
    // End:0x9B
    if(NewPlayer.PlayerReplicationInfo != none)
    {
        LPPRI(NewPlayer.PlayerReplicationInfo).PerksManager.SetController(LPPlayerController(NewPlayer));
    }
    //return;    
}

function BroadcastHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix[142606337], MessageBodyPostfix, ObjectiveName;
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL B;

    B = LPBroadcastHandler(BroadcastHandler);
    // End:0x80
    if(B != none)
    {
        B.BroadcastHUDMessage(TeamIndex, MessageBodyPrefix, MessageBodyPostfix, ObjectiveName, PRI1, fDisplayTime);
    }
    //return;    
}

function BroadcastObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrimary[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL B;

    B = LPBroadcastHandler(BroadcastHandler);
    // End:0x8A
    if(B != none)
    {
        B.BroadcastObjectiveMessage(TeamIndex, EventName, ObjectiveName, ObjectiveType, bPrimary, PRI1, fDisplayTime);
    }
    //return;    
}

function ChangeTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNewTeam[8388609], ReturnValue;

    // End:0x23
    if(LPPlayerController(Other) != none)
    {
        N = 1;
    }
    return super(SPGameInfo).ChangeTeam(Other, N, bNewTeam);
    //return ReturnValue;    
}

event PreCommitMapChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PreviousMapName[8388609], NextMapName;
    local /*0x97E50000-0x00000000*/ private @NULL ExtraParams[9437185];

    super.PreCommitMapChange(PreviousMapName, NextMapName, ExtraParams);
    //return;    
}

event PostCommitMapChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExtraParams[9437185];

    super.PostCommitMapChange(ExtraParams);
    //return;    
}

function ShouldAllowDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609], Damagee;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

auto state PendingMatch
{Begin:

    StartMatch();
    stop;                
}

defaultproperties
{
    TeamNameList=/* Array type was not detected. */
    NumTeams=4
    // Reference: SPAIVisibilityManager'Default__LPGameInfo.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    DefaultWeaponClass=Class'LPWeapon'
    bUsePackageNetInfo=false
    DefaultPawnClass=Class'LPPawn'
    HUDType=Class'LPHUD'
    AccessControlClass=Class'LPAccessControl'
    BroadcastHandlerClass=Class'LPBroadcastHandler'
    AutoTestManagerClass=Class'LPAutoTestManager'
    PlayerControllerClass=Class'LPPlayerController'
    PlayerReplicationInfoClass=Class'LPPRI'
    GameReplicationInfoClass=Class'LPGRI'
    PopulationManagerClass=Class'LPGameCrowdPopulationManager'
    BusyIndicators[1]=(Material=Material'HUD.loadingRing',EdgeOffsetY=0.3000000)
    BusyIndicators[2]=(Material=Material'HUD.saveWheel',EdgeOffsetY=0.3000000)
}