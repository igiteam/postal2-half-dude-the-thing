class LPAIObjectiveAttackDefender extends LPAIObjectiveAttackActor within LPAIControllerDefender
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasOutOfReachOfTheFlyGraphLastCheck;

event OnGenerated()
{
    super(LPAIObjectiveAttack).OnGenerated();
    bWasOutOfReachOfTheFlyGraphLastCheck = false;
    //return;    
}

event ShowDebugInfo()
{
    super(LPAIObjectiveAttack).ShowDebugInfo();
    //return;    
}

protected event DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x97E50000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    super(LPAIObjectiveAttack).DisplayDebug(HUD, out_YL, out_YPos);
    Canvas.DrawText("  Is OOR of Fly Graph :" $ string(bWasOutOfReachOfTheFlyGraphLastCheck));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
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

function JoinAdHocSquad()
{
    Outer.GetCurrentAdHocSquadMgrAccess(LPPawn(EnemyInfo.Info.Actor));
    // End:0xB8
    if(Outer.CurrentAdHocSquadMgrRef != none)
    {
        Outer.CurrentAdHocSquadMgrRef.AddToMeToSquad(Outer);
    }
    //return;    
}

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609];

    super.UpdateTarget(InInfo);
    //return;    
}

function UpdateRating()
{
    // End:0x56
    if(Outer.ShouldLeaderMakeDecision())
    {
        Rating = Outer.LetLeaderGiveRatingForAttackObjectiveForThisTarget(EnemyInfo);
        return;
    }
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    // End:0x16B
    /*@Error*/
    // End:0x15A
    if(Outer.DefenderPawn.TargetPawnGivenByLauncher == EnemyInfo.Info.Actor)
    {
        Rating = Outer.@NULL;        
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        /*@Error*/;
        // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 1 & Type:If Position:0x15A
    }
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsValid;

    // End:0x4A
    if((Outer.CurrentObjective == self) && Outer.EngagedInCommittedBehavior())
    {
        return true;
    }
    bIsValid = super.IsValid();
    // End:0x13B
    if(!bIsValid)
    {
        // End:0x13B
        if(((EnemyInfo.Info.Actor != none) && LPBasePlayerPawn(EnemyInfo.Info.Actor) != none) && LPBasePlayerPawn(EnemyInfo.Info.Actor).Controller != none)
        {            
        }
    }
    return bIsValid;
    //return ReturnValue;    
}

protected event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn, StruggleResource;

    // End:0x76
    if(InAttackTarget.Info.Actor == Outer.MyLPEnemy)
    {
        // End:0x76
        if(Outer.EngagedInCommittedBehavior())
        {
            return true;
        }
    }
    inPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0x27F
    if(inPawn != none)
    {
        // End:0x11B
        if(Outer.ShouldLeaderMakeDecision())
        {
            // End:0x119
            if(Outer.LetLeaderMakeStartAttackObjectiveForThisTargetDecision(InAttackTarget))
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
        // End:0x20C
        if(LPPlayerPawn(inPawn) != none)
        {
            StruggleResource = LPAIResourceStruggle(LPPlayerPawn(inPawn).AIResourceManager.GetResource(Outer.StruggleResourceName));
            // End:0x20C
            if(StruggleResource != none)
            {
                // End:0x20C
                if(StruggleResource.IsLocked() || !StruggleResource.IsUsable(LPPlayerPawn(inPawn)))
                {
                    return false;
                }
            }
        }
        // End:0x233
        if(Outer.GetIfPerformingReactiveAttack())
        {
            return false;            
        }
        else
        {
            // End:0x265
            if(!Outer.CanBeMyEnemy(inPawn))
            {
                return false;                
            }
            else
            {
                // End:0x27F
                if(!CanHaveAttackAccess(inPawn))
                {
                    return false;
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event GetCostFactorAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x46
    if(CanHaveOrbitAccessForActor(InAttackTarget.Info.Actor))
    {
        return CostFactor_HaveMeleeAccess;
    }
    return 1.0000000;
    //return ReturnValue;    
}

event GetCostFactorForOffMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

protected function CanHaveOrbitAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function @NULL IsOffFlyGraph()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance, Seperation;
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos;

    Seperation = TargetInfoSeperation(InAttackTarget);
    // End:0x36
    if(Seperation <= AttackRange)
    {
        return false;
    }
    DesiredPos = InAttackTarget.Info.Location;
    BotHandle = SPKynapseFlyingBotHandle(Outer.myAIPawn.myKynapseHandle);
    ReachDistance = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNodeDistanceForAttackObjectiveFlyCanReachCheck;
    // End:0x144
    if(!BotHandle.PathFinder_FlyCanReach(DesiredPos, ReachDistance, 0.0000000))
    {
        return true;
    }
    return false;
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
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue, Obj;

    Obj = LPAIObjectiveAttackDefender(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x9A
    if(Obj != none)
    {
        Obj.UpdateTarget(InInfo);
        InObjectiveManager.ImportantObjectiveAdded();
    }
    return Obj;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}