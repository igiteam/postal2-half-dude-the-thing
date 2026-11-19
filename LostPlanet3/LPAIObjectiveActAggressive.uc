class LPAIObjectiveActAggressive extends LPAIObjectiveAttack within LPAIController
    abstract
    config(AI)
    hidecategories(Object,Object);

event OnGenerated()
{
    super.OnGenerated();
    //return;    
}

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Act Aggressive";
    //return ReturnValue;    
}

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

function GetEnemyPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPawn(GetEnemy());
    //return ReturnValue;    
}

function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyInfo.Info.Actor;
    //return ReturnValue;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    // End:0x66
    if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
    {
        SuspendForTime(4.0000000);
        Status = 4;        
    }
    else
    {
        Status = 3;
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

protected function PrePerformObjective()
{
    super.PrePerformObjective();
    //return;    
}

function CmdActAggressive()
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
    // End:0x164
    if(AttackCmdClass != none)
    {
        myCommand = LPAICmd_Attack(AttackCmdClass.static.InitObjectiveCommand(Outer, self));
        // End:0x161
        if(myCommand != none)
        {
            myCommand.SetReturnCmdStatus(CmdStatus);
            myCommand.SetDesiredEnemy(EnemyPawn);
            myCommand.SetSPAIObjective(self);
        }        
    }
    else
    {
        // End:0x1C7
        if(CmdStatus != none)
        {
            LPAICmdStatus_Attack(CmdStatus).Cmd_Attack_Error = 2;
            LPAICmdStatus_Attack(CmdStatus).Cmd_Error = 1;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.Enemy = Pawn(EnemyInfo.Info.Actor);
    Outer.MyLPEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0x186
    if(Outer.MyLPEnemy != none)
    {
        Outer.EngagementTarget = Outer.MyLPEnemy;
        CmdActAggressive(Outer.MyLPEnemy);
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
            return super.IsBetterThan(Other);            
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
    return super.IsBetterThan(Other);
    //return ReturnValue;    
}

function GetDamageDoneByActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x11D
    if(inActor != none)
    {
        I = 0;
        J0x1A:

        // End:0x11D [Loop If]
        if(I < Outer.TargetList.Length)
        {
            // End:0x10F
            if(Outer.TargetList[I].Actor == inActor)
            {
                // End:0x10F
                if(Outer.TargetList[I].LastDamageTime > float(0))
                {
                    return Outer.TargetList[I].RecentDamageDone;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

event GetDamageDoneBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x6F
    if(InAttackTarget.Info.Actor != none)
    {
        return GetDamageDoneByActor(InAttackTarget.Info.Actor);
    }
    return super.GetDamageDoneBy(InAttackTarget);
    //return ReturnValue;    
}

event Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPAIObjective).Update(DeltaTime);
    // End:0x3F
    if(IsActive())
    {
        MyObjectiveManager.ImportantObjectiveAdded();
    }
    //return;    
}

protected function CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
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
            AttackObjective = LPAIObjectiveActAggressive(CurObjective);
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

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, Obj;

    Obj = LPAIObjectiveActAggressive(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x9A
    if(Obj != none)
    {
        Obj.UpdateTarget(InInfo);
        InObjectiveManager.ImportantObjectiveAdded();
    }
    //return;    
}

defaultproperties
{
    MinimumAttackTimeBeforeSwitchingEnemies=10.0000000
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Alerted)
}