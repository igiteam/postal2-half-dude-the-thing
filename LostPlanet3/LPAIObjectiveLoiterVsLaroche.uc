class LPAIObjectiveLoiterVsLaroche extends LPAIObjectiveAttackActor within LPAIControllerVsLaroche
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
    local /*0x97E50000-0x00000000*/ private @NULL inPawn, lotierAccess;

    // End:0x1E6
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x1E6
        if(inPawn != none)
        {
            // End:0xA5
            if(Outer.LoiterFormationAccess != none)
            {
                // End:0xA2
                if(Outer.LoiterFormationAccess.GetOuterActor() == inActor)
                {
                    return true;
                }                
            }
            else
            {
                // End:0x1E6
                if(((inPawn != none) && inPawn.AIResourceManager != none) && inPawn.AIResourceManager.HasResource(Outer.LoiterFormationResourceName))
                {
                    lotierAccess = inPawn.AIResourceManager.GetAccess(Outer.LoiterFormationResourceName, Outer.myAIPawn);
                    // End:0x1E6
                    if(lotierAccess != none)
                    {
                        Outer.LoiterFormationAccess = lotierAccess;
                        return true;
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}