class LPAIResBurrowerCombatManagerPlayer extends LPAIResBurrowerCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPBasePlayerPawn(OuterActor);
    // End:0x252
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataBasePlayerPawn != none)
    {
        MinTimeBetweenAttacks = CombatManagersPawn.TuneDataBasePlayerPawn.MinTimeBetweenBurrowerAttacks.GetValue();
        MaxTimeBetweenAttacks = CombatManagersPawn.TuneDataBasePlayerPawn.MaxTimeBetweenBurrowerAttacks.GetValue();
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToUpdateTheBurrowerCombatManager;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToRemoveOutOfDateAttackOptionsInTheBurrowerCombatManager;
        iter = 0;
        J0x17C:

        // End:0x252 [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.BurrowerStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.BurrowerStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x17C;
        }
    }
    super.SetFromTuneData();
    //return;    
}
