class LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC extends LPAIResDefenderRogueFromOrbitSlotEngagement within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x337
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(ThePawn.TuneDataHumanSoldier.DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(ThePawn.TuneDataHumanSoldier.DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        HowOfftenToUpdateTheManager = ThePawn.TuneDataHumanSoldier.HowOfftenToUpdateTheDefenderRogueCombatManager;
        HowOfftenToCleanOutOldOptions = ThePawn.TuneDataHumanSoldier.HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderRogueCombatManager;
        iter = 0;
        J0x180:

        // End:0x256 [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.DefenderRogueStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.DefenderRogueStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x180;
        }
        iter = 0;
        J0x261:

        // End:0x337 [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.DefenderRogueAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.DefenderRogueAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x261;
        }
    }
    super.SetFromTuneData();
    //return;    
}
