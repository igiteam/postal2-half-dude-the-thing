class LPAIObjectiveAttackActor extends LPAIObjectiveAttack within LPAIController
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingAttackVolume[536870913];

// Export ULPAIObjectiveAttackActor::execGetCostFactorForHelpers(FFrame&, void* const)
native event GetCostFactorForHelpers()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execGetDamageDoneBy(FFrame&, void* const)
native event GetDamageDoneBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execHaveStrikeAccessForActor(FFrame&, void* const)
native event HaveStrikeAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execHaveStrikeAccessFor(FFrame&, void* const)
protected native event HaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execIsValid(FFrame&, void* const)
native event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execGetEnemy(FFrame&, void* const)
native function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x49
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super.GetNotCurrentEnemyPenalty();
    }
    // End:0x71
    if(Outer.WantsNewEnemy())
    {
        return 0.0000000;
    }
    return super.GetNotCurrentEnemyPenalty();
    //return ReturnValue;    
}

function GetWantsNewEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x44
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return 0.0000000;
    }
    return Outer.myAIPawn.TuneDataAIPawn.WantsNewEnemyPenalty.GetValue();
    //return ReturnValue;    
}

event GetTimeEstimate()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Time;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentEnemyPawn, PotentialEnemyPawn, Dir;

    Time = super.GetTimeEstimate(InAttackTarget);
    // End:0x8B
    if((Outer.myAIPawn == none) || int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return Time;
    }
    CurrentEnemyPawn = LPPawn(Outer.Enemy);
    // End:0x130
    if(Outer.WantsNewEnemy())
    {
        // End:0x130
        if(InAttackTarget.Info.Actor == CurrentEnemyPawn)
        {
            Time += (GetWantsNewEnemyPenalty());
        }
    }
    PotentialEnemyPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0x298
    if((PotentialEnemyPawn != none) && PotentialEnemyPawn.IsInCover())
    {
        Dir = Normal(PotentialEnemyPawn.Location - Outer.myAIPawn.Location);
        // End:0x298
        if(PotentialEnemyPawn.IsHiddenByCover(Dir))
        {
            Time += Outer.myAIPawn.TuneDataAIPawn.TimePenaltyForEnemyInCover.GetValue();
        }
    }
    return Time;
    //return ReturnValue;    
}

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Attack Actor " $ string(EnemyInfo.Info.Actor);
    //return ReturnValue;    
}

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609];

    EnemyInfo.Info = InInfo;
    // End:0xD5
    if(GetActorRadiusAndHeight(InInfo.Actor, EnemyInfo.TargetRadius, EnemyInfo.TargetHeight))
    {
        InInfo.Location = InInfo.Actor.Location;
    }
    super.UpdateTarget(InInfo);
    //return;    
}

function GetEnemyPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPawn(GetEnemy());
    //return ReturnValue;    
}

protected function PerformObjective()
{
    bUsingAttackVolume = false;
    // End:0x25
    if(!PerformAttackVolumeAttack())
    {
        PerformNormalAttack();
    }
    //return;    
}

