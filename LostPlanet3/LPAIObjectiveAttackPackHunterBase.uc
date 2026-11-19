class LPAIObjectiveAttackPackHunterBase extends LPAIObjectiveAttackActor within LPAIController
    abstract
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdPHMelee[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsFormationBlocked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasFormationBlocked[536870913];

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609];

    UpdateFormationParameters();
    super.UpdateTarget(InInfo);
    //return;    
}

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Outer.CmdStatus_Attack
    0
    myCommand = super.CmdAttack(EnemyPawn, CmdStatus, CmdOption);
    // End:0xC1
    if(LPAIObjectiveAttackPackHunter_MP(self) == none)
    {
        CmdPHMelee = LPAICmd_PackHunterMelee(myCommand);
        bIsFormationBlocked = TestForBlockedFormation();
        bWasFormationBlocked = bIsFormationBlocked;
        SetCommandParameters(bIsFormationBlocked);
    }
    return myCommand;
    //return ReturnValue;    
}

function UpdateFormationParameters()
{
    bIsFormationBlocked = TestForBlockedFormation();
    // End:0x57
    if(bIsFormationBlocked != bWasFormationBlocked)
    {
        bWasFormationBlocked = bIsFormationBlocked;
        SetCommandParameters(bIsFormationBlocked);
    }
    //return;    
}

function SetCommandParameters()
{
    local /*0x97E50000-0x00000000*/ private bool bIsBlocked[8388609];

    // End:0xEE
    if((IsActive()) && CmdPHMelee != none)
    {
        // End:0x8E
        if(bIsBlocked)
        {
            CmdPHMelee.SetCanStrikeBeforeReachingMeleeSlot(true);
            CmdPHMelee.SetForcedDirectAttack(true);
            CmdPHMelee.DisableMeleeAccess(true);            
        }
        else
        {
            CmdPHMelee.SetCanStrikeBeforeReachingMeleeSlot(true);
            CmdPHMelee.SetForcedDirectAttack(false);
            CmdPHMelee.DisableMeleeAccess(false);
        }
    }
    //return;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    bWasFormationBlocked = false;
    bIsFormationBlocked = false;
    //return;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStrikePossible;

    // End:0x36
    if(bIsFormationBlocked)
    {
        bStrikePossible = CanHaveStrikeAccessForActor(inActor);
        return bStrikePossible;
    }
    return super.CanHaveAttackAccess(inActor);
    //return ReturnValue;    
}

protected function TestForBlockedFormation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsFormationBlockedByPawns(GetEnemyPawn());
    //return ReturnValue;    
}

event @NULL IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos;

    BotHandle = SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle);
    // End:0x29C
    if((BotHandle != none) && !BotHandle.PathFinder_IsLocationInNavMesh(InAttackTarget.Info.Location))
    {
        DesiredPos = InAttackTarget.Info.Location;
        DesiredPos.Z = (InAttackTarget.Info.Location.Z - Pawn(InAttackTarget.Info.Actor).CylinderComponent.CollisionHeight) + Outer.myAIPawn.CylinderComponent.CollisionHeight;
        ReachDistance = AttackRange + InAttackTarget.TargetRadius;
        // End:0x29C
        if(!BotHandle.PathFinder_CanReach(DesiredPos, ReachDistance, Outer.myAIPawn.MaxStepHeight * 2.5000000, 1.0000000))
        {
            return true;            
        }
    }
    return false;
    //return ReturnValue;    
}

function WantsNewEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5E
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return Outer.WantsNewEnemy();
    }
    return true;
    //return ReturnValue;    
}

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x49
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super.GetNotCurrentEnemyPenalty();
    }
    return 0.0000000;
    //return ReturnValue;    
}

function GetTimeEstimate()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Time;
    local /*0x97E50000-0x00000000*/ private @NULL PH, CurrentEnemyPawn;

    Time = super.GetTimeEstimate(InAttackTarget);
    PH = LPAIPawnPackHunter(Outer.myAIPawn);
    // End:0xA7
    if((PH == none) || int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return Time;
    }
    CurrentEnemyPawn = GetEnemyPawn();
    // End:0x164
    if((InAttackTarget.Info.Actor == CurrentEnemyPawn) && Outer.IsEnemyKnockedDown(CurrentEnemyPawn))
    {
        Time += PH.TuneDataPackHunter.TimePenaltyForKnockedDownEnemy;
    }
    return Time;
    //return ReturnValue;    
}
