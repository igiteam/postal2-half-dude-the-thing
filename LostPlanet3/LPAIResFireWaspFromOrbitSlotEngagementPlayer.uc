class LPAIResFireWaspFromOrbitSlotEngagementPlayer extends LPAIResFireWaspFromOrbitSlotEngagement within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPBasePlayerPawn(OuterActor);
    // End:0x337
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataBasePlayerPawn != none)
    {
        MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(CombatManagersPawn.TuneDataBasePlayerPawn.FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks = int(CombatManagersPawn.TuneDataBasePlayerPawn.FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks.GetValue());
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToUpdateTheFireWaspCombatManager;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager;
        iter = 0;
        J0x180:

        // End:0x256 [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.FireWaspStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.FireWaspStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x180;
        }
        iter = 0;
        J0x261:

        // End:0x337 [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.FireWaspAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.FireWaspAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x261;
        }
    }
    super.SetFromTuneData();
    //return;    
}

function ForceOnlyFullPhysicalAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(CombatManagersPawn != none)
    {
        return CombatManagersPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyFullPhysicalAttacks;
    }
    return false;
    //return ReturnValue;    
}

function ForceOnlyRangedLobAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(CombatManagersPawn != none)
    {
        return CombatManagersPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRangedLobAttacks;
    }
    return false;
    //return ReturnValue;    
}
