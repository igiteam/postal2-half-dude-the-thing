class LPMenuGamePRI extends LPPRI
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int MetagamePercent[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int TotalPlayTime[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPTypes.PlayerVoiceStatus VoiceStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MPPlayerInfoChangedDelegates;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnMPPlayerInfoChanged__Delegate;

delegate OnMPPlayerInfoChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChangedPRI[8388609];

    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x6C
    if((((VarName == 'MetagamePercent') || VarName == 'TotalPlayTime') || VarName == 'VoiceStatus') || VarName == 'MP_CreditsEarned')
    {
        ExecOnMPPlayerInfoChanged();
    }
    super.ReplicatedEvent(VarName);
    //return;    
}

simulated function ClientInitialize()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];

    super.ClientInitialize(C);
    SetVoiceStatus(2);
    //return;    
}

simulated function SetVoiceStatus()
{
    local /*0x97E50000-0x00000000*/ private byte Status[8388609];

    VoiceStatus = Status;
    //return;    
}

simulated function SetMetagamePercent()
{
    local /*0x97E50000-0x00000000*/ private float Value[8388609];

    // End:0x38
    if(Value != float(MetagamePercent))
    {
        MetagamePercent = int(Value);
        ExecOnMPPlayerInfoChanged();
    }
    //return;    
}

simulated function SetTotalPlayTime()
{
    local /*0x97E50000-0x00000000*/ private int Seconds[8388609];

    // End:0x34
    if(TotalPlayTime != Seconds)
    {
        TotalPlayTime = Seconds;
        ExecOnMPPlayerInfoChanged();
    }
    //return;    
}

simulated function GetTotalPlayTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return float(TotalPlayTime);
    //return ReturnValue;    
}

reliable server function ServerSetMPPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];
    local /*0x97E50000-0x00000000*/ private int Playtime[8388609];

    SetMPPlayerInfo(int(Progress), Playtime);
    //return;    
}

simulated function UpdateMPPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private int Percent, Playtime;

    Percent = ((MetagameManager == none) ? 0 : MetagameManager.GetMetagameRank());
    Playtime = ((StatManager == none) ? 0 : StatManager.EvalStat('Stat_TotalPlaytime'));
    // End:0xDE
    if(StatManager != none)
    {
        StatManager.GetStat('Stat_CreditsCurrent').AddOnStatModifiedDelegate(OnCreditsModified);
    }
    SetMPPlayerInfo(Percent, Playtime);
    //return;    
}

simulated function SetMPPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private int Percent[8388609], Playtime;

    SetMetagamePercent(float(Percent));
    SetTotalPlayTime(Playtime);
    // End:0x5A
    if(int(Role) != int(ROLE_Authority))
    {
        ServerSetMPPlayerInfo(float(Percent), Playtime);
    }
    //return;    
}

simulated function ExecOnMPPlayerInfoChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2C
    foreach MPPlayerInfoChangedDelegates(Del)
    {
        OnMPPlayerInfoChanged(self);        
    }    
    //return;    
}

simulated function AddMPPlayerInfoChangedDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del[8388609];

    // End:0x32
    if(MPPlayerInfoChangedDelegates.Find(Del) < )
    {        
        MPPlayerInfoChangedDelegates.AddItem(Del);        
    }
    //return;    
}

simulated function OnCreditsModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];

    ExecOnMPPlayerInfoChanged();
    //return;    
}

static function ConvertPRIPing()
{
    local /*0x97E50000-0x00000000*/ private byte inPing[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float FullPing;

    FullPing = FMin(float(inPing) * float(4), 300.0000000);
    // End:0x46
    if(FullPing <= float(60))
    {
        FullPing = 5.0000000;        
    }
    else
    {
        // End:0x6A
        if(FullPing <= float(100))
        {
            FullPing = 4.0000000;            
        }
        else
        {
            // End:0x8E
            if(FullPing <= float(150))
            {
                FullPing = 3.0000000;                
            }
            else
            {
                // End:0xB2
                if(FullPing <= float(250))
                {
                    FullPing = 2.0000000;                    
                }
                else
                {
                    FullPing = 1.0000000;
                }
            }
        }
    }
    return int(FullPing);
    //return ReturnValue;    
}

defaultproperties
{
    VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Disabled
}