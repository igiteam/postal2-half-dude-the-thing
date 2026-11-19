class LPAIObjectiveAttackSepia extends LPAIObjectiveAttackActor within LPAIControllerSepia
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MeleeResourceNameIfUseingOne;

event GetCostFactor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Factor;
    local /*0x97E50000-0x00000000*/ private @NULL IsenbergTarget;

    Factor = super(LPAIObjectiveAttack).GetCostFactor(InAttackTarget);
    // End:0xBD
    if(Factor > float(0))
    {
        IsenbergTarget = LPAIPawnVSISS(InAttackTarget.Info.Actor);
        // End:0xBD
        if(IsenbergTarget != none)
        {
            Factor *= IsenbergTarget.TuneDataVsISS.CostReductionFactorSepia;
        }
    }
    return Factor;
    //return ReturnValue;    
}

protected event CanHaveRangedAttackAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x40
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    // End:0x11D
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x11D
        if(inPawn != none)
        {
            // End:0x11D
            if((Outer.LobStrikeDensityResourceName != 'None') && inPawn.AIResourceManager.IsAccessPossible(Outer.LobStrikeDensityResourceName, Outer.myAIPawn))
            {
                return true;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

protected event CanHaveMeleeAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0xEF
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xEF
        if(inPawn != none)
        {
            // End:0xEF
            if((Outer.ShouldUseStrikeResource() && inPawn != none) && inPawn.AIResourceManager != none)
            {
                return inPawn.AIResourceManager.IsAccessPossible(MeleeResourceNameIfUseingOne, Outer.myAIPawn);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    // End:0x67
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        GenerateSingleObjective(OuterController, InObjectiveManager, InAttributes);
        return;
    }
    super.GenerateObjectives(OuterController, InObjectiveManager, InAttributes);
    //return;    
}

defaultproperties
{
    MeleeResourceNameIfUseingOne="SepiaMeleeFormation"
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}