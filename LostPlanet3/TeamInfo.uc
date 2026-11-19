class TeamInfo extends ReplicationInfo
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TeamName;
var(*) /*0x35EA0000-0x00000000*/ private int Size;
var(*) /*0x35EA0000-0x00000000*/ private float Score[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel int TeamIndex[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TeamColor;

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x7C
    if(VarName == 'TeamIndex')
    {
        // End:0x79
        if(WorldInfo.GRI != none)
        {
            WorldInfo.GRI.SetTeam(TeamIndex, self);
        }        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event Destroyed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OtherTeam;

    super(Actor).Destroyed();
    // End:0xCF
    if(WorldInfo.GRI != none)
    {
        // End:0xCE
        foreach DynamicActors(Class'TeamInfo', OtherTeam)
        {
            // End:0xCD
            if((OtherTeam != self) && OtherTeam.TeamIndex == TeamIndex)
            {
                WorldInfo.GRI.SetTeam(TeamIndex, OtherTeam);
                // End:0xCE
                break;
            }            
        }        
    }
    //return;    
}

function AddToTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Other == none)
    {
        return false;
    }
    // End:0x41
    if(Other.PlayerReplicationInfo == none)
    {
        ScriptTrace();
        return false;
    }
    Size++;
    Other.PlayerReplicationInfo.SetPlayerTeam(self);
    return true;
    //return ReturnValue;    
}

function RemoveFromTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    Size--;
    // End:0x75
    if((Other != none) && Other.PlayerReplicationInfo != none)
    {
        Other.PlayerReplicationInfo.SetPlayerTeam(none);
    }
    //return;    
}

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return TeamName;
    //return ReturnValue;    
}

// Export UTeamInfo::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

defaultproperties
{
    TeamName="Team"
    TeamIndex=-1
    TeamColor=(R=255,G=64,B=64,A=255)
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    NetUpdateFrequency=2.0000000
}