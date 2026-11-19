class LPAIResFireWaspFromOrbitSlotEngagementVSISS extends LPAIResFireWaspFromOrbitSlotEngagement within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPAIPawnVSISS(OuterActor);
    // End:0x337
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataVsISS != none)
    {
        MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(CombatManagersPawn.TuneDataVsISS.FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(CombatManagersPawn.TuneDataVsISS.FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataVsISS.HowOfftenToUpdateTheFireWaspCombatManager;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataVsISS.HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager;
        iter = 0;
        J0x180:

        // End:0x256 [Loop If]
        if(iter < CombatManagersPawn.TuneDataVsISS.FireWaspStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataVsISS.FireWaspStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x180;
        }
        iter = 0;
        J0x261:

        // End:0x337 [Loop If]
        if(iter < CombatManagersPawn.TuneDataVsISS.FireWaspAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataVsISS.FireWaspAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x261;
        }
    }
    super.SetFromTuneData();
    //return;    
}