protected function PerformAttackVolumeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurEnemy;

    CurEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0x204
    if(CurEnemy != none)
    {
        // End:0x204
        if(CurEnemy.IsInAttackVolumeFor(Outer.myAIPawn))
        {
            // End:0x202
            if(CurEnemy.IsAttackVolumeAccessPossible(Outer.myAIPawn))
            {
                Outer.MyLPEnemy = CurEnemy;
                // End:0x1F6
                if(Outer.MyLPEnemy != none)
                {
                    Outer.EngagementTarget = Outer.MyLPEnemy;
                    Outer.CmdAttackUsingAttackVolume(Outer.MyLPEnemy, self);
                    // End:0x1E7
                    if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
                    {
                        Status = 4;                        
                    }
                    else
                    {
                        bUsingAttackVolume = true;
                    }                    
                }
                else
                {
                    Status = 4;
                }
            }
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function PerformNormalAttack()
{
    Outer.Enemy = Pawn(EnemyInfo.Info.Actor);
    Outer.MyLPEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0x186
    if(Outer.MyLPEnemy != none)
    {
        Outer.EngagementTarget = Outer.MyLPEnemy;
        CmdAttack(Outer.MyLPEnemy);
        // End:0x183
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

static function FindAttackCommandFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x135
    if(TheEnemy != none)
    {
        I = 0;
        J0x1A:

        // End:0xB1 [Loop If]
        if(I < default.AttackCmdTable.Length)
        {
            // End:0xA3
            if(ClassIsChildOf(TheEnemy.Class, default.AttackCmdTable[I].EnemyClass))
            {
                return default.AttackCmdTable[I].AttackCmdClass;
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
        I = 0;
        J0xBC:

        // End:0x135 [Loop If]
        if(I < default.AttackCmdTable.Length)
        {
            // End:0x127
            if(default.AttackCmdTable[I].EnemyClass == none)
            {
                return default.AttackCmdTable[I].AttackCmdClass;
            }
            ++I;
            // [Loop Continue]
            goto J0xBC;
        }
    }
    return none;
    //return ReturnValue;    
}

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;
    local /*0x97E50000-0x00000000*/ private class AttackCmdClass;

    Outer.CmdStatus_Attack
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        Outer.AbortCommand(Outer.CommandList);
    }
    AttackCmdClass = FindAttackCommandFor(EnemyPawn);
    // End:0x1E6
    if(AttackCmdClass != none)
    {
        myCommand = LPAICmd_Attack(AttackCmdClass.static.InitObjectiveCommand(Outer, self));
        // End:0x1E3
        if(myCommand != none)
        {
            myCommand.SetReturnCmdStatus(CmdStatus);
            myCommand.SetDesiredEnemy(EnemyPawn);
            myCommand.SetSPAIObjective(self);
            // End:0x1E3
            if(EnemyPawn.Controller != none)
            {
                EnemyPawn.Controller.TriggerEventClass(Class'LPSeqEvent_PlayerHasAggro', Outer.myAIPawn);
            }
        }        
    }
    else
    {
        // End:0x249
        if(CmdStatus != none)
        {
            LPAICmdStatus_Attack(CmdStatus).Cmd_Attack_Error = 2;
            LPAICmdStatus_Attack(CmdStatus).Cmd_Error = 1;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

protected function CanHaveRangedAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x15B
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x15B
        if(inPawn != none)
        {
            // End:0x15B
            if(((Outer.ShouldUseRangedResource() && inPawn != none) && inPawn.AIResourceManager != none) && inPawn.AIResourceManager.HasResource(Outer.RangedResourceName))
            {
                return inPawn.AIResourceManager.IsAccessPossible(Outer.RangedResourceName, Outer.myAIPawn);
            }
        }
    }
    //return ReturnValue;    
}

protected function CanHaveFireAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x14A
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x14A
        if(inPawn != none)
        {
            // End:0x14A
            if((Outer.ShouldUseFireResource() && inPawn.AIResourceManager != none) && inPawn.AIResourceManager.HasResource(Outer.FireResourceName))
            {
                return inPawn.AIResourceManager.IsAccessPossible(Outer.FireResourceName, Outer.myAIPawn);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

// Export ULPAIObjectiveAttackActor::execCanHaveStrikeAccessForActor(FFrame&, void* const)
protected native event CanHaveStrikeAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanHaveMeleeAccessForActor(FFrame&, void* const)
protected native event CanHaveMeleeAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanHaveRangedAttackAccessForActor(FFrame&, void* const)
protected native event CanHaveRangedAttackAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanHaveStrikeAccessFor(FFrame&, void* const)
protected native event CanHaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanHaveMeleeAccessFor(FFrame&, void* const)
protected native event CanHaveMeleeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanHaveAttackAccess(FFrame&, void* const)
protected native event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIObjectiveAttackActor::execCanBeAttacked(FFrame&, void* const)
protected native event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnCommandFinished()
{
    // End:0x92
    if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
    {
        // End:0x92
        if(!bUsingAttackVolume && IsEnemyInAttackVolume())
        {
            Outer.CmdStatus_Attack.Cmd_Attack_Error = 0;
        }
    }
    // End:0xB1
    if(bUsingAttackVolume)
    {
        SuspendTimeOnFaliure = 0.5000000;        
    }
    else
    {
        SuspendTimeOnFaliure = default.SuspendTimeOnFaliure;
    }
    super.OnCommandFinished();
    //return;    
}

protected function IsEnemyInAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurEnemy;

    CurEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0xD3
    if(CurEnemy != none)
    {
        // End:0xD3
        if(CurEnemy.IsInAttackVolumeFor(Outer.myAIPawn))
        {
            // End:0xD3
            if(CurEnemy.IsAttackVolumeAccessPossible(Outer.myAIPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

final function BestEnemySort()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x42
    if(A.LastAttackCost < B.LastAttackCost)
    {
        return 1;        
    }
    else
    {
        // End:0x85
        if(A.LastAttackCost > B.LastAttackCost)
        {
            return -1;
        }
    }
    return 0;
    //return ReturnValue;    
}

function AttemptToFindNewEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCurrentEnemy[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentEnemy, ActualCurrentEnemy, TargetPawn, ATI;

    true
    // End:0x16
    if(!CanSwitchEnemies())
    {
        return false;
    }
    CurrentEnemy = EnemyInfo.Info.Actor;
    ActualCurrentEnemy = CurrentEnemy;
    // End:0x7C
    if(!bIgnoreCurrentEnemy)
    {
        CurrentEnemy = none;
    }
    I = 0;
    J0x87:

    // End:0x3BB [Loop If]
    if(I < Outer.TargetList.Length)
    {
        ATI.Info = Outer.TargetList[I];
        // End:0x284
        if((ATI.Info.Actor != none) && (Outer.WorldInfo.TimeSeconds - ATI.Info.LastSeenTime) < float(1))
        {
            ATI.Info.Location = ATI.Info.Actor.Location;
            ATI.Info.Rotation = ATI.Info.Actor.Rotation;
        }
        // End:0x319
        if(ATI.TargetRadius == float(0))
        {
            GetActorRadiusAndHeight(ATI.Info.Actor, ATI.TargetRadius, ATI.TargetHeight);
        }
        Outer.TargetList[I] = ATI.Info;
        Outer.TargetList[I].LastAttackCost = GetAttackCost(ATI);
        ++I;
        // [Loop Continue]
        goto J0x87;
    }
    // End:0x495
    if((Outer.TargetList.Length == 1) && Outer.TargetList[0].Actor == ActualCurrentEnemy)
    {
        // End:0x493
        if((Outer.WorldInfo.TimeSeconds - TimeUpdated) >= float(1))
        {
            UpdateTarget(Outer.TargetList[0]);
        }
        return false;
    }
    Outer.TargetList.Sort(BestEnemySort);    
    I = 0;
    J0x4D3:

    // End:0x7BC [Loop If]
    if(I < Outer.TargetList.Length)
    {
        // End:0x7AE
        if((Outer.TargetList[I].Actor != CurrentEnemy) && Outer.CanBeMyEnemy(Outer.TargetList[I].Actor))
        {
            TargetPawn = LPPawn(Outer.TargetList[I].Actor);
            // End:0x65B
            if((TargetPawn != none) && Outer.IsTooLongSinceEnemySeen(TargetPawn) || !TargetPawn.IsAliveAndWell())
            {                
            }
            else
            {
                UpdateTarget(Outer.TargetList[I]);
                // End:0x7AC
                if(TargetPawn != ActualCurrentEnemy)
                {
                    Outer.TargetList[I].LastAttackTime = Outer.WorldInfo.TimeSeconds;
                    Outer.AISetMainEnemy(TargetPawn);
                    Outer.AISetFireTarget(TargetPawn);
                    PerformObjective();
                    ActivationTime = Outer.WorldInfo.TimeSeconds;
                    return true;
                }
                return false;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x4D3;
    }
    return false;
    //return ReturnValue;    
}

static function @NULL GenerateSingleObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Obj, EnemyCandidate, MyController, CurrCmd;

    // End:0x24
    if(OuterController.IsAIDisabled())
    {
        return;
    }
    Obj = FindExistingObjectiveOfThisType(InObjectiveManager, InAttributes);
    // End:0xC6
    if(OuterController.TargetList.Length <= 0)
    {
        // End:0xC4
        if(Obj != none)
        {
            Obj.EnemyInfo.Info.Actor = none;
        }
        return;
    }
    // End:0x22F
    if(Obj != none)
    {
        MyController = LPAIController(OuterController);
        CurrCmd = LPAICommand(Obj.CurrentCommand);
        // End:0x22D
        if((CurrCmd == none) || CurrCmd.IsInterruptible())
        {
            // End:0x19B
            if(Obj.AttemptToFindNewEnemy(false))
            {
                MyController.SetWantsNewEnemy(false);                
            }
            else
            {
                // End:0x22D
                if(CurrCmd == none)
                {
                    // End:0x22D
                    if((Obj == LPAIController(OuterController).CurrentObjective) || LPAIController(OuterController).CurrentObjective == none)
                    {
                        Obj.PerformObjective();
                    }
                }
            }
        }
        return;
    }
    // End:0x413
    if(OuterController.TargetList.Length > 0)
    {
        I = 0;
        J0x25F:

        // End:0x3BD [Loop If]
        if(I < OuterController.TargetList.Length)
        {
            EnemyCandidate = Pawn(OuterController.TargetList[I].Actor);
            // End:0x3AF
            if((((EnemyCandidate != none) && OuterController.IsEnemyVisible(EnemyCandidate)) && OuterController.CanBeMyEnemy(EnemyCandidate)) && (FindAttackCommandFor(EnemyCandidate)) != none)
            {
                Obj = CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, OuterController.TargetList[I]);
                // [Explicit Break]
                goto J0x3BD;
            }
            ++I;
            // [Loop Continue]
            goto J0x25F;
        }
        J0x3BD:

        // End:0x413
        if((Obj != none) && OuterController.TargetList.Length > 1)
        {
            Obj.AttemptToFindNewEnemy(false);
        }
    }
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Obj, EnemyCandidate;

    I = 0;
    J0x0B:

    // End:0x209 [Loop If]
    if(I < OuterController.TargetList.Length)
    {
        EnemyCandidate = OuterController.TargetList[I].Actor;
        // End:0x1FB
        if(((EnemyCandidate != none) && OuterController.CanBeMyEnemy(EnemyCandidate)) && (FindAttackCommandFor(EnemyCandidate)) != none)
        {
            Obj = FindObjectiveForEnemy(InObjectiveManager, InAttributes, EnemyCandidate);
            // End:0x1B7
            if(Obj != none)
            {
                // End:0x1B4
                if((OuterController.WorldInfo.TimeSeconds - Obj.TimeUpdated) >= float(1))
                {
                    Obj.UpdateTarget(OuterController.TargetList[I]);
                }                
            }
            else
            {
                CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, OuterController.TargetList[I]);
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

static function @NULL FindObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, Actor, ReturnValue, CurObjective, AttackObjective;

    // End:0xC6
    foreach InObjectiveManager.AllObjectivesWithAttributes(default.Class, InAttributes, CurObjective)
    {
        // End:0xC5
        if(CurObjective != none)
        {
            AttackObjective = LPAIObjectiveAttackActor(CurObjective);
            // End:0xC5
            if(AttackObjective.EnemyInfo.Info.Actor == Actor)
            {                
                return AttackObjective;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL FindExistingObjectiveOfThisType()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, AttackObjective;

    // End:0x74
    foreach InObjectiveManager.AllObjectivesWithAttributes(default.Class, InAttributes, CurObjective)
    {
        // End:0x73
        if(CurObjective != none)
        {
            AttackObjective = LPAIObjectiveAttackActor(CurObjective);            
            return AttackObjective;
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue, Obj;

    Obj = LPAIObjectiveAttackActor(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x9A
    if(Obj != none)
    {
        Obj.UpdateTarget(InInfo);
        InObjectiveManager.ImportantObjectiveAdded();
    }
    return Obj;
    //return ReturnValue;    
}
