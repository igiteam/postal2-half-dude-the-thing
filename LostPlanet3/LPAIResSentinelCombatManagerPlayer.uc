class LPAIResSentinelCombatManagerPlayer extends LPAIResSentinelCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPBasePlayerPawn(OuterActor);
    // End:0x29C
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataBasePlayerPawn != none)
    {
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToUpdateTheSentinelCombatManager;
        HowOfftenToUpdateTheManager = 0.2500000;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToRemoveOutOfDataAttackOptionsInTheSentinelCombatManager;
        iter = 0;
        J0xE5:

        // End:0x1BB [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.SentinelStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.SentinelStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0xE5;
        }
        iter = 0;
        J0x1C6:

        // End:0x29C [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.SentinelAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.SentinelAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x1C6;
        }
    }
    super.SetFromTuneData();
    //return;    
}
