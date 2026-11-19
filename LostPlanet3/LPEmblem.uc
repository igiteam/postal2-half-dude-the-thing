class LPEmblem extends LPAward;

function InitAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL AwardMgr[8388609];
    local /*0x97E50000-0x00000000*/ private int AwardIdx[8388609];

    super.InitAward(AwardMgr, AwardIdx);
    AddStatDefinitions();
    AddOnStatsInitDelegate();
    //return;    
}

function GiveAward()
{
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer;
    local /*0x97E50000-0x00000000*/ private int CreditsAdded;
    local /*0x97E50000-0x00000000*/ private @NULL MyPRI;

    super.GiveAward();
    // End:0x21D
    if(AwardManager.MyPC != none)
    {
        MyPRI = LPPRI(AwardManager.MyPC.PlayerReplicationInfo);
        // End:0x21D
        if(MyPRI != none)
        {
            bIsLocalPlayer = AwardManager.MyPC.IsLocalPlayerController();
            CreditsAdded = MyPRI.AddMPCreditsEarned(GetAdjustedCredits(), false);
            // End:0x142
            if(bIsLocalPlayer)
            {
                AwardManager.MyPC.ShowAward(self, CreditsAdded);
            }
            AwardManager.StatManager.IncrementStat(GetAwardName());
            AwardManager.StatManager.ModifyStat(GetTotalCreditsStatName(), CreditsAdded);
            // End:0x21D
            if(bIsLocalPlayer)
            {
                AwardManager.MyPC.AddAwardToMatchData(GetAwardName(), 1, CreditsAdded);
            }
        }
    }
    //return;    
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

function AddOnStatsInitDelegate()
{
    AwardManager.StatManager.super(LPEmblem).AddOnStatsInitDelegate(AddStatModifiedDelegate);
    //return;    
}

function AddStatModifiedDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat;
    local /*0x97E50000-0x00000000*/ private name StatName;

    StatName = GetAwardDefinition().RequiredStatName;
    // End:0xC7
    if(StatName != 'None')
    {
        Stat = AwardManager.StatManager.GetStat(StatName);
        // End:0xC7
        if(Stat != none)
        {
            Stat.AddOnStatModifiedDelegate(OnStatModified);            
        }
    }
    //return;    
}

function OnStatModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];
    local /*0x97E50000-0x00000000*/ private int PrevVal, CurVal, TestVal, RequiredCount;

    // End:0xE2
    if(int(ModType) == int(0))
    {
        CurVal = Stat.Evaluate(0);
        PrevVal = CurVal - ChangedVal;
        // End:0xE2
        if(ChangedVal > 0)
        {
            RequiredCount = Max(GetRequiredCount(), 1);
            TestVal = PrevVal + 1;
            J0x99:

            // End:0xE2 [Loop If]
            if(TestVal <= CurVal)
            {
                // End:0xD4
                if((TestVal % RequiredCount) == 0)
                {
                    GiveAward();
                }
                TestVal++;
                // [Loop Continue]
                goto J0x99;
            }
        }
    }
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
