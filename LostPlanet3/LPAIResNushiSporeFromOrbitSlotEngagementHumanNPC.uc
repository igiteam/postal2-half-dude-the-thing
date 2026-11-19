class LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC extends LPAIResNushiSporeFromOrbitSlotEngagement within SPAIResourceManager
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
        HowOfftenToUpdateTheManager = ThePawn.TuneDataHumanSoldier.HowOfftenToUpdateTheNushiSporeCombatManager;
        HowOfftenToCleanOutOldOptions = ThePawn.TuneDataHumanSoldier.HowOfftenToRemoveOutOfDataAttackOptionsInTheNushiSporeCombatManager;
        iter = 0;
        J0xD6:

        // End:0x1AC [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.NushiSporeStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.NushiSporeStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0xD6;
        }
        iter = 0;
        J0x1B7:

        // End:0x28D [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.NushiSporeAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.NushiSporeAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x1B7;
        }
    }
    super.SetFromTuneData();
    //return;    
}
