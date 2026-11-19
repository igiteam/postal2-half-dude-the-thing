class LPAIObjectiveAttackSmartObjects extends LPAIObjectiveAttack within LPAIController
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Interact[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TryAgainTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasStandPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BestStandPosition[536870913];

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Attack Smart Object";
    //return ReturnValue;    
}

protected event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if((InteractionData == none) || !InteractionData.CanBeAttacked(Outer.myAIPawn))
    {
        return false;        
    }
    else
    {
        return bHasStandPosition;
    }
    //return ReturnValue;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x80
    if((Outer.TimeToDelaySmartActorAttackUntil > float(0)) && Outer.WorldInfo.TimeSeconds < Outer.TimeToDelaySmartActorAttackUntil)
    {
        return false;
    }
    // End:0xB0
    if(InteractionData.IsActorToAttackDamagable())
    {
        return super(SPAIObjective).IsValid();        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x31
    if(InteractionData != none)
    {
        return InteractionData.MySmartActor;        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

event GetCost_Summed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Cost;
    local /*0x97E50000-0x00000000*/ private int I;

    Cost = super.GetCost_Summed(InAttackTarget);
    // End:0x12A
    if(!IsActive() || (Outer.WorldInfo.TimeSeconds - self.ActivationTime) < MinimumAttackTimeBeforeSwitchingEnemies)
    {
        I = 0;
        J0x92:

        // End:0x12A [Loop If]
        if(I < Outer.TargetList.Length)
        {
            // End:0x11C
            if(Outer.TargetList[I].LastDamageTime > float(0))
            {
                Cost += float((60 * 1000) / 180);
            }
            ++I;
            // [Loop Continue]
            goto J0x92;
        }
    }
    return Cost;
    //return ReturnValue;    
}

protected event CanHaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return InteractionData.CanBeAttacked(Outer.myAIPawn);
    //return ReturnValue;    
}

protected event HaveStrikeAccessFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return InteractionData.HaveAttackAccess(Outer.myAIPawn);
    //return ReturnValue;    
}

protected function PerformObjective()
{
    // End:0x5C
    if(InteractionData != none)
    {
        CmdAttackSmartObject(InteractionData);
        // End:0x59
        if(int(CmdStatus_Interact.Cmd_Interact_Error) != int(0))
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

function UpdateSmartActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609], InInteractionData;

    TimeUpdated = Outer.WorldInfo.TimeSeconds;
    InteractionData = InInteractionData;
    InInfo.Actor = InteractionData.MySmartActor;
    bHasStandPosition = GetBestPosition(InInteractionData, BestStandPosition);
    // End:0x16E
    if(bHasStandPosition)
    {
        InInfo.Location = BestStandPosition;
        UpdateTarget(InInfo);
        EnemyInfo.TargetRadius = Outer.MyKynapseRadius;
        EnemyInfo.TargetHeight = Outer.MyHeight;
    }
    //return;    
}

function IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !bHasStandPosition;
    //return ReturnValue;    
}

function GetBestPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionData[8388609], Best;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Candidate;
    local /*0x97E50000-0x00000000*/ private float mindistsq, DistSq;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;

    mindistsq = 2147484000.0000000 * float(2147483647);
    bFound = false;
    // End:0x23E
    if(InInteractionData != none)
    {
        I = 0;
        J0x3E:

        // End:0x197 [Loop If]
        if(I < InInteractionData.ActorsToStandOn.Length)
        {
            // End:0x189
            if(InInteractionData.ActorsToStandOn[I] != none)
            {
                Candidate = InInteractionData.ActorsToStandOn[I].Location;
                DistSq = VSizeSq(Candidate - Outer.myAIPawn.Location);
                // End:0x189
                if(DistSq < mindistsq)
                {
                    // End:0x189
                    if(IsStandOnPositionReachable(Candidate))
                    {
                        Best = Candidate;
                        DistSq = mindistsq;
                        bFound = true;
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x3E;
        }
        // End:0x23E
        if(!bFound && InInteractionData.MySmartActor != none)
        {
            Candidate = InInteractionData.MySmartActor.Location;
            // End:0x23E
            if(IsStandOnPositionReachable(Candidate))
            {
                Best = Candidate;
                bFound = true;
            }
        }
    }
    return bFound;
    //return ReturnValue;    
}

function IsStandOnPositionReachable()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    // End:0x51
    if(int(CmdStatus_Interact.Cmd_Interact_Error) != int(0))
    {
        Status = 4;
        SuspendForTime(5.0000000);        
    }
    else
    {
        Status = 3;
    }
    //return;    
}

function CmdAttackSmartObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Interact
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        Outer.AbortCommand(Outer.CommandList);
    }
    LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Interact_Error = 0;
    LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Error = 0;
    myCommand = LPAICmd_AttackSmartObject(Class'LPAICmd_AttackSmartObject'.static.InitObjectiveCommand(Outer, self));
    // End:0x157
    if(myCommand != none)
    {
        myCommand.SetInteractionData(InteractionData);
        myCommand.SetReturnCmdStatus(CmdStatus);        
    }
    else
    {
        // End:0x1BA
        if(CmdStatus != none)
        {
            LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Interact_Error = 1;
            LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Error = 1;
        }
    }
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, Obj, SmartActorInfo, LPOuterController;

    LPOuterController = LPAIController(OuterController);
    // End:0x1B2
    if(LPOuterController != none)
    {
        // End:0x1B1
        foreach LPOuterController.AllAttackbleSmartActor(SmartActorInfo)
        {
            Obj = FindObjectiveForSmartActor(InObjectiveManager, InAttributes, SmartActorInfo.SmartActor);
            // End:0xFE
            if(Obj == none)
            {
                CreateNewObjectiveForSmartActor(InObjectiveManager, InAttributes, SmartActorInfo.TargetInfo, SmartActorInfo.InteractionData);
                // End:0x1B0
                continue;
            }
            // End:0x1B0
            if((OuterController.WorldInfo.TimeSeconds - Obj.TimeUpdated) >= float(1))
            {
                Obj.UpdateSmartActor(SmartActorInfo.TargetInfo, SmartActorInfo.InteractionData);
            }            
        }        
    }
    //return;    
}

static function @NULL FindObjectiveForSmartActor()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, inActor, ReturnValue, CurObjective, AttackObjective;

    // End:0xB5
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveAttackSmartObjects', InAttributes, CurObjective)
    {
        // End:0xB4
        if(CurObjective != none)
        {
            AttackObjective = LPAIObjectiveAttackSmartObjects(CurObjective);
            // End:0xB4
            if(AttackObjective.InteractionData.MySmartActor == inActor)
            {                
                return AttackObjective;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL CreateNewObjectiveForSmartActor()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, InInteractionData, Obj;

    Obj = LPAIObjectiveAttackSmartObjects(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0xA3
    if(Obj != none)
    {
        Obj.UpdateSmartActor(InInfo, InInteractionData);
        InObjectiveManager.ImportantObjectiveAdded();
    }
    //return;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_InteractWithSmartObject'Default__LPAIObjectiveAttackSmartObjects.LPAICmdStatus_InteractWithSmartObject0'
    begin object name=LPAICmdStatus_InteractWithSmartObject0 class=Class'LPAICmdStatus_InteractWithSmartObject'
    end object
    CmdStatus_Interact=LPAICmdStatus_InteractWithSmartObject0
    MinimumAttackTimeBeforeSwitchingEnemies=2.0000000
}