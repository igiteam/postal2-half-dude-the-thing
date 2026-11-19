class LPAIResCarrierDefenderCombatManagerHumanNPC extends LPAIResCarrierDefenderCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x333
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        HowOfftenToUpdateTheManager = ThePawn.TuneDataHumanSoldier.HowOfftenToUpdateTheCarrierDefenderCombatManager;
        HowOfftenToCleanOutOldOptions = ThePawn.TuneDataHumanSoldier.HowOfftenToRemoveOutOfDataAttackOptionsInTheCarrierDefenderCombatManager;
        TimeBetweenDefenderElementLaunches = ThePawn.TuneDataHumanSoldier.TimeBetweenDefenderElementLaunches.GetValue();
        RandomRangeForDefenderElementLaunchTime = ThePawn.TuneDataHumanSoldier.RandomRangeForDefenderElementLaunchTime.GetValue();
        iter = 0;
        J0x17C:

        // End:0x252 [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.CarrierDefenderStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.CarrierDefenderStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x17C;
        }
        iter = 0;
        J0x25D:

        // End:0x333 [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.CarrierDefenderAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.CarrierDefenderAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x25D;
        }
    }
    super.SetFromTuneData();
    //return;    
}
