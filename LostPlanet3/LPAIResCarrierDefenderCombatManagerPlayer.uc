class LPAIResCarrierDefenderCombatManagerPlayer extends LPAIResCarrierDefenderCombatManager within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatManagersPawn;

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStrikeData;

    CombatManagersPawn = LPBasePlayerPawn(OuterActor);
    // End:0x333
    if((CombatManagersPawn != none) && CombatManagersPawn.TuneDataBasePlayerPawn != none)
    {
        HowOfftenToUpdateTheManager = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToUpdateTheCarrierDefenderCombatManager;
        HowOfftenToCleanOutOldOptions = CombatManagersPawn.TuneDataBasePlayerPawn.HowOfftenToRemoveOutOfDataAttackOptionsInTheCarrierDefenderCombatManager;
        TimeBetweenDefenderElementLaunches = CombatManagersPawn.TuneDataBasePlayerPawn.TimeBetweenDefenderElementLaunches.GetValue();
        RandomRangeForDefenderElementLaunchTime = CombatManagersPawn.TuneDataBasePlayerPawn.RandomRangeForDefenderElementLaunchTime.GetValue();
        iter = 0;
        J0x17C:

        // End:0x252 [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.CarrierDefenderStrikeTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.CarrierDefenderStrikeTimeInfoByTypeOfAttackList[iter], newStrikeData);
            StrikeTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x17C;
        }
        iter = 0;
        J0x25D:

        // End:0x333 [Loop If]
        if(iter < CombatManagersPawn.TuneDataBasePlayerPawn.CarrierDefenderAttackTimeInfoByTypeOfAttackList.Length)
        {
            newStrikeData = none;
            Class'LPStrikeTimeData'.static.SetTimeFromTuneData(CombatManagersPawn.TuneDataBasePlayerPawn.CarrierDefenderAttackTimeInfoByTypeOfAttackList[iter], newStrikeData);
            AttackTimeInfoByTypeOfAttackList.AddItem(newStrikeData);            
            ++iter;
            // [Loop Continue]
            goto J0x25D;
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

function ForceNotAllowedToLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(CombatManagersPawn != none)
    {
        return CombatManagersPawn.TuneDataBasePlayerPawn.bCarrier_ForceNotAllowedToLaunchDefenders;
    }
    return false;
    //return ReturnValue;    
}

function ForceOnlyRamAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(CombatManagersPawn != none)
    {
        return CombatManagersPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRamAttacks;
    }
    return false;
    //return ReturnValue;    
}
