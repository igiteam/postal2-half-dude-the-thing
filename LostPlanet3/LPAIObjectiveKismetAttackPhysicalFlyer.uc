class LPAIObjectiveKismetAttackPhysicalFlyer extends LPAIObjective within LPAIControllerMedFlyer
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinNumberOfStrikeAttemptsBetweenDamageAssessments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxNumberOfStrikeAttemptsBetweenDamageAssessments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyCurrentlyTryingToKill;
var(0.25_Pct) /*0x7A2B0000-0x00000000*/ private bool bHaveValidData[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_FlyerPhysicalAttack(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x205
    if(bHaveValidData)
    {
        MinNumberOfStrikeAttemptsBetweenDamageAssessments = KismetData.MinNumberOfStrikeAttemptsBetweenDamageAssessments;
        MaxNumberOfStrikeAttemptsBetweenDamageAssessments = KismetData.MaxNumberOfStrikeAttemptsBetweenDamageAssessments;
        // End:0xF1
        if(LPPawn(KismetData.TheEnemy) != none)
        {
            EnemyCurrentlyTryingToKill = LPPawn(KismetData.TheEnemy);            
        }
        else
        {
            // End:0x1BD
            if((Controller(KismetData.TheEnemy) != none) && LPPawn(Controller(KismetData.TheEnemy).Pawn) != none)
            {
                EnemyCurrentlyTryingToKill = LPPawn(Controller(KismetData.TheEnemy).Pawn);                
            }
            else
            {
                EnemyCurrentlyTryingToKill = none;
            }
        }
        bHaveValidData = ((EnemyCurrentlyTryingToKill != none) && MinNumberOfStrikeAttemptsBetweenDamageAssessments > float(0)) && MaxNumberOfStrikeAttemptsBetweenDamageAssessments > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetAttackPhysicalFlyer', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetAttackPhysicalFlyer(CurObjective);
            // End:0x82
            if(Obj != none)
            {                
                return Obj;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL AllocateAndAddObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, Obj;

    Obj = FindExistingObjective(InObjectiveManager, InAttributes);
    // End:0x54
    if(Obj != none)
    {
        Obj.Abort();
    }
    return super(SPAIObjective).AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return ReturnValue;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = Outer.CmdDirectPhysicalAttackPof(EnemyCurrentlyTryingToKill, int(MinNumberOfStrikeAttemptsBetweenDamageAssessments), int(MaxNumberOfStrikeAttemptsBetweenDamageAssessments));
    // End:0x9C
    if(myCommand != none)
    {
        myCommand.SetBeSuperAggressive(true);
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

defaultproperties
{
    MinNumberOfStrikeAttemptsBetweenDamageAssessments=1.0000000
    MaxNumberOfStrikeAttemptsBetweenDamageAssessments=1.0000000
    Attribute=(bRemoveWhenFinished=true)
}