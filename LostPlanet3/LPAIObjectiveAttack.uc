class LPAIObjectiveAttack extends LPAIObjective within LPAIController
    abstract
    config(AI)
    hidecategories(Object,Object);

const MAX_ENEMY_RATING = 10000;
const MAX_TIME = 180;
const EnemyUpdateFrequency = 1;

struct native LPAttackCommands
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class EnemyClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AttackCmdClass;

    structdefaultproperties
    {
        EnemyClass=none
        AttackCmdClass=none
    }
};

struct native DebugInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SummedCost;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FlagBearerFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackAccessFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageByFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HelperFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OffMeshFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSinceAttacked;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsCurrent;

    structdefaultproperties
    {
        SummedCost=0.0000000
        PlayerFactor=0.0000000
        FlagBearerFactor=0.0000000
        AttackAccessFactor=0.0000000
        DamageByFactor=0.0000000
        HelperFactor=0.0000000
        OffMeshFactor=0.0000000
        TimeSinceAttacked=0.0000000
        IsCurrent=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackRange[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_HumanPlayer[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_HumanFlagBearer[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_HaveStrikeAccess[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_HaveMeleeAccess[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamagePercentage_Ignore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamagePercentage_Low[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamagePercentage_Medium[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_DamagePercentage_Low[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_DamagePercentage_Medium[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_DamagePercentage_High[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_ForHelpers[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_OffNavMesh[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinimumAttackTimeBeforeSwitchingEnemies[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CanReachZFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_TimePassedSinceLastAttack[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeFor_CostFactor_TimePassedSinceLastAttack[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeFor_CostFactor_TimePassedSinceLastAttack[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackCmdTable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnemyDamagingMeBonus[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeEstimate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DebugData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SuspendTimeOnFaliure;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRangedAttack;

// Export ULPAIObjectiveAttack::execTargetInfoRange(FFrame&, void* const)
native function TargetInfoRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execTargetInfoSeperation(FFrame&, void* const)
native function TargetInfoSeperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetTimeEstimate(FFrame&, void* const)
native event GetTimeEstimate()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCost_DirectMoveToAttackPosition(FFrame&, void* const)
native function GetCost_DirectMoveToAttackPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetTimeForDistance(FFrame&, void* const)
native function GetTimeForDistance()
{
    local /*0x97E50000-0x00000000*/ private float Distance[8388609], ReturnValue;


}

// Export ULPAIObjectiveAttack::execGetMaxSpeed(FFrame&, void* const)
native function GetMaxSpeed()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execTargetInfoAngularRange(FFrame&, void* const)
native function TargetInfoAngularRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetYawRate(FFrame&, void* const)
native function GetYawRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execTimeToFaceTargetInfo(FFrame&, void* const)
native function TimeToFaceTargetInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCost_Summed(FFrame&, void* const)
native event GetCost_Summed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorPlayer(FFrame&, void* const)
native event GetCostFactorPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorFlagBearer(FFrame&, void* const)
native event GetCostFactorFlagBearer()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorAttackAccess(FFrame&, void* const)
native event GetCostFactorAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorDamagedBy(FFrame&, void* const)
native event GetCostFactorDamagedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorForHelpers(FFrame&, void* const)
native event GetCostFactorForHelpers()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorTimePassedSinceLastAttack(FFrame&, void* const)
native event GetCostFactorTimePassedSinceLastAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactor(FFrame&, void* const)
native event GetCostFactor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetDamageDoneBy(FFrame&, void* const)
native event GetDamageDoneBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execGetCostFactorForOffMesh(FFrame&, void* const)
native event GetCostFactorForOffMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execCanHaveStrikeAccessFor(FFrame&, void* const)
protected native event CanHaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execHaveStrikeAccessFor(FFrame&, void* const)
protected native event HaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execCanHaveMeleeAccessFor(FFrame&, void* const)
protected native event CanHaveMeleeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttack::execIsOffNavMesh(FFrame&, void* const)
native event IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event OnGenerated()
{
    super.OnGenerated();
    //return;    
}

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Attack";
    //return ReturnValue;    
}

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609], PawnTarget;

    EnemyInfo.Info = InInfo;
    PawnTarget = Pawn(InInfo.Actor);
    // End:0x104
    if(PawnTarget != none)
    {
        EnemyInfo.TargetRadius = PawnTarget.CylinderComponent.CollisionRadius;
        EnemyInfo.TargetHeight = PawnTarget.CylinderComponent.CollisionHeight;
    }
    TimeUpdated = Outer.WorldInfo.TimeSeconds;
    UpdateRating();
    //return;    
}

function AttemptToFindNewEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCurrentEnemy[9437185], ReturnValue;

    true
    return false;
    //return ReturnValue;    
}

function GetTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutInfo[25165825];

    // End:0x36
    if(IsValid())
    {
        OutInfo = EnemyInfo.Info;        
    }
    else
    {
        OutInfo.Actor = none;
    }
    //return;    
}

function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Status = 4;
    //return;    
}

function OnCommandFinished()
{
    super(SPAIObjective).OnCommandFinished();
    // End:0x6A
    if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
    {
        SuspendForTime(SuspendTimeOnFaliure);
        Status = 4;        
    }
    else
    {
        Status = 3;
    }
    //return;    
}

event ShowDebugInfo()
{
    super(SPAIObjective).ShowDebugInfo();
    //return;    
}

protected event DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x97E50000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    super(SPAIObjective).DisplayDebug(HUD, out_YL, out_YPos);
    Canvas.DrawText((((((((("  Enemy:" $ string(EnemyInfo.Info.Actor)) $ " Time:") $ string(TimeEstimate)) $ " SCost:") $ string(DebugData.SummedCost)) $ " Cur:") $ string(DebugData.IsCurrent)) $ " Switchable :") $ string(CanSwitchEnemies()));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText((((((((("  PlyrF:" $ string(DebugData.PlayerFactor)) $ " AttkF:") $ string(DebugData.AttackAccessFactor)) $ " DmgF:") $ string(DebugData.DamageByFactor)) $ " HlpF:") $ string(DebugData.HelperFactor)) $ " MshF:") $ string(DebugData.OffMeshFactor));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

protected function PrePerformObjective()
{
    super(SPAIObjective).PrePerformObjective();
    Outer.LastAttackObjective = EnemyInfo.Info.Actor;
    TimeOfLastAttack = Outer.myAIPawn.WorldInfo.TimeSeconds;
    //return;    
}

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 3.0000000;
    //return ReturnValue;    
}

function GetAttackCost()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Cost;

    Cost = GetCost_Summed(InAttackTarget);
    DebugData.SummedCost = Cost;
    return Cost * (GetCostFactor(InAttackTarget));
    //return ReturnValue;    
}

function UpdateRating()
{
    local /*0x97E50000-0x00000000*/ private float Cost;

    Cost = GetAttackCost(EnemyInfo);
    Rating = Outer.@NULL - ;
    (float(0) != ) != Rating;
    //return;    
    @NULL
    default.@NULL
    @NULL
}

function CanSwitchEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xAC
    if(IsActive())
    {
        // End:0x5E
        if(Outer.WantsNewEnemy() && LPAICommand(CurrentCommand).IsInterruptible())
        {
            return true;
        }
        // End:0xAC
        if((Outer.WorldInfo.TimeSeconds - ActivationTime) < MinimumAttackTimeBeforeSwitchingEnemies)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

event IsBetterThan()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OtherAttackObjective;

    // End:0x16C
    if(Other != none)
    {
        // End:0x7C
        if(int(Attribute.PriorityCategory) != int(Other.Attribute.PriorityCategory))
        {
            return super(SPAIObjective).IsBetterThan(Other);            
        }
        else
        {
            // End:0xD4
            if(int(Attribute.PriorityCategory) < int(Other.Attribute.PriorityCategory))
            {
                return false;
            }
        }
        OtherAttackObjective = LPAIObjectiveAttack(Other);
        // End:0x16C
        if(OtherAttackObjective != none)
        {
            // End:0x122
            if((IsActive()) && !CanSwitchEnemies())
            {
                return true;                
            }
            else
            {
                // End:0x16C
                if(OtherAttackObjective.IsActive() && !OtherAttackObjective.CanSwitchEnemies())
                {
                    return false;
                }
            }
        }
    }
    return super(SPAIObjective).IsBetterThan(Other);
    //return ReturnValue;    
}

function TimeToReachTargetInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], rangeToTarget, TimeToReach;

    rangeToTarget = TargetInfoSeperation(InAttackTarget);
    // End:0x4F
    if(rangeToTarget <= float(0))
    {
        rangeToTarget = 0.0000000;
        TimeToReach = 0.0000000;        
    }
    else
    {
        TimeToReach = rangeToTarget / (GetMaxSpeed());
    }
    return TimeToReach;
    //return ReturnValue;    
}

static function @NULL CanGenerateNewAttackObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL ObjectiveManager[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL LPObjectiveManager;

    // End:0x9A
    if(!Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        LPObjectiveManager = LPAIObjectiveManager(ObjectiveManager);
        // End:0x9A
        if(LPObjectiveManager != none)
        {
            // End:0x9A
            if(LPObjectiveManager.FrameForLastAttackObjective == Class'SPEngine.SPUtil'.static.GetFrameCounter())
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

static function @NULL AllocateAndAddObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL ObjectiveManager[8388609], InAttributes, ReturnValue, LPObjectiveManager;

    // End:0xC3
    if(CanGenerateNewAttackObjective(ObjectiveManager))
    {
        // End:0xA3
        if(!Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
        {
            LPObjectiveManager = LPAIObjectiveManager(ObjectiveManager);
            // End:0xA3
            if(LPObjectiveManager != none)
            {
                LPObjectiveManager.FrameForLastAttackObjective = Class'SPEngine.SPUtil'.static.GetFrameCounter();
            }
        }
        return super(SPAIObjective).AllocateAndAddObjective(ObjectiveManager, InAttributes);        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

// Export ULPAIObjectiveAttack::execCanBeAttacked(FFrame&, void* const)
protected native event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(Outer.myAIPawn.GetIfGettingBirthed())
    {
        return false;
    }
    // End:0x4B
    if(IsSuspended())
    {
        return false;        
    }
    else
    {
        return CanBeAttacked(EnemyInfo);
    }
    //return ReturnValue;    
}

defaultproperties
{
    AttackRange=300.0000000
    CostFactor_HumanPlayer=0.9000000
    CostFactor_HumanFlagBearer=1.0000000
    CostFactor_HaveStrikeAccess=0.5000000
    CostFactor_HaveMeleeAccess=0.7500000
    DamagePercentage_Ignore=5.0000000
    DamagePercentage_Low=10.0000000
    DamagePercentage_Medium=40.0000000
    CostFactor_DamagePercentage_Low=0.7500000
    CostFactor_DamagePercentage_Medium=0.3000000
    CostFactor_DamagePercentage_High=0.0500000
    CostFactor_ForHelpers=5.0000000
    CostFactor_OffNavMesh=10.0000000
    CanReachZFactor=1.5000000
    CostFactor_TimePassedSinceLastAttack=1.0000000
    MinTimeFor_CostFactor_TimePassedSinceLastAttack=2.0000000
    MaxTimeFor_CostFactor_TimePassedSinceLastAttack=5.0000000
    EnemyInfo=(Info=(Actor=none,Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),LastSeenTime=-1.0000000,LastDamageTime=-1.0000000,RecentDamageDone=0.0000000,PathNotValidTime=-1.0000000,LastAttackTime=-1.0000000,LastAttackCost=0.0000000),TargetVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000),TargetRadius=0.0000000,TargetHeight=0.0000000)
    EnemyDamagingMeBonus=100.0000000
    SuspendTimeOnFaliure=4.0000000
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Aggressive)
}