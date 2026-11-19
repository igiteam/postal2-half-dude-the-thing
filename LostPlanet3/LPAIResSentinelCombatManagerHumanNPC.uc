class LPAIResSentinelCombatManagerHumanNPC extends LPAIResSentinelCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x28D
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        HowOfftenToUpdateTheManager = ThePawn.TuneDataHumanSoldier.HowOfftenToUpdateTheSentinelCombatManager;
        HowOfftenToCleanOutOldOptions = ThePawn.TuneDataHumanSoldier.HowOfftenToRemoveOutOfDataAttackOptionsInTheSentinelCombatManager;
        iter = 0;
        J0xD6:

        // End:0x1AC [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.SentinelStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.SentinelStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0xD6;
        }
        iter = 0;
        J0x1B7:

        // End:0x28D [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.SentinelAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.SentinelAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x1B7;
        }
    }
    super.SetFromTuneData();
    //return;    
}
