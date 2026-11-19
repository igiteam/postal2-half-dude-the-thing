class LPAIResBurrowerCombatManagerHumanNPC extends LPAIResBurrowerCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x252
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MinTimeBetweenAttacks = ThePawn.TuneDataHumanSoldier.MinTimeBetweenBurrowerAttacks.GetValue();
        MaxTimeBetweenAttacks = ThePawn.TuneDataHumanSoldier.MaxTimeBetweenBurrowerAttacks.GetValue();
        HowOfftenToUpdateTheManager = ThePawn.TuneDataHumanSoldier.HowOfftenToUpdateTheBurrowerCombatManager;
        HowOfftenToCleanOutOldOptions = ThePawn.TuneDataHumanSoldier.HowOfftenToRemoveOutOfDateAttackOptionsInTheBurrowerCombatManager;
        iter = 0;
        J0x17C:

        // End:0x252 [Loop If]
        if(iter < ThePawn.TuneDataHumanSoldier.BurrowerStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(ThePawn.TuneDataHumanSoldier.BurrowerStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x17C;
        }
    }
    super.SetFromTuneData();
    //return;    
}
