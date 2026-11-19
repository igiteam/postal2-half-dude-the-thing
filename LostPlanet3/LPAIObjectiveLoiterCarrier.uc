class LPAIObjectiveLoiterCarrier extends LPAIObjectiveAttackActor within LPAIControllerCarrier
    config(AI)
    hidecategories(Object,Object);

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyActor, EnemyPawn;

    EnemyActor = GetEnemy();
    // End:0x9E
    if((EnemyActor != none) && !EnemyActor.IsPendingKill())
    {
        EnemyPawn = GetEnemyPawn();
        // End:0x9C
        if(EnemyPawn != none)
        {
            // End:0x99
            if(Outer.CanBeMyEnemy(EnemyPawn))
            {
                return true;
            }            
        }
        else
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStrikePossible, bMeleeSlotPossible;
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x13F
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xDA
        if((inPawn != none) && inPawn.IsInAttackVolumeFor(Outer.myAIPawn))
        {
            // End:0xCB
            if(inPawn.IsAttackVolumeAccessPossible(Outer.myAIPawn))
            {
                bStrikePossible = true;                
            }
            else
            {
                bStrikePossible = false;
            }            
        }
        else
        {
            bStrikePossible = CanHaveStrikeAccessForActor(inActor);
            // End:0x125
            if(!bStrikePossible)
            {
                bMeleeSlotPossible = CanHaveLoiterFormationAccessForActor(inActor);
            }
        }
        return bStrikePossible || bMeleeSlotPossible;
    }
    return false;
    //return ReturnValue;    
}

protected function CanHaveLoiterFormationAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x137
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x137
        if(inPawn != none)
        {
            // End:0x137
            if(((inPawn != none) && inPawn.AIResourceManager != none) && inPawn.AIResourceManager.HasResource(Outer.LoiterFormationResourceName))
            {
                return inPawn.AIResourceManager.IsAccessPossible(Outer.LoiterFormationResourceName, Outer.myAIPawn);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event GetCost_Summed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Cost, zdiff, attackVolCost;

    Cost = GetTimeEstimate(InAttackTarget);
    attackVolCost = GetCostForBeingInAttackVolume(InAttackTarget.Info.Actor);
    // End:0x193
    if(attackVolCost < 0.1000000)
    {
        zdiff = InAttackTarget.Info.Actor.Location.Z - Outer.myAIPawn.Location.Z;
        Cost += (zdiff * Outer.CarrierPawn.TuneDataCarrier.AttackObjectiveCostPenaltyForZDiff.GetValue());        
    }
    else
    {
        Cost += attackVolCost;
    }
    return Cost;
    //return ReturnValue;    
}

protected function GetCostForBeingInAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x11B
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x11B
        if((inPawn != none) && inPawn.IsInAttackVolumeFor(Outer.myAIPawn))
        {
            // End:0x11B
            if(inPawn.IsAttackVolumeAccessPossible(Outer.myAIPawn))
            {
                return Outer.CarrierPawn.TuneDataCarrier.AttackObjectiveCostPenaltyForAttackingUsingAttackVolume.GetValue();
            }
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}