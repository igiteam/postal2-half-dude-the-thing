class LPAIObjectiveKismetAttackPackHunterSolo extends LPAIObjectiveAttackActor within LPAIControllerPackHunter
    config(AI)
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxStepHeight[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OffNavMeshPenalty[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloserPackHunterPenality[131073];
var(0.25_Pct) /*0x7A2A0000-0x00000000*/ private bool bHaveValidData[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinNumberOfStrikeAttemptsBetweenDamageAssessments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxNumberOfStrikeAttemptsBetweenDamageAssessments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyCurrentlyTryingToKill;

function OnCommandAborted()
{
    super(SPAIObjective).OnCommandAborted();
    TurnVeryAggressiveFlagOff();
    //return;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    TurnVeryAggressiveFlagOff();
    //return;    
}

event Abort()
{
    TurnVeryAggressiveFlagOff();
    super(SPAIObjective).Abort();
    //return;    
}

function TurnVeryAggressiveFlagOff()
{
    local /*0x97E50000-0x00000000*/ private @NULL myBrain;

    myBrain = LPAIControllerPackHunter(Outer.myAIPawn.Controller);
    // End:0x76
    if(myBrain != none)
    {
        myBrain.bBeSuperAggressive = false;
    }
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(super.IsValid())
    {
        return Outer.CanBeMyEnemy(EnemyCurrentlyTryingToKill);        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

event InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_PackHunterSoloAttack(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0xBC
    if(bHaveValidData)
    {
        MinNumberOfStrikeAttemptsBetweenDamageAssessments = KismetData.MinNumberOfStrikeAttemptsBetweenDamageAssessments;
        MaxNumberOfStrikeAttemptsBetweenDamageAssessments = KismetData.MaxNumberOfStrikeAttemptsBetweenDamageAssessments;
        bHaveValidData = (MinNumberOfStrikeAttemptsBetweenDamageAssessments > float(0)) && MaxNumberOfStrikeAttemptsBetweenDamageAssessments > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, EnemyCandidate, ReturnValue, Obj, CurObjective;

    // End:0xC8
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetAttackPackHunterSolo', InAttributes, CurObjective)
    {
        Obj = LPAIObjectiveKismetAttackPackHunterSolo(CurObjective);
        // End:0xC7
        if((Obj != none) && Obj.EnemyInfo.Info.Actor == EnemyCandidate)
        {            
            return Obj;
        }        
    }    
    return none;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Obj, EnemyCandidate;

    I = 0;
    J0x0B:

    // End:0x1EE [Loop If]
    if(I < OuterController.TargetList.Length)
    {
        EnemyCandidate = OuterController.TargetList[I].Actor;
        // End:0x1E0
        if((EnemyCandidate != none) && OuterController.CanBeMyEnemy(EnemyCandidate))
        {
            Obj = FindExistingObjective(InObjectiveManager, InAttributes, EnemyCandidate);
            // End:0x19C
            if(Obj != none)
            {
                // End:0x199
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

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue, Obj;

    Obj = LPAIObjectiveKismetAttackPackHunterSolo(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0xBF
    if(Obj != none)
    {
        Obj.EnemyCurrentlyTryingToKill = LPPawn(InInfo.Actor);
        Obj.UpdateTarget(InInfo);
    }
    return Obj;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    CmdSoloAttack(EnemyCurrentlyTryingToKill);
    //return;    
}

function CmdSoloAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], myCommand;
    local /*0x97E50000-0x00000000*/ private class AttackCmdClass;
    local /*0x97E50000-0x00000000*/ private @NULL Me, myBrain;

    Outer.AbortCommand(Outer.CommandList);
    AttackCmdClass = Class'LPAICmd_PackHunterDirectAttack';
    // End:0x226
    if(AttackCmdClass != none)
    {
        myCommand = LPAICmd_PackHunterDirectAttack(AttackCmdClass.static.InitObjectiveCommand(Outer, self));
        Me = LPAIPawnPackHunter(Outer.myAIPawn);
        // End:0x226
        if((Me != none) && myCommand != none)
        {
            myBrain = LPAIControllerPackHunter(Me.Controller);
            // End:0x226
            if(myBrain != none)
            {
                myCommand.SetSPAIObjective(self);
                myCommand.SetReturnCmdStatus(myBrain.CmdStatus_PackHunterAttack);
                myCommand.SetDesiredEnemy(EnemyPawn);
                myCommand.SetMinNumberOfStrikesToAttemptPerAttack(int(MinNumberOfStrikeAttemptsBetweenDamageAssessments));
                myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(int(MaxNumberOfStrikeAttemptsBetweenDamageAssessments));
                myCommand.SetBeSuperAggressive(true);
            }
        }
    }
    //return;    
}

defaultproperties
{
    MaxStepHeight=100.0000000
    OffNavMeshPenalty=100.0000000
    CloserPackHunterPenality=50.0000000
    MinimumAttackTimeBeforeSwitchingEnemies=4.0000000
    Attribute=(bRemoveWhenFinished=true)
}