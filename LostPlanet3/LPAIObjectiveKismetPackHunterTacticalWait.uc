class LPAIObjectiveKismetPackHunterTacticalWait extends LPAIObjective within LPAIControllerPackHunter
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A330000-0x00000000*/ private @NULL LocationToWaitAt[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private float HowCloseToLocationToTryAndStay[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private editfixedsize array MovesToPlay[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private bool bRandomizeWhichMovesToPlay[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private bool bUseAggressiveIndicator[65537];
var(0.25_Pct) /*0x7A330000-0x00000000*/ private bool bHaveValidData[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_PackHunterTacticalWait(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x1FC
    if(bHaveValidData)
    {
        LocationToWaitAt = KismetData.LocationToWaitAt;
        ThingToFocusOnWhenNoEnemy = KismetData.ThingToFocusOnWhenNoEnemy;
        HowCloseToLocationToTryAndStay = KismetData.HowCloseToLocationToTryAndStay;
        HowCloseToLetEnemiesGetBeforeAttacking = KismetData.HowCloseToLetEnemiesGetBeforeAttacking;
        DamageThresholdBeforeEndingCommand = KismetData.DamageThresholdBeforeEndingCommand;
        HowCloseToLetGrenadesGetBeforeAttacking = KismetData.HowCloseToLetGrenadesGetBeforeAttacking;
        bRandomizeWhichMovesToPlay = KismetData.bRandomizeWhichMovesToPlay;
        bUseAggressiveIndicator = KismetData.bUseAggressiveIndicator;
        MovesToPlay = KismetData.MovesToPlay;
        bHaveValidData = (((LocationToWaitAt != none) && HowCloseToLocationToTryAndStay > float(0)) && HowCloseToLetEnemiesGetBeforeAttacking > float(0)) && DamageThresholdBeforeEndingCommand > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetPackHunterTacticalWait', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetPackHunterTacticalWait(CurObjective);
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

    myCommand = Outer.CmdTacticalWait(LocationToWaitAt, ThingToFocusOnWhenNoEnemy, HowCloseToLetEnemiesGetBeforeAttacking, HowCloseToLetGrenadesGetBeforeAttacking, HowCloseToLocationToTryAndStay, DamageThresholdBeforeEndingCommand, bRandomizeWhichMovesToPlay, bUseAggressiveIndicator, MovesToPlay,, 0);
    // End:0xAE
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

defaultproperties
{
    HowCloseToLocationToTryAndStay=200.0000000
    HowCloseToLetEnemiesGetBeforeAttacking=1000.0000000
    DamageThresholdBeforeEndingCommand=50.0000000
    Attribute=(bRemoveWhenFinished=true)
}