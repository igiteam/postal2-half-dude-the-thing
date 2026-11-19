class LPCommendation extends LPAward;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultCompareValue;

function InitAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL AwardMgr[8388609];
    local /*0x97E50000-0x00000000*/ private int AwardIdx[8388609];

    super.InitAward(AwardMgr, AwardIdx);
    AddStatDefinitions();
    //return;    
}

function GiveAward()
{
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer;
    local /*0x97E50000-0x00000000*/ private int CreditsAdded;
    local /*0x97E50000-0x00000000*/ private @NULL MyPRI;

    // End:0x1C8
    if(AwardManager.MyPC != none)
    {
        MyPRI = LPPRI(AwardManager.MyPC.PlayerReplicationInfo);
        // End:0x1C8
        if(MyPRI != none)
        {
            bIsLocalPlayer = AwardManager.MyPC.IsLocalPlayerController();
            CreditsAdded = MyPRI.AddMPCreditsEarned(GetAdjustedCredits(), false);
            AwardManager.StatManager.IncrementStat(GetAwardName());
            AwardManager.StatManager.ModifyStat(GetTotalCreditsStatName(), CreditsAdded);
            // End:0x1C8
            if(bIsLocalPlayer)
            {
                AwardManager.MyPC.AddAwardToMatchData(GetAwardName(), 1, CreditsAdded);
            }
        }
    }
    //return;    
}

function HandleCommendation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array CommendList;
    local /*0x97E50000-0x00000000*/ private float NewValue, CurValue;

    CurValue = DefaultCompareValue;
    // End:0xE7
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPPC)
    {
        NewValue = GetCommendationValueForPlayer(LPPC);
        // End:0xB9
        if(CompareCommendationValues(NewValue, CurValue))
        {
            CommendList.Length = 0;
            CurValue = NewValue;
        }
        // End:0xE6
        if(NewValue == CurValue)
        {
            CommendList.AddItem(LPPC);            
        }        
    }    
    // End:0x141
    if(CurValue != DefaultCompareValue)
    {
        // End:0x140
        foreach CommendList(LPPC)
        {
            LPPC.ServerGiveAward(GetAwardName());            
        }        
    }
    //return;    
}

function CompareCommendationValues()
{
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], CurValue;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return NewValue > CurValue;
    //return ReturnValue;    
}

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function AddStatDefinitions()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL StatDef;

    StatDef.StatName = GetAwardName();
    AwardManager.StatManager.AddStatDefinition(StatDef);
    StatDef.StatName = GetTotalCreditsStatName();
    AwardManager.StatManager.AddStatDefinition(StatDef);
    //return;    
}

function GetTimesAwardedStat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AwardManager.StatManager.GetStat(GetAwardName());
    //return ReturnValue;    
}

function GetTotalCreditsStat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AwardManager.StatManager.GetStat(GetTotalCreditsStatName());
    //return ReturnValue;    
}

function GetTotalCreditsStatName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return name(string(GetAwardName()) $ "_Credits");
    //return ReturnValue;    
}

defaultproperties
{
    AwardTypeIconName="commendation"
}