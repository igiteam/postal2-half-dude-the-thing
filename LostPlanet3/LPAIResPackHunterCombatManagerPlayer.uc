class LPAIResPackHunterCombatManagerPlayer extends LPAIResPackHunterCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPBasePlayerPawn(OuterActor);
    // End:0x28D
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataBasePlayerPawn != none)
    {
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToUpdateThePackHunterStaticFormationAttackManager;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToRemoveOutOfDataAttackOptionsInThePackHunterStaticFormationAttackManager;
        iter = 0;
        J0xD6:

        // End:0x1AC [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.PackHunterStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.PackHunterStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0xD6;
        }
        iter = 0;
        J0x1B7:

        // End:0x28D [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.PackHunterAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.PackHunterAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x1B7;
        }
    }
    super.SetFromTuneData();
    //return;    
}
