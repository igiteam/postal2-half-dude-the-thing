class LPAIObjectiveAttackNushiSpore extends LPAIObjectiveAttackDefender within LPAIControllerNushiSpore
    config(AI)
    hidecategories(Object,Object);

event @NULL OnGenerated()
{
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;

    BotHandle = SPKynapseFlyingBotHandle(Outer.myAIPawn.myKynapseHandle);
    ReachDistance = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNodeDistanceForAttackObjectiveFlyCanReachCheck;
    // End:0xC5
    if(!BotHandle.PathFinder_IsWithinNav(ReachDistance))
    {
    }
    super.OnGenerated();
    //return;    
}

protected function PerformNormalAttack()
{
    super.PerformNormalAttack();
    //return;    
}

static function FindAttackCommandFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return super.FindAttackCommandFor(TheEnemy);
    //return ReturnValue;    
}

event GetCostFactorForHelpers()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return super.GetCostFactorForHelpers(InAttackTarget);
    //return ReturnValue;    
}

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609];

    super.UpdateTarget(InInfo);
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsValid();
    //return ReturnValue;    
}

protected event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn, StruggleResource;

    inPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0x1B5
    if(inPawn != none)
    {
        // End:0x142
        if(LPPlayerPawn(inPawn) != none)
        {
            StruggleResource = LPAIResourceStruggle(LPPlayerPawn(inPawn).AIResourceManager.GetResource(Outer.StruggleResourceName));
            // End:0x142
            if(StruggleResource != none)
            {
                // End:0x142
                if(StruggleResource.IsLocked() || !StruggleResource.IsUsable(LPPlayerPawn(inPawn)))
                {
                    return false;
                }
            }
        }
        // End:0x169
        if(Outer.GetIfPerformingReactiveAttack())
        {
            return false;            
        }
        else
        {
            // End:0x19B
            if(!Outer.CanBeMyEnemy(inPawn))
            {
                return false;                
            }
            else
            {
                // End:0x1B5
                if(!CanHaveAttackAccess(inPawn))
                {
                    return false;
                }
            }
        }
    }
    // End:0x1CD
    if(IsOffFlyGraph(InAttackTarget))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.Enemy = Pawn(EnemyInfo.Info.Actor);
    Outer.MyLPEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0x1A3
    if(Outer.MyLPEnemy != none)
    {
        Outer.EngagementTarget = Outer.MyLPEnemy;
        CmdAttack(Outer.MyLPEnemy, Outer.CmdStatus_Orbit);
        // End:0x1A0
        if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
        {
            Status = 4;
        }        
    }
    else
    {
        Status = 4;
    }
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    super.GenerateObjectives(OuterController, InObjectiveManager, InAttributes);
    //return;    
}

static function @NULL FindObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, Actor, ReturnValue;

    return super.FindObjectiveForEnemy(InObjectiveManager, InAttributes, Actor);
    //return ReturnValue;    
}

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue;

    return super.CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, InInfo);
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}