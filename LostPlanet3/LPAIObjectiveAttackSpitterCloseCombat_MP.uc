class LPAIObjectiveAttackSpitterCloseCombat_MP extends LPAIObjectiveAttackSpitterBase within LPAIControllerSpitter
    config(AI)
    hidecategories(Object,Object);

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return super(LPAIObjectiveAttackActor).GetNotCurrentEnemyPenalty();
    //return ReturnValue;    
}

event IsBetterThan()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7E
    if((IsActive()) && ((Outer.WorldInfo.TimeSeconds - ActivationTime) < float(3)) || !Outer.WantsNewEnemy())
    {
        return true;
    }
    // End:0x126
    if(Other.IsActive() && ((Outer.WorldInfo.TimeSeconds - Other.ActivationTime) < float(3)) || !Outer.WantsNewEnemy())
    {
        return false;
    }
    return super(LPAIObjectiveAttack).IsBetterThan(Other);
    //return ReturnValue;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation;
    local /*0x97E50000-0x00000000*/ private @NULL MyEnemy;
    local /*0x97E50000-0x00000000*/ private float HeightDelta, MyFloorZ, EnemyFloorZ;

    // End:0x11
    if(!super(LPAIObjectiveAttackActor).IsValid())
    {
        return false;
    }
    // End:0x37
    if(!Outer.IsTailIntact())
    {
        return false;
    }
    MyEnemy = GetEnemyPawn();
    // End:0xC4
    if(MyEnemy.IsHiddenByCover(Normal(MyEnemy.Location - Outer.Pawn.Location)))
    {
        return false;
    }
    Seperation = Outer.SeperationToPawn2D(MyEnemy);
    MyFloorZ = Outer.Pawn.Location.Z - Outer.Pawn.CylinderComponent.CollisionHeight;
    EnemyFloorZ = MyEnemy.Location.Z - MyEnemy.CylinderComponent.CollisionHeight;
    HeightDelta = Abs(EnemyFloorZ - MyFloorZ);
    // End:0x27E
    if(HeightDelta > (Outer.SpitterPawn.CylinderComponent.CollisionHeight / float(2)))
    {
        return false;
    }
    // End:0x2FC
    if(IsActive())
    {
        // End:0x2F9
        if(Seperation > Outer.SpitterPawn.TuneDataSpitter.CloseCombatMaxDist.GetValue())
        {
            return false;
        }        
    }
    else
    {
        // End:0x36A
        if(Seperation > Outer.SpitterPawn.TuneDataSpitter.CloseCombatMinDist.GetValue())
        {
            return false;
        }
    }
    // End:0x382
    if(IsOffNavMesh(EnemyInfo))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_SquadOrder)
}